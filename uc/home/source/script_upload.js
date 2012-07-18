/*
	[UCenter Home] (C) 2007-2008 Comsenz Inc.
	$Id: script_upload.js 13226 2009-08-24 02:39:06Z zhengqingpeng $
*/

var attachexts = new Array();
var attachwh = new Array();

var insertType = 1;
var thumbwidth = parseInt(60);
var thumbheight = parseInt(60);
var extensions = 'jpg,jpeg,gif,png';
var forms;
var nowUid = 0;
var albumid = 0;
var uploadStat = 0;
var picid = 0;
var aid = 0;
var topicid = 0;
var mainForm;
var successState = false;
var ieVersion = userAgent.substr(userAgent.indexOf('msie') + 5, 3);

function delAttach(id) {
	_$('attachbody').removeChild(_$('attach_' + id).parentNode.parentNode.parentNode);
	if(_$('attachbody').innerHTML == '') {
		addAttach();
	}
	_$('localimgpreview_' + id + '_menu') ? document.body.removeChild(_$('localimgpreview_' + id + '_menu')) : null;
}

function addAttach() {
	newnode = _$('attachbodyhidden').cloneNode(true);
    newnode.style.display = "";
	var id = aid;
	var tags;
	tags = newnode.getElementsByTagName('form');
	for(i in tags) {
		if(tags[i].id == 'upload') {
			tags[i].id = 'upload_' + id;
		}
	}
	tags = newnode.getElementsByTagName('input');
	for(i in tags) {
		if(tags[i].name == 'attach') {
			tags[i].id = 'attach_' + id;
			tags[i].name = 'attach';
			tags[i].onchange = function() {insertAttach(id)};
			tags[i].unselectable = 'on';
		}
		if(tags[i].id == 'albumid') {
			tags[i].id = 'albumid_' + id;
		}
		if(tags[i].id == 'topicid') {
			tags[i].id = 'topicid_' + id;
		}
	}
	tags = newnode.getElementsByTagName('span');
	for(i in tags) {
		if(tags[i].id == 'localfile') {
			tags[i].id = 'localfile_' + id;
		}
	}
	aid++;

	_$('attachbody').appendChild(newnode);
}

addAttach();

function insertAttach(id) {
	var localimgpreview = '';
	var path = _$('attach_' + id).value;
	var ext = getExt(path);
	var re = new RegExp("(^|\\s|,)" + ext + "($|\\s|,)", "ig");
	var localfile = _$('attach_' + id).value.substr(_$('attach_' + id).value.replace(/\\/g, '/').lastIndexOf('/') + 1);

	if(path == '') {
		return;
	}
	if(extensions != '' && (re.exec(extensions) == null || ext == '')) {
		alert('对不起，不支持上传此类扩展名的文件');
		return;
	}
	attachexts[id] = inArray(ext, ['gif', 'jpg', 'jpeg', 'png']) ? 2 : 1;

	var inhtml = '<div class="dgysc"><div class="ysc">';
	if(is_ie || userAgent.indexOf('firefox') >= 1) {
		var picPath = getPath(_$('attach_' + id));
		var imgCache = new Image();
		imgCache.src = picPath;
		inhtml += '<img src="' + picPath +'" width="60" height="80">';
	}
	if(is_ie && typeof no_insert=='undefined' || insertType==0) {
		localfile += '&nbsp;<a href="javascript:;" title="点击这里插入内容中当前光标的位置" onclick="insertAttachimgTag(' + id + ');return false;">[插入]</a>';
	}
	localfile += '&nbsp;<span id="showmsg' + id + '"><a href="javascript:;" onclick="delAttach(' + id + ')">[删除]</a></span>';
	inhtml += '</div><div class="ystx"><p>' + localfile +'</p><p>图片描述</p><textarea name="pic_title" cols="40" rows="2"></textarea></div></div>';
	
	_$('localfile_' + id).innerHTML = inhtml;
	_$('attach_' + id).style.display = 'none';

	addAttach();
}

function getPath(obj){
	if (obj) {
		if (is_ie) {
			obj.select();
			// IE下取得图片的本地路径
			return document.selection.createRange().text;
			
		} else if(is_moz) {
				if (obj.files) {
					// Firefox下取得的是图片的数据
					return typeof(obj.files.item(0).getAsDataURL)=='function' ? obj.files.item(0).getAsDataURL() : obj.files.item(0).mozFullPath;
				}
				return obj.value;
		}
		return obj.value;
	}
}
function inArray(needle, haystack) {
	if(typeof needle == 'string') {
		for(var i in haystack) {
			if(haystack[i] == needle) {
					return true;
			}
		}
	}
	return false;
}

function insertAttachimgTag(id) {
	if(insertType == 0) {
		insertImage(id);
	} else if(is_ie) {
		var picPath = getPath(_$('attach_' + id));
		var imgCache = new Image();
		imgCache.src = picPath;
		edit_insert('<img id="_uchome_localimg_' + id + '" src="' + picPath + '">');
	} else {
		alert('对不起，请在IE浏览器下面使用本功能');
	}
}

function uploadSubmit(obj) {
	obj.disabled = true;
	mainForm = obj.form;
	forms = _$('attachbody').getElementsByTagName("FORM");
	albumid = _$('uploadalbum').value;
	upload();
}

//上传页面
function start_upload() {
	_$('btnupload').disabled = true;
	mainForm = _$('albumresultform');
	forms = _$('attachbody').getElementsByTagName("FORM");
	upload();
}

function upload() {
	if(typeof(forms[nowUid]) == 'undefined') return false;
	var nid = forms[nowUid].id.split('_');
	nid = nid[1];
	if(nowUid>0) {
		var upobj = _$('showmsg'+aid);
		if(uploadStat==1) {
			upobj.innerHTML = '上传成功';
			successState = true;
			var InputNode;
			//两种生成方式，解决浏览器之间的兼容性问题
			try {
				//IE模式下的创建方式,解决常规setAttribute设置属性带来的一些未知的错误
				var InputNode = document.createElement("<input type=\"hidden\" id=\"picid_" + picid + "\" value=\""+ aid +"\" name=\"picids["+picid+"]\">");
			} catch(e) {
				//非IE模式则须要用下列的常规setAttribute设置属性，否则生成的结果不能正常初始化
				var InputNode = document.createElement("input");
				InputNode.setAttribute("name", "picids["+picid+"]");
				InputNode.setAttribute("type", "hidden");
				InputNode.setAttribute("id", "picid_" + picid);
				InputNode.setAttribute("value", aid);
			}
			mainForm.appendChild(InputNode);

		} else {
			upobj.style.color = "#f00";
			upobj.innerHTML = '上传失败 '+uploadStat;
		}
	}
	if(_$('showmsg'+nid) != null) {
		_$('showmsg'+nid).innerHTML = '上传中，请等待(<a href="javascript:;" onclick="forms[nowUid].submit();">重试</a>)';
		_$('albumid_'+nid).value = albumid;
		if(_$('topicid_'+nid)) _$('topicid_'+nid).value = topicid;
		forms[nowUid].submit();
	} else if(nowUid+1 == forms.length) {
		if(typeof (no_insert) != 'undefined') {
			var albumidcheck = parseInt(parent.albumid);
			_$('opalbumid').value = isNaN(albumidcheck)? 0 : albumid;
			_$('optopicid').value = topicid;
			if(!successState) return false;
		}
		mainForm.submit();
	}
	aid = nid;
	nowUid++;
	uploadStat = 0;
}
