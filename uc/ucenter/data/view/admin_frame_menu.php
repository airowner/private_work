<? if(!defined('UC_ROOT')) exit('Access Denied');?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?=UC_CHARSET?>" />
<title>UCenter Administrator's Control Panel</title>
<style type="text/css">
/* common */
*{ word-wrap:break-word; outline:none; }
body{ width:159px; background:#F2F9FD url(images/bg_repx_h.gif) right top no-repeat; color:#666; font:12px "Lucida Grande", Verdana, Lucida, Helvetica, Arial, "宋体" ,sans-serif; }
body, ul{ margin:0; padding:0; }
a{ color:#2366A8; text-decoration:none; }
	a:hover { text-decoration:underline; }
.menu{ position:relative; z-index:20; }
	.menu ul{ position:absolute; top:10px; right:-1px !important; right:-2px; list-style:none; width:150px; background:#F2F9FD url(images/bg_repx_h.gif) right -20px no-repeat; }
		.menu li{ margin:3px 0; *margin:1px 0; height:auto !important; height:24px; overflow:hidden; font-size:14px; font-weight:700; }
		.menu li a{ display:block; margin-right:2px; padding:3px 0 2px 30px; *padding:4px 0 2px 30px; border:1px solid #F2F9FD; background:url(images/bg_repno.gif) no-repeat 10px -40px; color:#666; }
			.menu li a:hover{ text-decoration:none; margin-right:0; border:1px solid #B5CFD9; border-right:1px solid #FFF; background:#FFF; }
		.menu li a.tabon{ text-decoration:none; margin-right:0; border:1px solid #B5CFD9; border-right:1px solid #FFF; background:#FFF url(images/bg_repy.gif) repeat-y; color:#2366A8; }
.footer{ position:absolute; z-index:10; right:13px; bottom:0; padding:5px 0; line-height:150%; background:url(images/bg_repx.gif) 0 -199px repeat-x; font-family:Arial, sans-serif; font-size:10px; }
</style>
<meta content="Comsenz Inc." name="Copyright" />
</head>
<body>
<div class="menu">
	<ul id="leftmenu">
		<li><a href="admin.php?m=frame&a=main" target="main" class="tabon">棣栭〉</a></li>
		<? if($user['allowadminsetting'] || $user['isfounder']) { ?><li><a href="admin.php?m=setting&a=ls" target="main">鍩烘湰璁剧疆</a></li><? } ?>
		<? if($user['allowadminsetting'] || $user['isfounder']) { ?><li><a href="admin.php?m=setting&a=register" target="main">娉ㄥ唽璁剧疆</a></li><? } ?>
		<? if($user['allowadminsetting'] || $user['isfounder']) { ?><li><a href="admin.php?m=setting&a=mail" target="main">閭欢璁剧疆</a></li><? } ?>
		<? if($user['allowadminapp'] || $user['isfounder']) { ?><li><a href="admin.php?m=app&a=ls" target="main">搴旂敤绠＄悊</a></li><? } ?>
		<? if($user['allowadminuser'] || $user['isfounder']) { ?><li><a href="admin.php?m=user&a=ls" target="main">鐢ㄦ埛绠＄悊</a></li><? } ?>
		<? if($user['isfounder']) { ?><li><a href="admin.php?m=admin&a=ls" target="main">绠＄悊鍛