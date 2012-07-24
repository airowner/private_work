/*
	[UCenter Home] (C) 2007-2008 Comsenz Inc.
	$Id: script_common.js 13191 2009-08-18 03:14:55Z xupeng $
*/

var userAgent = navigator.userAgent.toLowerCase();
var is_opera = userAgent.indexOf('opera') != -1 && opera.version();
var is_moz = (navigator.product == 'Gecko') && userAgent.substr(userAgent.indexOf('firefox') + 8, 3);
var is_ie = (userAgent.indexOf('msie') != -1 && !is_opera) && userAgent.substr(userAgent.indexOf('msie') + 5, 3);
var is_safari = (userAgent.indexOf('webkit') != -1 || userAgent.indexOf('safari') != -1);
var note_step = 0;
var note_oldtitle = document.title;
var note_timer;

//iframe包含
if (top.location != location) {
	top.location.href = location.href;
}

function _$(id) {
	return document.getElementById(id);
}

function addEvent (o, e, f) {
	if (window.addEventListener) o.addEventListener(e, f, false);
	else if (window.attachEvent) r = o.attachEvent('on' + e, f);
}
function removeEvent (o, e, f) {
	if (window.removeEventListener) o.removeEventListener(e, f, false);
	else if (window.detachEvent) r = o.detachEvent('on' + e, f);
}

function addSort(obj) {
	if (obj.value == 'addoption') {
 	var newOptDiv = document.createElement('div')
 	newOptDiv.id = obj.id+'_menu';
 	newOptDiv.innerHTML = '<h1>添加</h1><a href="javascript:;" onclick="addOption(\'newsort\', \''+obj.id+'\')" class="float_del">删除</a><div class="popupmenu_inner" style="text-align: center;">名称：<input type="text" name="newsort" size="10" id="newsort" class="t_input" /><input type="button" name="addSubmit" value="创建" onclick="addOption(\'newsort\', \''+obj.id+'\')" class="button" /></div>';
 	newOptDiv.className = 'popupmenu_centerbox';
 	newOptDiv.style.cssText = 'position: absolute; left: 50%; top: 200px; width: 400px; margin-left: -200px;';
 	document.body.appendChild(newOptDiv);
 	_$('newsort').focus();
 	}
}
	
function addOption(sid, aid) {
	var obj = _$(aid);
	var newOption = _$(sid).value;
	_$(sid).value = "";
	if (newOption!=null && newOption!='') {
		var newOptionTag=document.createElement('option');
		newOptionTag.text=newOption;
		newOptionTag.value="new:" + newOption;
		try {
			obj.add(newOptionTag, obj.options[0]); // doesn't work in IE
		} catch(ex) {
			obj.add(newOptionTag, obj.selecedIndex); // IE only
		}
		obj.value="new:" + newOption;
	} else {
		obj.value=obj.options[0].value;
	}
	// Remove newOptDiv
	var newOptDiv = document.getElementById(aid+'_menu');
	var parent = newOptDiv.parentNode;
	var removedChild = parent.removeChild(newOptDiv);
}

function checkAll(form, name) {
	for(var i = 0; i < form.elements.length; i++) {
		var e = form.elements[i];
		if(e.name.match(name)) {
			e.checked = form.elements['chkall'].checked;
		}
	}
}

function cnCode(str) {
	return is_ie && document.charset == 'utf-8' ? encodeURIComponent(str) : str;
}

function isUndefined(variable) {
	return typeof variable == 'undefined' ? true : false;
}

function in_array(needle, haystack) {
	if(typeof needle == 'string' || typeof needle == 'number') {
		for(var i in haystack) {
			if(haystack[i] == needle) {
					return true;
			}
		}
	}
	return false;
}

function strlen(str) {
	return (is_ie && str.indexOf('\n') != -1) ? str.replace(/\r?\n/g, '_').length : str.length;
}

function getExt(path) {
	return path.lastIndexOf('.') == -1 ? '' : path.substr(path.lastIndexOf('.') + 1, path.length).toLowerCase();
}

function doane(event) {
	e = event ? event : window.event;
	if(is_ie) {
		e.returnValue = false;
		e.cancelBubble = true;
	} else if(e) {
		e.stopPropagation();
		e.preventDefault();
	}
}

//验证码
function seccode() {
	var img = 'do.php?ac=seccode&rand='+Math.random();
	document.writeln('<img id="img_seccode" src="'+img+'" align="absmiddle">');
}
function updateseccode() {
	var img = 'do.php?ac=seccode&rand='+Math.random();
	if(_$('img_seccode')) {
		_$('img_seccode').src = img;
	}
}

//缩小图片并添加链接
function resizeImg(id,size) {
    if(!_$(id))  return;
	var theImages = _$(id).getElementsByTagName('img');
	for (i=0; i<theImages.length; i++) {
		theImages[i].onload = function() {
			if (this.width > size) {
				this.style.width = size + 'px';
				if (this.parentNode.tagName.toLowerCase() != 'a') {
					var zoomDiv = document.createElement('div');
					this.parentNode.insertBefore(zoomDiv,this);
					zoomDiv.appendChild(this);
					zoomDiv.style.position = 'relative';
					zoomDiv.style.cursor = 'pointer';
					
					this.title = '点击图片，在新窗口显示原始尺寸';
					
					var zoom = document.createElement('img');
					zoom.src = 'image/zoom.gif';
					zoom.style.position = 'absolute';
					zoom.style.marginLeft = size -28 + 'px';
					zoom.style.marginTop = '5px';
					this.parentNode.insertBefore(zoom,this);
					
					zoomDiv.onmouseover = function() {
						zoom.src = 'image/zoom_h.gif';
					}
					zoomDiv.onmouseout = function() {
						zoom.src = 'image/zoom.gif';
					}
					zoomDiv.onclick = function() {
						window.open(this.childNodes[1].src);
					}
				}
			}
		}
	}
}

//Ctrl+Enter 发布
function ctrlEnter(event, btnId, onlyEnter) {
	if(isUndefined(onlyEnter)) onlyEnter = 0;
	if((event.ctrlKey || onlyEnter) && event.keyCode == 13) {
		_$(btnId).click();
		return false;
	}
	return true;
}
//缩放Textarea
function zoomTextarea(id, zoom) {
	zoomSize = zoom ? 10 : -10;
	obj = _$(id);
	if(obj.rows + zoomSize > 0 && obj.cols + zoomSize * 3 > 0) {
		obj.rows += zoomSize;
		obj.cols += zoomSize * 3;
	}
}

//复制URL地址
function setCopy(_sTxt){
	if(is_ie) {
		clipboardData.setData('Text',_sTxt);
		alert ("网址“"+_sTxt+"”\n已经复制到您的剪贴板中\n您可以使用Ctrl+V快捷键粘贴到需要的地方");
	} else {
		prompt("请复制网站地址:",_sTxt); 
	}
}

//验证是否有选择记录
function ischeck(id, prefix) {
	form = document.getElementById(id);
	for(var i = 0; i < form.elements.length; i++) {
		var e = form.elements[i];
		if(e.name.match(prefix) && e.checked) {
			if(confirm("您确定要执行本操作吗？")) {
				return true;
			} else {
				return false;
			}
		}
	}
	alert('请选择要操作的对象');
	return false;
}
function showPreview(val, id) {
	var showObj = _$(id);
	if(typeof showObj == 'object') {
		showObj.innerHTML = val.replace(/\n/ig, "<br />");
	}
}

function getEvent() {
	if (document.all) return window.event;
	func = getEvent.caller;
	while (func != null) {
		var arg0 = func.arguments[0];
		if (arg0) {
			if((arg0.constructor==Event || arg0.constructor ==MouseEvent) || (typeof(arg0)=="object" && arg0.preventDefault && arg0.stopPropagation)) {
				return arg0;
			}
		}
		func=func.caller;
	}
	return null;
 }
 
function taskScroll(direction) {
	var task = _$('task');
	var offset;
	task.className ? offset = parseInt(task.className) : offset = 0;
	var taskWidth = 0;
	var taskNum = task.getElementsByTagName('li');
	for ( i=0; i<taskNum.length; i++ ) {
		taskWidth += taskNum[i].clientWidth;
	}
	var taskbarWidth = _$('taskbar').clientWidth;
	var startWidth = _$('start').clientWidth;
	var quicklaunchWidth = _$('quicklaunch') ? _$('quicklaunch').clientWidth : 0;
	var taskScrollWidth = _$('taskbar').clientWidth - startWidth - quicklaunchWidth - 70;
	var stop = false;
	_$('scrollright').onmouseout = function(){stop = true;};
	_$('scrollleft').onmouseout = function(){stop = true;};
	function scrollRight() {
		if(!stop && taskWidth > taskScrollWidth) {
			if ( direction == 'right') {
				_$('scrollright').className = '';
				is_ie ? offset += 10 : offset += 3;
				if ( offset > 0 ) { offset = 0; _$('scrollleft').className = 'unuse'; }
			} else {
				_$('scrollleft').className = '';
				is_ie ? offset -= 10 : offset -= 3;
				if ( offset < - (taskWidth - taskScrollWidth) ) { offset = -(taskWidth - taskScrollWidth); _$('scrollright').className = 'unuse'; }
			}
			task.style.left = offset + 'px';
			task.className = offset;
		}
		setTimeout(scrollRight, 5);
	}
	setTimeout(scrollRight, 80);
}

function getTaskWidth() {
	var taskbarWidth = _$('taskbar').clientWidth;
	var startWidth = _$('start').clientWidth;
	var quicklaunchWidth = _$('quicklaunch') ? _$('quicklaunch').clientWidth : 0;
	if ( is_safari ) {
		_$('taskbody').style.width = taskbarWidth - 308  + 'px';
		_$('taskscroll').style.width = taskbarWidth - 350  + 'px';
	} else if (is_ie) {
		_$('taskbody').style.width = taskbarWidth - startWidth - quicklaunchWidth - 2 + 'px';
		_$('taskscroll').style.width = taskbarWidth - startWidth - quicklaunchWidth - 45 + 'px';
	} else  {
		_$('taskbody').style.width = taskbarWidth - startWidth - quicklaunchWidth - 25  + 'px';
		_$('taskscroll').style.width = taskbarWidth - startWidth - quicklaunchWidth - 67  + 'px';
	}
}
 
function copyRow(tbody) {
	var add = false;
	var newnode;
    var s = $('#'+tbody+' span');
	if(s.length == 1 && s.is('hidden')) {
        s.show();
		newnode = s.get(0);
	} else {
		newnode = s.get(0).cloneNode(true);
		add = true;
	}
	tags = newnode.getElementsByTagName('input');
	for(i in tags) {
		if(tags[i].name == 'pics[]') {
			tags[i].value = 'http://';
		}
	}
	if(add) {
		_$(tbody).appendChild(newnode);
	}
}
	
function delRow(obj, tbody) {
    var s = $('#'+tbody+' span');
	if(s.length == 1) {
        s.find('input').each(function(){
            if(this.name == 'pics[]'){
                this.value = 'http://';
            }
        });
        s.hidden();
	} else {
		_$(tbody).removeChild(obj.parentNode);
	}
}

function insertWebImg(obj) {
	if(checkImage(obj.value)) {
		insertImage(obj.value);
		obj.value = 'http://';
	} else {
		alert('图片地址不正确');
	}
}

function checkFocus(target) {
	var obj = _$(target);
	if(!obj.hasfocus) {
		obj.focus();
	}
}
function insertImage(text) {
	text = "\n[img]" + text + "[/img]\n";
	insertContent('message', text)
}

function insertContent(target, text) {
	var obj = _$(target);
	selection = document.selection;
	checkFocus(target);
	if(!isUndefined(obj.selectionStart)) {
		var opn = obj.selectionStart + 0;
		obj.value = obj.value.substr(0, obj.selectionStart) + text + obj.value.substr(obj.selectionEnd);
	} else if(selection && selection.createRange) {
		var sel = selection.createRange();
		sel.text = text;
		sel.moveStart('character', -strlen(text));
	} else {
		obj.value += text;
	}
}

function checkImage(url) {
	var re = /^http\:\/\/.{5,200}\.(jpg|gif|png)$/i
	return url.match(re);
}

//菜单自动出现
var menuTimer = 0;
function calculagraph() {
	menuTimer = window.setTimeout("execOpen();", 1000);
}
function execOpen() {
	openSub(_$('startmenu'), 'app', 0);
}
function stopCalculagraph() {
	window.clearTimeout(menuTimer);
}

//快捷面板
function quick_op(type) {
	_$('quick_tab_doing').className = '';
	_$('quick_tab_blog').className = '';
	_$('quick_tab_upload').className = '';
	_$('quick_tab_thread').className = '';
	_$('quick_tab_share').className = '';
	_$('quick_tab_'+type).className = 'active';
	_$('quick_a_'+type).blur();
	
	var x = new Ajax();
	x.get('do/ac/ajax/op/quick/type/'+type, function(s){
		_$('quick_box').style.display = 'block';
		_$('quick_box').innerHTML = s;
	});
}

function quick_op_close() {
	_$('quick_box').style.display = 'none';
}

function quick_validate(obj) {
    if(_$('seccode')) {
		var code = _$('seccode').value;
		var x = new Ajax();
		x.get('cp.php?ac=common&op=seccode&code=' + code, function(s){
			s = trim(s);
			if(s != 'succeed') {
				alert(s);
				_$('seccode').focus();
           		return false;
			} else {
				obj.form.submit();
				return true;
			}
		});
    } else {
    	obj.form.submit();
    	return true;
    }
}

function trim(str) { 
	return str.replace(/^\s*|\s*$/, '');
	var re = /\s*(\S[^\0]*\S)\s*/; 
	re.exec(str); 
	return RegExp.$1; 
}
// 停止音乐flash
function stopMusic(preID, playerID) {
	var musicFlash = preID.toString() + '_' + playerID.toString();
	if(_$(musicFlash)) {
		_$(musicFlash).SetVariable('closePlayer', 1);
	}
}
// 显示影视、音乐flash
function showFlash(host, flashvar, obj, shareid) {
	var flashAddr = {
		'youku.com' : 'http://player.youku.com/player.php/sid/FLASHVAR=/v.swf',
		'ku6.com' : 'http://player.ku6.com/refer/FLASHVAR/v.swf',
		'youtube.com' : 'http://www.youtube.com/v/FLASHVAR',
		'5show.com' : 'http://www.5show.com/swf/5show_player.swf?flv_id=FLASHVAR',
		'sina.com.cn' : 'http://vhead.blog.sina.com.cn/player/outer_player.swf?vid=FLASHVAR',
		'sohu.com' : 'http://v.blog.sohu.com/fo/v4/FLASHVAR',
		'mofile.com' : 'http://tv.mofile.com/cn/xplayer.swf?v=FLASHVAR',
		'music' : 'FLASHVAR',
		'flash' : 'FLASHVAR'
	};
	var flash = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="480" height="400">'
	    + '<param name="movie" value="FLASHADDR" />'
	    + '<param name="quality" value="high" />'
	    + '<param name="bgcolor" value="#FFFFFF" />'
	    + '<embed width="480" height="400" menu="false" quality="high" src="FLASHADDR" type="application/x-shockwave-flash" />'
	    + '</object>';
	var videoFlash = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="480" height="450">'
        + '<param value="transparent" name="wmode"/>'
		+ '<param value="FLASHADDR" name="movie" />'
		+ '<embed src="FLASHADDR" wmode="transparent" allowfullscreen="true" type="application/x-shockwave-flash" width="480" height="450"></embed>'
		+ '</object>';
	var musicFlash = '<object id="audioplayer_SHAREID" height="24" width="290" data="image/player.swf" type="application/x-shockwave-flash">'
		+ '<param value="image/player.swf" name="movie"/>'
		+ '<param value="autostart=yes&bg=0xCDDFF3&leftbg=0x357DCE&lefticon=0xF2F2F2&rightbg=0xF06A51&rightbghover=0xAF2910&righticon=0xF2F2F2&righticonhover=0xFFFFFF&text=0x357DCE&slider=0x357DCE&track=0xFFFFFF&border=0xFFFFFF&loader=0xAF2910&soundFile=FLASHADDR" name="FlashVars"/>'
		+ '<param value="high" name="quality"/>'
		+ '<param value="false" name="menu"/>'
		+ '<param value="#FFFFFF" name="bgcolor"/>'
	    + '</object>';
	var musicMedia = '<object height="64" width="290" data="FLASHADDR" type="audio/x-ms-wma">'
	    + '<param value="FLASHADDR" name="src"/>'
	    + '<param value="1" name="autostart"/>'
	    + '<param value="true" name="controller"/>'
	    + '</object>';
	var flashHtml = videoFlash;
	var videoMp3 = true;
	if('' == flashvar) {
		alert('音乐地址错误，不能为空');
		return false;
	}
	if('music' == host) {
		var mp3Reg = new RegExp('.mp3$', 'ig');
		var flashReg = new RegExp('.swf$', 'ig');
		flashHtml = musicMedia;
		videoMp3 = false
		if(mp3Reg.test(flashvar)) {
			videoMp3 = true;
			flashHtml = musicFlash;
		} else if(flashReg.test(flashvar)) {
			videoMp3 = true;
			flashHtml = flash;
		}
	}
	flashvar = encodeURI(flashvar);
	if(flashAddr[host]) {
		var flash = flashAddr[host].replace('FLASHVAR', flashvar);
		flashHtml = flashHtml.replace(/FLASHADDR/g, flash);
		flashHtml = flashHtml.replace(/SHAREID/g, shareid);
	}
	
	if(!obj) {
		_$('flash_div_' + shareid).innerHTML = flashHtml;
		return true;
	}
	if(_$('flash_div_' + shareid)) {
		_$('flash_div_' + shareid).style.display = '';
		_$('flash_hide_' + shareid).style.display = '';
		obj.style.display = 'none';
		return true;
	}
	if(flashAddr[host]) {
		var flashObj = document.createElement('div');
		flashObj.id = 'flash_div_' + shareid;
		obj.parentNode.insertBefore(flashObj, obj);
		flashObj.innerHTML = flashHtml;
		obj.style.display = 'none';
		var hideObj = document.createElement('div');
		hideObj.id = 'flash_hide_' + shareid;
		var nodetxt = document.createTextNode("收起");
		hideObj.appendChild(nodetxt);
		obj.parentNode.insertBefore(hideObj, obj);
		hideObj.style.cursor = 'pointer';
		hideObj.onclick = function() {
			if(true == videoMp3) {
				stopMusic('audioplayer', shareid);
				flashObj.parentNode.removeChild(flashObj);
				hideObj.parentNode.removeChild(hideObj);
			} else {
				flashObj.style.display = 'none';
				hideObj.style.display = 'none';
			}
			obj.style.display = '';
		}
	}
}

//显示全部应用
function userapp_open() {
	var x = new Ajax();
	x.get('cp.php?ac=common&op=getuserapp', function(s){
		_$('my_userapp').innerHTML = s;
		_$('a_app_more').className = 'on';
		_$('a_app_more').innerHTML = '收起';
		_$('a_app_more').onclick = function() {
			userapp_close();
		}
	});
}

//关闭全部应用
function userapp_close() {
	var x = new Ajax();
	x.get('cp.php?ac=common&op=getuserapp&subop=off', function(s){
		_$('my_userapp').innerHTML = s;
		_$('a_app_more').className = 'off';
		_$('a_app_more').innerHTML = '展开';
		_$('a_app_more').onclick = function() {
			userapp_open();
		}
	});
}

//滚动
function startMarquee(h, speed, delay, sid) {
	var t = null;
	var p = false;
	var o = _$(sid);
	o.innerHTML += o.innerHTML;
	o.onmouseover = function() {p = true}
	o.onmouseout = function() {p = false}
	o.scrollTop = 0;
	function start() {
	    t = setInterval(scrolling, speed);
	    if(!p) {
			o.scrollTop += 2;
		}
	}
	function scrolling() {
	    if(p) return;
		if(o.scrollTop % h != 0) {
	        o.scrollTop += 2;
	        if(o.scrollTop >= o.scrollHeight/2) o.scrollTop = 0;
	    } else {
	        clearInterval(t);
	        setTimeout(start, delay);
	    }
	}
	setTimeout(start, delay);
}

function readfeed(obj, id) {
	if(Cookie.get("read_feed_ids")) {
		var fcookie = Cookie.get("read_feed_ids");
		fcookie = id + ',' + fcookie;
	} else {
		var fcookie = id;
	}
	Cookie.set("read_feed_ids", fcookie, 48);
	obj.className = 'feedread';
}





//获取页面元素位置
function getElementPos(elementId){
    var ua = navigator.userAgent.toLowerCase(); 
    var isOpera = (ua.indexOf('opera') != -1), isIE = (ua.indexOf('msie') != -1 && !isOpera), isChrome = (ua.indexOf("chrome") != -1), isFF2 = (ua.indexOf('firefox/2') != -1), isFF3 = (ua.indexOf('firefox/3') != -1);
    var el = _$(elementId);
    if(el == null) el = elementId;
    if(el.parentNode === null || el.style.display == 'none') return false;
 
    var parent = null, pos = [], box; 
 
    if(isIE)//IE 
    { 
        box = el.getBoundingClientRect(); 
        var scrollTop = Math.max(document.documentElement.scrollTop, document.body.scrollTop); 
        var scrollLeft = Math.max(document.documentElement.scrollLeft, document.body.scrollLeft); 
 
        return {x:box.left + scrollLeft, y:box.top + scrollTop}; 
    } 
    else if(isFF3 || isOpera)// gecko 
    { 
        box = el.getBoundingClientRect(); 
	//alert(document.documentElement.scrollTop);
        var borderLeft = (el.style.borderLeftWidth)?parseInt(el.style.borderLeftWidth):0; 
        var borderTop = (el.style.borderTopWidth)?parseInt(el.style.borderTopWidth):0; 
        return {x:box.left - borderLeft + document.documentElement.scrollLeft, y:box.top - borderTop + document.documentElement.scrollTop}; 
    }
    else if(isFF2)// gecko 
    { 
	box = document.getBoxObjectFor(el);
	var borderLeft = (el.style.borderLeftWidth)?parseInt(el.style.borderLeftWidth):0; 
	var borderTop = (el.style.borderTopWidth)?parseInt(el.style.borderTopWidth):0; 
	pos = [box.x - borderLeft , box.y - borderTop ];
    }
    else// safari & opera 
    { 
        pos = [el.offsetLeft, el.offsetTop]; 
        parent = el.offsetParent; 
        if (parent != el) { 
            while (parent) { 
                pos[0] += parent.offsetLeft; 
                pos[1] += parent.offsetTop; 
                parent = parent.offsetParent; 
            } 
        } 
        if (ua.indexOf('opera') != -1  
            || ( ua.indexOf('safari') != -1 && el.style.position == 'absolute' ))  
        { 
                pos[0] -= document.body.offsetLeft; 
                pos[1] -= document.body.offsetTop; 
        }  
    } 
         
    if (el.parentNode) { parent = el.parentNode; } 
    else { parent = null; } 
   
    while (parent && parent.tagName != 'BODY' && parent.tagName != 'HTML')  
    { // account for any scrolled ancestors 
        pos[0] -= parent.scrollLeft; 
        pos[1] -= parent.scrollTop; 
   
        if (parent.parentNode) { parent = parent.parentNode; }  
        else { parent = null; } 
    } 
    return {x:pos[0], y:pos[1]}; 
}
function _getel(el){
	while(el.nodeName == "#text"){
		el = el.nextSibling;
	}
	return el;
}
function promptdiv(el){
	el.style.cursor = "pointer";
	var posit = getElementPos(el);
	var nameel = _getel(el.nextSibling);
	var name = nameel.value;
	var summary = _getel(nameel.nextSibling).value;
	var pay = _getel(_getel(nameel.nextSibling).nextSibling);
	var pay_value = "";
	if(pay && pay.tagName == "INPUT")
		pay_value = pay.value;
	creatediv();
	var d=_$('showprompt');
	d.style.width  = "150px";
	var str = "<font color='#f80c3a'><b>"+name+"</b></font><br /><font color='#666'>"+summary+"</font>";
	if(pay && pay.tagName == "INPUT") {
		d.style.width  = "200px";
		str += "<br /><font color='#f80c3a'>"+pay_value+"</font>";
	}
	str += "<br style=\"clear:both\">";
	d.innerHTML = str;
	//d.innerHTML = "<font color='#FFFFFF'><b>"+name+"</b></font><br /><font color='#FF9900'>"+summary+"</font><br style=\"clear:both\">";
	d.style.display= "";
}
function disdiv(el){
	var pos = getElementPos(el);
	//alert(pos.x + " "+pos.y);return;
	el.style.cursor = "pointer";
	var name = el.getAttribute("at");
	var des = el.getAttribute("des");
	creatediv();
	var d=_$('showprompt');
	d.style.top = pos.y+20+"px";
	d.style.left = pos.x+20+"px";
	var str = "<font style='color:#f80c3a;font-size:12px;'><b>"+name+"</b></font><br /><font color='#333'>"+des+"</font><br /><span style='color:#333;border-top:1px dashed #eaac59;padding-top:2px;'>点击图标进入成就详细页面</span>";
	d.innerHTML = str;
	d.style.display= "";
}
function creatediv(){
	var d;
	if(_$('showprompt')==null){
		d = document.createElement("DIV");
		d.style.opacity='0.8';
		d.style.background='#e1ebff';
		d.style.padding = '6px';
		d.style.border = '1px solid #81b2d3';
		d.id="showprompt";
		document.body.appendChild(d);

		d.style.filter = 'alpha(opacity=80)';
	}else{
		d = _$('showprompt');
	}
	d.style.display = "none";
	d.style.position='absolute';
	d.style.zIndex = '99999999';
}
function moveel(evnt){
	var ev = evnt ? evnt : window.event;
	ev = mousePosition(ev);
	if(typeof _$('showprompt')=="undefined" || _$('showprompt').style.display == "none") return;
	var el = _$('showprompt');
	el.style.cursor = "pointer";
	el.style.left = ev.x+10+"px";
	el.style.top = ev.y+10+"px";
}
function mousePosition(ev){
	if(ev.pageX || ev.pageY){
		return {x:ev.pageX, y:ev.pageY};
	}
	return {
	  x:ev.clientX + document.documentElement.scrollLeft - document.documentElement.clientLeft,
	  y:ev.clientY + document.documentElement.scrollTop - document.documentElement.clientTop
	};
}

function showreward() {
	if(Cookie.get('reward_notice_disable')) {
		return false;
	}
	var x = new Ajax();
	x.get('do.php?ac=ajax&op=getreward', function(s){
		if(s) {
			msgwin(s, 2000);
		}
	});
}

function msgwin(s, t) {
	
	var msgWinObj = _$('msgwin');
	if(!msgWinObj) {
		var msgWinObj = document.createElement("div");
		msgWinObj.id = 'msgwin';
		msgWinObj.style.display = 'none';
		msgWinObj.style.position = 'absolute';
		msgWinObj.style.zIndex = '100000';
		_$('append_parent').appendChild(msgWinObj);
	}
	msgWinObj.innerHTML = s;
	msgWinObj.style.display = '';
	msgWinObj.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=0)';
	msgWinObj.style.opacity = 0;
	var sTop = document.documentElement && document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop;
	pbegin = sTop + (document.documentElement.clientHeight / 2);
	pend = sTop + (document.documentElement.clientHeight / 5);
	setTimeout(function () {showmsgwin(pbegin, pend, 0, t)}, 10);
	msgWinObj.style.left = ((document.documentElement.clientWidth - msgWinObj.clientWidth) / 2) + 'px';
	msgWinObj.style.top = pbegin + 'px';
}

function showmsgwin(b, e, a, t) {
	step = (b - e) / 10;
	var msgWinObj = _$('msgwin');
	newp = (parseInt(msgWinObj.style.top) - step);
	if(newp > e) {
		msgWinObj.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=' + a + ')';
		msgWinObj.style.opacity = a / 100;
		msgWinObj.style.top = newp + 'px';
		setTimeout(function () {showmsgwin(b, e, a += 10, t)}, 10);
	} else {
		msgWinObj.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=100)';
		msgWinObj.style.opacity = 1;
		setTimeout('displayOpacity(\'msgwin\', 100)', t);
	}
}

function displayOpacity(id, n) {
	if(!_$(id)) {
		return;
	}
	if(n >= 0) {
		n -= 10;
		_$(id).style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=' + n + ')';
		_$(id).style.opacity = n / 100;
		setTimeout('displayOpacity(\'' + id + '\',' + n + ')', 50);
	} else {
		_$(id).style.display = 'none';
		_$(id).style.filter = 'progid:DXImageTransform.Microsoft.Alpha(opacity=100)';
		_$(id).style.opacity = 1;
	}
}

function display(id) {
	var obj = _$(id);
	obj.style.display = obj.style.display == '' ? 'none' : '';
}

function urlto(url) {
	window.location.href = url;
}

function explode(sep, string) {
	return string.split(sep);
}

function selector(pattern, context) {
	var re = new RegExp('([a-z]*)([\.#:]*)(.*|$)', 'ig');
	var match = re.exec(pattern);
	var conditions = [];	
	if (match[2] == '#')	conditions.push(['id', match[3]]);
	else if(match[2] == '.')	conditions.push(['className', match[3]]);
	else if(match[2] == ':')	conditions.push(['type', match[3]]);	
	var s = match[3].replace(/\[(.*)\]/g,'$1').split('@');
	for(var i=0; i<s.length; i++) {
		var cc = null;
		if (cc = /([\w]+)([=^%!$~]+)(.*)$/.exec(s[i])){
			conditions.push([cc[1], cc[2], cc[3]]);
		}
	}
	var list = (context || document).getElementsByTagName(match[1] || "*");	
	if(conditions) {
		var elements = [];
		var attrMapping = {'for': 'htmlFor', 'class': 'className'};
		for(var i=0; i<list.length; i++) {
			var pass = true;
			for(var j=0; j<conditions.length; j++) {
				var attr = attrMapping[conditions[j][0]] || conditions[j][0];
				var val = list[i][attr] || (list[i].getAttribute ? list[i].getAttribute(attr) : '');
				var pattern = null;
				if(conditions[j][1] == '=') {
					pattern = new RegExp('^'+conditions[j][2]+'$', 'i');
				} else if(conditions[j][1] == '^=') {
					pattern = new RegExp('^' + conditions[j][2], 'i');
				} else if(conditions[j][1] == '$=') {
					pattern = new RegExp(conditions[j][2] + '$', 'i');
				} else if(conditions[j][1] == '%=') {
					pattern = new RegExp(conditions[j][2], 'i');
				} else if(conditions[j][1] == '~=') {
					pattern = new RegExp('(^|[ ])' + conditions[j][2] + '([ ]|$)', 'i');
				}
				if(pattern && !pattern.test(val)) {
					pass = false;
					break;
				}
			}
			if(pass) elements.push(list[i]);
		}
		return elements;
	} else {
		return list;
	}
}

function hiddenprompt(el){
	el.style.cursor = "default";
	var d = _$('showprompt');
	d.style.display= "none";
}
function setfromflash(el, w, h){
	var obj = el.getElementsByTagName("OBJECT")[0];
	if(typeof obj == "undefined"){
		obj = el.getElementsByTagName("embed")[0];
	}else{
		for(var i=0;i<obj.childNodes.length;i++){
			if(obj.childNodes[i].nodeType == 1){
				if(obj.childNodes[i].getAttribute("width") != null)
					obj.childNodes[i].width = w;
				if(obj.childNodes[i].getAttribute("height") != null)
					obj.childNodes[i].height = h;
				if(obj.childNodes[i].getAttribute("src") != null){
					obj.childNodes[i].src = obj.childNodes[i].src + "?" + Math.random();
				}
			}
		}
	}
	obj.width = w;
	obj.height = h;
	return obj;
}
function setflashtext(obj, dw, dh){
	var sp = document.createElement("DIV");
	sp.innerHTML = "<a href='javascript:void(0);' onclick='zoomflash(_$(\"flashdiv\"), "+dw+", "+dh+")' style='font-size:14px;font-weight:bold;color:#FFFFFF'>刷新</a><a href='javascript:void(0);' onclick='$(\"flashdiv\").style.visibility=\"visible\";hiddenprompt(this);' style='font-size:14px;margin-left:10px;font-weight:bold;color:#FFFFFF'>关闭</a>";
	obj.appendChild(sp);
	sp.style.position = "absolute";
	sp.style.right = "30px";
	sp.style.top = "20px";

}
function setzoomsize(dw, dh){
	var client_h = document.documentElement.clientHeight;
	var h = client_h - 100;
	if(h<dh){
		h = dh;
	}
	var w = Math.round(parseFloat(dw/dh.toFixed(2)) * h);
	var client_w = w + 100;
	return {'h':h, 'w':w, 'client_w':client_w, 'client_h':client_h};
}
function zoomflash(els, dw, dh){
	els.style.visibility = "hidden";
	var s = setzoomsize(dw, dh);
	var client_h = s.client_h;
	var h = s.h;
	var w = s.w;
	var client_w = s.client_w;
	creatediv();
	var d=_$('showprompt');
	d.style.width = w  + "px";
	d.style.height = h  + "px";
	d.style.position = "absolute";
	d.style.top = 0;
	d.style.left = (document.documentElement.clientWidth-client_w)/2+"px";
	d.style.padding = "50px";

	d.innerHTML = "";
	var el = els.cloneNode(true);
	var obj = setfromflash(el, w, h);
	d.appendChild(obj);
	setflashtext(d, dw, dh);

	d.style.display = "";
}
function _div(w,h,parentid){
	this.nodragTag = ["A", "INPUT", "SELECT"];
	this.parentid = typeof parentid!="undefined" ? parentid : null;
	this.w=w;
	this.h=h;
	this.cx=this.cy=0;
	this.prox=this.proy=this.Evet=this.Edrag=this.Efollow=this.Edrop=null;
	this.div=$("fd");
	this.showboth=this.bigest=this.allowdrag=false;
};
_div.prototype = {
	chstatus : function(){
		if(this.prox==null&&this.proy==null){
			if(this.bigest==false){
				this.bigest=true;
				var self=this;
				if(this.allowdrag==true) addEvent(this.div, "mousedown", this.Edrag=function(){self.dragdiv()});
				this.div.style.height = "";
			}else{
				this.bigest=false;
				this.cx=this.cy=0;
				this.div.style.display="none";
				if(this.Edrag!=null&&this.allowdrag==true){removeEvent(this.div, "mousedown", this.Edrag);this.Edrag=null}
				if(this.Edrop!=null&&this.allowdrag==true){removeEvent(this.div, "mouseup", this.Edrop);this.Edrop=null}
			}
		}
	},
	_x :function(){
		this.cx = parseInt(this.div.style.width);
		if(!this.bigest && this.cx<this.w) this.div.style.width = (this.cx + Math.ceil((this.w-this.cx)/5)) +"px";
		else if(this.bigest && this.cx>0) this.div.style.width = (this.cx - Math.ceil(this.cx/5)) + "px";
		else{
			clearInterval(this.prox);
			this.prox = null;
		}
		if(this.prox==null && this.showboth==false && !this.bigest){
			var self=this;
			this.proy = setInterval(function(){self._y()},10);
		}
		this.chstatus();
	},
	_y :function(){
		this.cy = parseInt(this.div.style.height);
		if(!this.bigest && this.cy<this.h) this.div.style.height = (this.cy + Math.ceil((this.h-this.cy)/5)) +"px";
		else if(this.bigest && this.cy>0) this.div.style.height = (this.cy - Math.ceil(this.cy/5)) + "px";
		else{
			clearInterval(this.proy);
			this.proy = null;
			
		}
		if(this.proy==null && this.showboth==false && this.bigest){
			var self=this;
			this.prox = setInterval(function(){self._x()},10);
		}
		this.chstatus();
	},
	clear : function(){
		clearInterval(this.prox);
		clearInterval(this.proy);
		clearInterval(this.proxc);
		clearInterval(this.proyc);
		if(this.bigest==false){
			var pos = getElementPos(this.parentid);
			this.div.style.left = pos.x + "px";
			this.div.style.top = pos.y + "px";
		}
	},
	showdiv : function(){
		if(this.bigest==true) return;
		this.clear();
		this.div.style.display = "block";
		this.div.style.width = this.div.style.height = "1px";
		var self = this;
		this.prox = setInterval(function(){self._x()}, 10);
		if(this.showboth == true){
			this.proy = setInterval(function(){self._y()}, 10);
		}
	},
	closediv : function(){
		this.clear();
		this.div.style.height = this.h + "px";
		var self = this;
		this.proy = setInterval(function(){self._y()}, 10);
		if(this.showboth == true){
			this.prox = setInterval(function(){self._x()}, 10);
		}
	},
	dragdiv : function(){
		if(!this.bigest) return;
		this.Evet = window.event ? window.event : this.dragdiv.caller.arguments[0];
		var obj = this.Evet.target ? this.Evet.target : this.Evet.srcElement;
		for (var i in this.nodragTag){
			if(obj.tagName==this.nodragTag[i]) return;
		}
		this.div.style.filter="alpha(opacity=70)";
		this.div.style.opacity = 0.7;
		this._ex=this.Evet.clientX;
		this._ey=this.Evet.clientY;
		if(this.allowdrag==true){
			var self=this;
			addEvent(this.div, "mousemove", this.Efollow=function(){self.follow()});
			addEvent(this.div, "mouseup", this.Edrop=function(){self.drop()});
		}
	},
	follow : function(ev){
		this.Evet = window.event ? window.event : this.follow.caller.arguments[0];
		var mx = this.Evet.clientX-this._ex;
		var my = this.Evet.clientY-this._ey;
		this.div.style.left = parseInt(this.div.style.left) + mx + "px";
		this.div.style.top = parseInt(this.div.style.top) + my + "px";
		this._ex=this.Evet.clientX;
		this._ey=this.Evet.clientY;
	},
	drop : function(){
		this.div.style.filter="alpha(opacity=100)";
		this.div.style.opacity = 1;
		if(this.Efollow!=null&&this.allowdrag==true){removeEvent(this.div, "mousemove", this.Efollow);this.Efollow=null}
	}
}
