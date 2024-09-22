/*
 版权所有 2013-2014 徐州异域创世网络科技有限公司
 保留所有权利
 官方网站：http://www.0516wz.com/
 */

//删除元素值
Array.prototype.remove = function (val) {
    for (var i = 0, n = 0; i < this.length; i++) {
        if (this[i] != val) {
            this[n++] = this[i]
        }
    }
    this.length -= 1
}

//全局对象
var HttpUploaderMgrInstance = null; //上传管理器实例

function HttpUploaderMgr() {
    this.Config = {
        "CabPath": "HttpUpload.cab#version=1,0,0,5", "AddFileUrl": "add", "FileListUrl": "list", "UrlComplete": "complete", "DelFileUrl": "del", "PostUrl": "http://10.33.243.126:81/WebForm1.aspx"
    };
    HttpUploaderMgrInstance = this;
    this.UploaderList = new Object(); //上传项列表
    this.UploadQueue = new Array();		//上传队列
    this.UnUploaderIdList = new Array(); //未上传项ID列表
    this.UploadIdList = new Array(); //正在上传的ID列表
    this.CompleteList = new Array(); //已上传完的HttpUploader列表

    //在外部调用
    this.Load = function () {
        //自动安装CAB
        var acx = '<div style="display:none">';
        //文件上传控件
        acx += '<object id="objHttpPost" classid="clsid:B5645417-7F1C-42A7-B763-2EB60E11A128"';
        acx += ' codebase="' + this.Config["CabPath"] + '" width="1" height="1" ></object>';
        acx += '</div>';
        //上传列表项模板
        acx += '<div class="UploaderItem" id="UploaderTemplate">';
        acx += '<div class="UploaderItemLeft">';
        acx += '<div class="FileInfo">';
        acx += '<div name="fileName" class="FileName top-space">HttpUploader程序开发.pdf</div>';
        acx += '<div name="fileSize" class="FileSize" child="1">100.23MB</div>';
        acx += '</div>';
        acx += '<div class="ProcessBorder top-space"><div name="process" class="Process"></div></div>';
        acx += '<div name="msg" class="PostInf top-space">已上传:15.3MB 速度:20KB/S 剩余时间:10:02:00</div>';
        acx += '</div>';
        acx += '<div class="UploaderItemRight">';
        acx += '<div class="BtnInfo"><span name="btnCancel" class="Btn">取消</span>&nbsp;<span name="btnDel" class="Btn hide">删除</span></div>';
        acx += '<div name="percent" class="ProcessNum">35%</div>';
        acx += '</div>';
        acx += '</div>';
        //分隔线
        acx += '<div class="Line" id="FilePostLine"></div>';
        //上传列表
        acx += '<div id="UploaderPanel">';
        acx += '<div class="toolbar">';
        acx += '<input id="btnAddFiles" type="button" value="选择文件" />';
        acx += '</div>';
        acx += '<div class="content">';
        acx += '<div id="FilePostLister"></div>';
        acx += '</div>';
        acx += '<div class="footer">';
        acx += '<a href="javascript:void(0)" class="Btn" id="lnkClearComplete">清除已完成文件</a>';
        acx += '</div>';
        acx += '</div>';
        document.write(acx);
        //this.SafeCheck();
    };

    //安全检查，在用户关闭网页时自动停止所有上传任务。
    this.SafeCheck = function () {
        window.attachEvent("onbeforeunload", function () {
            if (HttpUploaderMgrInstance.UploadIdList.length > 0) {
                event.returnValue = "您还有程序正在运行，确定关闭？";
            }
        });

        window.attachEvent("onunload", function () {
            if (HttpUploaderMgrInstance.UploadIdList.length > 0) {
                HttpUploaderMgrInstance.StopAll();
            }
        });
    };

    this.Init = function () {
        this.UploaderListDiv = document.getElementById("FilePostLister");
        this.UploaderTemplateDiv = document.getElementById("UploaderTemplate");
        var mgr = this;

        $.ajax({
            type: "POST", async: false, url: this.Config["FileListUrl"], data: {workOrderId: workOrderId, type: uploadType}, success: function (msg) {
                var json = eval("(" + msg + ")");
                for (var i = 0; i < json.length; i++) {
                    mgr.AddResumeFile(json[i]['File_ID'], json[i]['File_LocalPath'], json[i]['File_RemoteName'], json[i]['File_Pos'], json[i]['File_PostedPercent']);
                }
            }, error: function (req, txt, err) {
                alert("向服务器发送信息错误！");
            }, complete: function (req, sta) {
                req = null;
            }
        });
        this.PostFirst();

        //添加多个文件
        obj = document.getElementById("btnAddFiles");
        obj.attachEvent("onclick", function () {
            mgr.OpenFileDialog();
        });
        //清空已完成文件
        obj = document.getElementById("lnkClearComplete");
        if (obj) obj.attachEvent("onclick", function () {
            mgr.ClearComplete();
        });
    };

    //清除已完成文件
    this.ClearComplete = function () {
        for (var i = 0; i < this.CompleteList.length; ++i) {
            this.Delete(this.CompleteList[i].FileID);
        }
        this.CompleteList.length = 0;
    };

    //上传队列是否已满
    this.IsPostQueueFull = function () {
        //目前只支持同时上传三个文件
        if (this.UploadIdList.length > 0) {
            return true;
        }
        return false;
    };

    //添加一个上传ID
    this.AppendUploadId = function (fid) {
        this.UploadIdList.push(fid);
    };

    //添加到上传队列
    this.AppendQueue = function (fid) {
        this.UploadQueue.push(fid);
    };

    //从队列中删除
    this.RemoveQueue = function (fid) {
        if (this.UploadQueue.length < 1) return;

        for (var i = 0, l = this.UploadQueue.length; i < l; ++i) {
            if (this.UploadQueue[i] == fid) {
                this.UploadQueue.remove(fid);
            }
        }
    };

    //添加到未上传ID列表，(停止，出错)
    this.AppendUnUploadIds = function (fid) {
        this.UnUploaderIdList.push(fid);
    };

    //从未上传ID列表删除，(上传完成)
    this.RemoveUnUploadIds = function (fid) {
        if (this.UnUploaderIdList.length < 1) return;

        for (var i = 0, l = this.UnUploaderIdList.length; i < l; ++i) {
            if (this.UnUploaderIdList[i] == fid) {
                this.UnUploaderIdList.remove(fid);
            }
        }
    };

    /*
     从当前上传ID列表中删除指定项。
     此函数将会重新构造一个Array
     */
    this.RemoveUploadId = function (fid) {
        if (this.UploadIdList.length < 1) return;

        for (var i = 0, l = this.UploadIdList.length; i < l; ++i) {
            if (this.UploadIdList[i] == fid) {
                this.UploadIdList.remove(fid);
            }
        }
    };

    //停止所有上传项
    this.StopAll = function () {
        for (var i = 0, l = this.UploadIdList.length; i < l; ++i) {
            this.UploaderList[this.UploadIdList[i]].StopManual();
        }
        this.UploadIdList.length = 0;
    };

    /*
     添加到上传列表
     参数
     fid 上传项ID
     uploaderItem 新的上传对象
     */
    this.AppenToUploaderList = function (fid, uploaderItem) {
        this.UploaderList[fid] = uploaderItem;
    };

    /*
     添加到上传列表层
     1.添加到上传列表层
     2.添加分隔线
     参数：
     fid 上传项ID
     uploaderDiv 新的上传信息层
     返回值：
     新添加的分隔线
     */
    this.AppendToUploaderListDiv = function (fid, uploaderDiv) {
        this.UploaderListDiv.appendChild(uploaderDiv);

        var split = "<div class=\"Line\" style=\"display:block;\" id=\"FilePostLine" + fid + "\"></div>";
        this.UploaderListDiv.insertAdjacentHTML("beforeEnd", split);
        var obj = document.getElementById("FilePostLine" + fid);
        return obj;
    };

    //传送当前队列的第一个文件
    this.PostFirst = function () {
        //上传队列不为空
        if (this.UploadQueue.length > 0) {
            while (this.UploadQueue.length > 0) {
                //上传队列已满
                if (this.IsPostQueueFull()) return;
                var index = this.UploadQueue.shift();
                this.UploaderList[index].Post();
            }
        }
    };

    /*
     验证文件名是否存在
     参数:
     [0]:文件名称
     */
    this.Exist = function () {
        var fn = arguments[0];

        for (a in this.UploaderList) {
            if (this.UploaderList[a].LocalFile == fn) {
                return true;
            }
        }
        return false;
    };

    /*
     根据ID删除上传任务
     参数:
     fid 上传项ID。唯一标识
     */
    this.Delete = function (fid) {
        var obj = this.UploaderList[fid];
        if (null == obj) return;

        this.RemoveQueue(fid); //从队列中删除
        this.RemoveUnUploadIds(fid);//从未上传列表中删除

        //删除div
        this.UploaderListDiv.removeChild(obj.div);
        //删除分隔线
        this.UploaderListDiv.removeChild(obj.spliter);
        obj.LocalFile = "";
        obj.Dispose();
    };

    this.OpenFileDialog = function () {
        var obj = new ActiveXObject("EyuNet.HttpPost.1");
        obj.FileType = "文件|*.*";
        obj.ShowDialog();

        var list = obj.GetSelectedFiles();
        //delete obj;
        if (list.length > 0) {
            var dataObj = eval(list);  //转换为json对象
            for (var i = 0; i < dataObj.length; i++) {
                this.AddFile(dataObj[i]['PathName']);
            }
            this.PostFirst();
        }
    };

    /*
     添加一个续传文件
     参数：
     filePath 本地文件路径(urlencode编码)。D:\\Soft\\QQ2010.exe
     filePos 续传位置。控件将从此位置开始续传数据
     fid 与服务器对应的fid，必须唯一
     remoteFile 远程文件名
     */
    this.AddResumeFile = function (fid, filePath, remoteFile, filePos, postedPercent) {
        //本地文件名称存在
        if (this.Exist(filePath)) return;
        var fileName = filePath.substr(filePath.lastIndexOf("\\") + 1);
        this.AppendQueue(fid);//添加到队列

        var PostUrl = this.Config["PostUrl"];
        var upFile = new HttpUploader(fid, filePath, remoteFile, this, PostUrl);
        var newTable = this.UploaderTemplateDiv.cloneNode(true);
        newTable.style.display = "block";
        newTable.id = "item" + fid;
        var jqDiv = $(newTable);

        var divFileName = jqDiv.find("div[name='fileName']");
        var divfileSize = jqDiv.find("div[name='fileSize']");
        var divProcess = jqDiv.find("div[name='process']");
        var divMsg = jqDiv.find("div[name='msg']");
        var btnDel = jqDiv.find("span[name='btnDel']");
        var btnCancel = jqDiv.find("span[name='btnCancel']");
        var divPercent = jqDiv.find("div[name='percent']");

        divFileName.text(fileName);
        divFileName.attr("title", fileName);
        divfileSize.text(upFile.FileSize);
        upFile.pProcess = divProcess.get(0);
        upFile.pProcess.style.width = postedPercent;
        upFile.pMsg = divMsg.get(0);
        upFile.pMsg.innerText = "";
        upFile.pButton = btnCancel.get(0);
        upFile.pButton.fid = fid;
        upFile.pButton.domid = "item" + fid;
        upFile.pButton.lineid = "FilePostLine" + fid;
        upFile.pButton.attachEvent("onclick", BtnControlClick);
        upFile.pBtnDel = btnDel;
        $(upFile.pBtnDel).click(function () {
            upFile.Delete();
        });
        upFile.pPercent = divPercent.get(0);
        upFile.pPercent.innerText = postedPercent;

        upFile.ATL.FilePos = parseInt(filePos); //设置续传位置

        //添加到上传列表
        this.AppenToUploaderList(fid, upFile);
        //添加到上传列表层
        upFile.spliter = this.AppendToUploaderListDiv(fid, newTable);
        upFile.div = newTable;
        upFile.Ready(); //准备
    };

    /*
     添加一个文件到上传队列
     参数:
     fileName 包含完整路径的文件名称。D:\\Soft\\QQ.exe
     */
    this.AddFile = function (filePath) {
        //本地文件名称存在
        if (this.Exist(filePath)) return;
        var fileName = filePath.substr(filePath.lastIndexOf("\\") + 1);
        var fid = null;
        var remoteFile = null;

        $.ajax({
            type: "POST", async: false, url: this.Config["AddFileUrl"], data: {workOrderId: workOrderId, localName: fileName, localPath: filePath, type: uploadType}, success: function (msg) {
                var json = eval("(" + msg + ")");
                fid = json.File_ID;
                remoteFile = json.File_RemoteName;
            }, error: function (req, txt, err) {
                alert("向服务器发送信息错误！");
            }, complete: function (req, sta) {
                req = null;
            }
        });
        if (fid == null || remoteFile == null) return;

        this.AppendQueue(fid);//添加到队列

        var PostUrl = this.Config["PostUrl"];
        var upFile = new HttpUploader(fid, filePath, remoteFile, this, PostUrl);
        var newTable = this.UploaderTemplateDiv.cloneNode(true);
        newTable.style.display = "block";
        newTable.id = "item" + fid;
        var jqDiv = $(newTable);

        var divFileName = jqDiv.find("div[name='fileName']");
        var divfileSize = jqDiv.find("div[name='fileSize']");
        var divProcess = jqDiv.find("div[name='process']");
        var divMsg = jqDiv.find("div[name='msg']");
        var btnDel = jqDiv.find("span[name='btnDel']");
        var btnCancel = jqDiv.find("span[name='btnCancel']");
        var divPercent = jqDiv.find("div[name='percent']");

        divFileName.text(fileName);
        divFileName.attr("title", fileName);
        divfileSize.text(upFile.FileSize);
        upFile.pProcess = divProcess.get(0);
        upFile.pMsg = divMsg.get(0);
        upFile.pMsg.innerText = "";
        upFile.pButton = btnCancel.get(0);
        upFile.pButton.fid = fid;
        upFile.pButton.domid = "item" + fid;
        upFile.pButton.lineid = "FilePostLine" + fid;
        upFile.pButton.attachEvent("onclick", BtnControlClick);
        upFile.pBtnDel = btnDel;
        $(upFile.pBtnDel).click(function () {
            upFile.Delete();
        });
        upFile.pPercent = divPercent.get(0);
        upFile.pPercent.innerText = "0%";

        //添加到上传列表
        this.AppenToUploaderList(fid, upFile);
        //添加到上传列表层
        upFile.spliter = this.AppendToUploaderListDiv(fid, newTable);
        upFile.div = newTable;
        upFile.Ready(); //准备
    };
}

//单击控制按钮
function BtnControlClick() {
    var obj = event.srcElement; //<a fid=""></a>
    var objup = HttpUploaderMgrInstance.UploaderList[obj.fid];

    switch (obj.innerText) {
        case "暂停":
        case "停止":
            objup.Stop(obj.FileID);
            break;
        case "取消":
        {
            //var lister = HttpUploaderMgrInstance.UploaderListDiv;
            //lister.removeChild(objup.div);
            //lister.removeChild(objup.spliter);
            objup.Stop();
            HttpUploaderMgrInstance.Delete(objup.FileID);

            $.ajax({
                type: "POST", async: false, url: objup.Config["DelFileUrl"], data: {File_ID: objup.FileID}, success: function (msg) {
                    var json = eval("(" + msg + ")");
                }, error: function (req, txt, err) {
                    alert("向服务器发送信息错误！");
                }, complete: function (req, sta) {
                    req = null;
                }
            });
        }
            break;
        case "续传":
            if (!HttpUploaderMgrInstance.IsPostQueueFull()) {
                HttpUploaderMgrInstance.AppendUploadId(objup.FileID);
                objup.Upload();
            }
            else {
                objup.Ready();
                //添加到队列
                HttpUploaderMgrInstance.AppendQueue(objup.FileID);
                objup.pButton.innerText = "停止";
            }
            break;
        case "重试":
            objup.Post();
            break;
    }
    return false;
}

var HttpUploaderErrorCode = {
    "0": "连接服务器错误", "1": "发送数据错误", "2": "接收数据错误", "3": "未设置本地文件", "4": "本地文件不存在", "5": "打开本地文件错误", "6": "不能读取本地文件", "7": "公司未授权", "8": "未设置IP", "9": "域名未授权", "10": "文件大小超过限制"//默认为2G
    //md5
    , "200": "无打打开文件", "201": "文件大小为0"
};

var HttpUploaderState = {
    Ready: 0,
    Posting: 1,
    Stop: 2,
    Error: 3,
    GetNewID: 4,
    Complete: 5,
    WaitContinueUpload: 6,
    None: 7,
    Waiting: 8, MD5Working: 9
};

//文件上传对象
function HttpUploader(fileID, filePath, remoteFile, mgr, PostUrl) {
    this.Manager = mgr; //上传管理器指针
    this.Config = mgr.Config;
    this.State = HttpUploaderState.None;
    this.ATL = new ActiveXObject("EyuNet.HttpPost.1");
    this.ATL.JsObject = this;
    this.ATL.PostUrl = PostUrl
    this.ATL.OnProcess = HttpUploader_Process;
    this.ATL.OnStateChanged = HttpUploader_StateChanged;
    this.ATL.FileID = fileID;
    this.ATL.LocalFile = filePath;
    this.ATL.RemoteFile = remoteFile;
    this.ATL.FilePos = 0;//续传位置。

    this.FileID = fileID;
    this.FileSize = this.ATL.FileSize;  //格式化后的文件大小
    this.FileLength = this.ATL.FileLength;//以字节为单位的字符串
    this.LocalFile = filePath;
    this.fid = fileID; //与服务器数据库对应的fid

    //准备
    this.Ready = function () {
        this.pMsg.innerText = "正在上传队列中等待...";
        this.State = HttpUploaderState.Ready;
    };

    //上传
    this.Post = function () {
        this.Manager.AppendUploadId(this.FileID);
        this.Upload();
    };

    //上传
    this.Upload = function () {
        this.pButton.style.display = "";
        this.pButton.innerText = "停止";
        this.pBtnDel.hide();
        this.State = HttpUploaderState.Posting;
        this.ATL.Post();
    };

    //启动下一个传输
    this.PostNext = function () {
        if (this.Manager.IsPostQueueFull()) return; //上传队列已满

        if (this.Manager.UploadQueue.length > 0) {
            var index = this.Manager.UploadQueue.shift();
            var obj = this.Manager.UploaderList[index];

            //空闲状态
            if (HttpUploaderState.Ready == obj.State) {
                obj.Post();
            }
        } //全部上传完成
        else {
            if (this.Manager.UnUploaderIdList.join("").length < 1) {
                //alert("所有文件上传完毕。");
            }
        }
    };

    //手动停止，一般在StopAll中调用
    this.StopManual = function () {
        if (HttpUploaderState.Posting == this.State) {
            this.pButton.innerText = "续传";
            this.pMsg.innerText = "传输已停止....";
            this.ATL.Stop();
            this.State = HttpUploaderState.Stop;
        }
    };

    //停止传输，一般在用户点击停止按钮时调用
    this.Stop = function () {
        if (HttpUploaderState.Ready == this.State) {
            this.pButton.innerText = "续传";
            this.pBtnDel.show();
            this.pMsg.innerText = "传输已停止....";
            this.State = HttpUploaderState.Stop;
            this.Manager.RemoveQueue(this.FileID);
            this.Manager.AppendUnUploadIds(this.FileID);//添加到未上传列表
            this.PostNext();
            return;
        }

        this.pButton.innerText = "续传";
        this.pBtnDel.show();
        this.pMsg.innerText = "传输已停止....";
        this.State = HttpUploaderState.Stop;

        this.ATL.Stop();
        //从上传列表中删除
        this.Manager.RemoveUploadId(this.FileID);
        //添加到未上传列表
        this.Manager.AppendUnUploadIds(this.FileID);//添加到未上传列表
        //传输下一个
        this.PostNext();
    };

    //删除，一般在用户点击"删除"按钮时调用
    this.Delete = function () {
        $.ajax({
            type: "POST", async: false, url: this.Config["DelFileUrl"], data: {File_ID: this.FileID}, success: function (msg) {

            }, error: function (req, txt, err) {
                alert("向服务器发送信息错误！");
            }, complete: function (req, sta) {
                req = null;
            }
        });

        this.Dispose();
        this.Manager.Delete(this.FileID);
    };

    //释放内存
    this.Dispose = function () {
        //delete this.ATL;
    };
}

//上传完成，向服务器传送信息
function HttpUploader_Complete(obj) {
    obj.pButton.style.display = "none";
    obj.pProcess.style.width = "100%";
    obj.pPercent.innerText = "100%";
    obj.pMsg.innerText = "上传完成";
    obj.Manager.CompleteList.push(obj);
    obj.State = HttpUploaderState.Complete;
    //从上传列表中删除
    obj.Manager.RemoveUploadId(obj.FileID);
    //从未上传列表中删除
    obj.Manager.RemoveUnUploadIds(obj.FileID);
    obj.Dispose();

    $.ajax({
        type: "POST", url: obj.Config["UrlComplete"], data: {File_ID: obj.fid}, success: function (msg) {
            obj.PostNext();
        }, error: function (req, txt, err) {
            alert("向服务器发送Complete信息错误！");
        }, complete: function (req, sta) {
            req = null;
        }
    });
}

//传输进度。频率为每秒调用一次
function HttpUploader_Process(obj, speed, postedLength, percent, time) {
    obj.pPercent.innerText = percent;
    obj.pProcess.style.width = percent;
    var str = "已上传:" + postedLength + " 速度:" + speed + "/S 剩余时间:" + time;
    obj.pMsg.innerText = str;
}

/*
 HUS_Leisure			=0	//空闲
 ,HUS_Uploading		=1	//上传中
 ,HUS_Stop  			=2	//停止
 ,HUS_UploadComplete	=3	//传输完毕
 ,HUS_Error 			=4	//错误
 ,HUS_Connected 		=5	//服务器已连接
 ,HUS_Md5Working		=6	//MD5计算中
 ,HUS_Md5Complete	=7	//MD5计算完毕
 */
function HttpUploader_StateChanged(obj, state) {
    switch (state) {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
        case 3:
            HttpUploader_Complete(obj);
            break;
        case 4:
            break;
        case 5:
            break;
        case 6:
            break;
        case 7:
            break;
    }
}