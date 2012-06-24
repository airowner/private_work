<?php if(!defined('IN_UCHOME')) exit('Access Denied');?><?php subtplcheck('template/default/showmessage|template/default/header|template/default/footer', '1340553944', 'template/default/showmessage');?><?php $_TPL['nosidebar']=1; ?>
<?php if(empty($_SGLOBAL['inajax'])) { ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=<?=$_SC['charset']?>" />
<meta http-equiv="x-ua-compatible" content="ie=7" />
<title><?php if($_TPL['titles']) { ?><?php if(is_array($_TPL['titles'])) { foreach($_TPL['titles'] as $value) { ?><?php if($value) { ?><?=$value?> - <?php } ?><?php } } ?><?php } ?><?php if($_SN[$space['uid']]) { ?><?=$_SN[$space['uid']]?> - <?php } ?><?=$_SCONFIG['sitename']?></title>
<link rel="stylesheet" type="text/css" href="<?=$_USER_SC['domain']?>css/public.css" />
<script language="javascript" type="text/javascript" src="source/script_cookie.js"></script>
<script language="javascript" type="text/javascript" src="source/script_common.js"></script>
<script language="javascript" type="text/javascript" src="source/script_menu.js"></script>
<script language="javascript" type="text/javascript" src="source/script_ajax.js"></script>
<script language="javascript" type="text/javascript" src="source/script_face.js"></script>
<script language="javascript" type="text/javascript" src="source/script_manage.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="<?=$_USER_SC['domain']?>js/png.js"></script>
<script type="text/javascript">EvPNG.fix('img,div,h3');</script>
<![endif]-->
<script type="text/javascript" src="<?=$_USER_SC['domain']?>js/jquery-min.js"></script>
<script type="text/javascript" src="<?=$_USER_SC['domain']?>js/tabs.js"></script>

<style type="text/css">
    /*
@import url(template/default/style.css);
<?php if($_TPL['css']) { ?>
@import url(template/default/<?=$_TPL['css']?>.css);
<?php } ?>
<?php if(!empty($_SGLOBAL['space_theme'])) { ?>
@import url(theme/<?=$_SGLOBAL['space_theme']?>/style.css);
<?php } elseif($_SCONFIG['template'] != 'default') { ?>
@import url(template/<?=$_SCONFIG['template']?>/style.css);
<?php } ?>
<?php if(!empty($_SGLOBAL['space_css'])) { ?>
<?=$_SGLOBAL['space_css']?>
<?php } ?>
*/
</style>
<link rel="shortcut icon" href="<?=$_USER_SC['domain']?>image/favicon.ico" />
<link rel="edituri" type="application/rsd+xml" title="rsd" href="<?php echo usr_url('xmlrpc', array('rsd'=>$space[uid])) ?>" />
</head>
<body>

<div id="append_parent"></div>
<div id="ajaxwaitid"></div>

<div class="top">
<div class="topnav">
<?php if($_SGLOBAL['supe_uid']) { ?>
    	<div class="nleni">
        	<ul>
            	<li class="menu-item">
                	<div class="menud">
                        <a class="menu-hd" href="<?php echo usr_url('space', array('uid'=>$_SGLOBAL['supe_uid'])) ?>"><?=$_SN[$_SGLOBAL['supe_uid']]?></a>
                        <div class="menu-bd">
                        	<div class="menu-bd-panel">
                            	<div class="jdjs">
                                	<div class="imjs"><?php echo avatar($_SGLOBAL[supe_uid], 'small'); ?></div>
                                    <div class="txjsd" style="color:#000;">
                                    	<p class="tmz"><?=$_SN[$_SGLOBAL['supe_uid']]?></p>
                                        <?php if($_SGLOBAL['member']['credit']) { ?>
                                        <p>积分：<?=$_SGLOBAL['member']['credit']?><br />
                                        <?php } ?>
                                        等级：654</p>
                                    </div>
                                </div>
                                <p class="qtdj"><a href="<?php echo usr_url('cp', array('ac'=>'profile')) ?>">个人资料</a></p>
                                <p class="qtdj"><a href="<?php echo usr_url('cp', array('ac'=>'theme')) ?>">空间装扮</a></p>
                                <p class="qtdj"><a href="<?php echo usr_url('cp', array('ac'=>'privacy')) ?>">隐私设置</a></p>
                                <p class="qtdj" style="text-align:right;"><a href="<?php echo usr_url('cp', array('ac'=>'common', 'op'=>'logout', 'uhash'=>$_SGLOBAL['uhash'])) ?>">退出</a></p>
                            </div>
                        </div>
                    </div>
                </li>
                <li><a href="<?php echo usr_url('space') ?>">个人中心</a></li>
                <li><a href="<?php echo usr_url('space', array('do'=>'home')) ?>">空间主页</a></li>
                <li class="menu-item">
                	<div class="menud">
                    	<a class="menu-hd" href="javascript:void(0)">写日志</a>
                        <div class="menu-bd">
                        	<div class="menu-bd-pane2">
                                	<p class="ts"><a href="<?php echo usr_url('space', array('do'=>'doing')) ?>">写记录</a></p>
                                    <p class="ts"><a href="<?php echo usr_url('cp', array('ac'=>'blog')) ?>">写日志</a></p>
                                    <p class="ts"><a href="<?php echo usr_url('cp', array('ac'=>'upload')) ?>">上传图片</a></p>
                                    <p class="ts"><a href="<?php echo usr_url('cp', array('ac'=>'poll')) ?>">发布投票</a></p>
                                    <p class="ts"><a href="<?php echo usr_url('space', array('do'=>'share')) ?>">我的分享</a></p>
                                    <p class="ts"><a href="<?php echo usr_url('space') ?>">进入个人中心</a></p>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>	
        </div>
<?php } else { ?>
        <p>你好，欢迎你的加入！<a href="<?php echo usr_url('do', array('ac'=>$_SCONFIG[login_action])) ?>">登陆</a><a href="<?php echo usr_url('do', array('ac'=>$_SCONFIG[register_action])) ?>">注册</a><a href="<?php echo usr_url('help') ?>">帮助</a></p>
<?php } ?>
        <p class="rini"><a href="<?php echo usr_url('index') ?>">首页</a><a href="<?php echo usr_url('network') ?>">广场</a><a href="<?php echo usr_url('space', array('do'=>'mtag')) ?>">圈子</a><a href="<?php echo usr_url('space', array('do'=>'event')) ?>">活动</a></p>
    </div>
</div>

<?php if(0) { ?>
<div id="header">
<?php if($_SGLOBAL['ad']['header']) { ?><div id="ad_header"><?php adshow('header'); ?></div><?php } ?>
<div class="headerwarp">
<h1 class="logo"><a href="index.php"><img src="template/<?=$_SCONFIG['template']?>/image/logo.gif" alt="<?=$_SCONFIG['sitename']?>" /></a></h1>
<ul class="menu">
<?php if($_SGLOBAL['supe_uid']) { ?>
<li><a href="space.php?do=home">首页</a></li>
<li><a href="space.php">个人主页</a></li>
<li><a href="space.php?do=friend">好友</a></li>
<li><a href="network.php">随便看看</a></li>
<?php } else { ?> <li><a href="index.php">首页</a></li> <?php } ?> 
<?php if($_SGLOBAL['appmenu']) { ?>
<?php if($_SGLOBAL['appmenus']) { ?>
<li class="dropmenu" id="ucappmenu" onclick="showMenu(this.id)">
<a href="javascript:;">站内导航</a>
</li>
<?php } else { ?>
<li><a target="_blank" href="<?=$_SGLOBAL['appmenu']['url']?>" title="<?=$_SGLOBAL['appmenu']['name']?>"><?=$_SGLOBAL['appmenu']['name']?></a></li>
<?php } ?>
<?php } ?>

<?php if($_SGLOBAL['supe_uid']) { ?>
        <li><a href="<?php if(!empty($_SGLOBAL['member']['newpm'])) { ?><?php echo usr_url('space', array('do'=>'pm', 'filter'=>'newpm')) ?><?php } else { ?><?php echo usr_url('space', array('do'=>'pm')) ?><?php } ?>">消息<?php if(!empty($_SGLOBAL['member']['newpm'])) { ?>(新)<?php } ?></a></li>
        <?php if($_SGLOBAL['member']['allnotenum']) { ?><li class="notify" id="membernotemenu" onmouseover="showMenu(this.id)"><a href="<?php echo usr_url('space', array('do'=>'notice')) ?>"><?=$_SGLOBAL['member']['allnotenum']?>个提醒</a></li><?php } ?>
<?php } else { ?>
<li><a href="help.php">帮助</a></li>
<?php } ?>
</ul>

<div class="nav_account">
<?php if($_SGLOBAL['supe_uid']) { ?>
<a href="space.php?uid=<?=$_SGLOBAL['supe_uid']?>" class="login_thumb"><?php echo avatar($_SGLOBAL[supe_uid]); ?></a>
<a href="space.php?uid=<?=$_SGLOBAL['supe_uid']?>" class="loginName"><?=$_SN[$_SGLOBAL['supe_uid']]?></a>
<?php if($_SGLOBAL['member']['credit']) { ?>
<a href="cp.php?ac=credit" style="font-size:11px;padding:0 0 0 5px;"><img src="<?=$_USER_SC['domain']?>image/credit.gif"><?=$_SGLOBAL['member']['credit']?></a>
<?php } ?>
<br />
<?php if(empty($_SCONFIG['closeinvite'])) { ?>
<a href="cp.php?ac=invite">邀请</a> 
<?php } ?>
<a href="cp.php?ac=task">任务</a> 
<a href="cp.php?ac=magic">道具</a>
<a href="cp.php">设置</a> 
<a href="cp.php?ac=common&op=logout&uhash=<?=$_SGLOBAL['uhash']?>">退出</a>
<?php } else { ?>
<a href="do.php?ac=<?=$_SCONFIG['register_action']?>" class="login_thumb"><?php echo avatar($_SGLOBAL[supe_uid]); ?></a>
欢迎您<br>
<a href="do.php?ac=<?=$_SCONFIG['login_action']?>">登录</a> | 
<a href="do.php?ac=<?=$_SCONFIG['register_action']?>">注册</a>
<?php } ?>
</div>
</div>
</div>

<div id="wrap">

<?php if(empty($_TPL['nosidebar'])) { ?>
<div id="main">
<div id="app_sidebar">
<?php if($_SGLOBAL['supe_uid']) { ?>
<ul class="app_list" id="default_userapp">
<li><img src="<?=$_USER_SC['domain']?>image/app/doing.gif"><a href="space.php?do=doing">记录</a></li>
<li><img src="<?=$_USER_SC['domain']?>image/app/album.gif"><a href="space.php?do=album">相册</a><em><a href="cp.php?ac=upload" class="gray">上传</a></em></li>
<li><img src="<?=$_USER_SC['domain']?>image/app/blog.gif"><a href="space.php?do=blog">日志</a><em><a href="cp.php?ac=blog" class="gray">发表</a></em></li>
<li><img src="<?=$_USER_SC['domain']?>image/app/poll.gif"/><a href="space.php?do=poll">投票</a><em><a href="cp.php?ac=poll" class="gray">发起</a></em></li>
<li><img src="<?=$_USER_SC['domain']?>image/app/mtag.gif"><a href="space.php?do=mtag">群组</a><em><a href="cp.php?ac=thread" class="gray">话题</a></em></li>
<li><img src="<?=$_USER_SC['domain']?>image/app/event.gif"/><a href="space.php?do=event">活动</a><em><a href="cp.php?ac=event" class="gray">发起</a></em></li>
<li><img src="<?=$_USER_SC['domain']?>image/app/share.gif"><a href="space.php?do=share">分享</a></li>
<li><img src="<?=$_USER_SC['domain']?>image/app/topic.gif"><a href="space.php?do=topic">热闹</a></li>
</ul>

<ul class="app_list topline" id="my_defaultapp">
<?php if($_SCONFIG['my_status']) { ?>
<?php if(is_array($_SGLOBAL['userapp'])) { foreach($_SGLOBAL['userapp'] as $value) { ?>
<li><img src="http://appicon.manyou.com/icons/<?=$value['appid']?>"><a href="userapp.php?id=<?=$value['appid']?>"><?=$value['appname']?></a></li>
<?php } } ?>
<?php } ?>
</ul>

<?php if($_SCONFIG['my_status']) { ?>
<ul class="app_list topline" id="my_userapp">
<?php if(is_array($_SGLOBAL['my_menu'])) { foreach($_SGLOBAL['my_menu'] as $value) { ?>
<li id="userapp_li_<?=$value['appid']?>"><img src="http://appicon.manyou.com/icons/<?=$value['appid']?>"><a href="userapp.php?id=<?=$value['appid']?>" title="<?=$value['appname']?>"><?=$value['appname']?></a></li>
<?php } } ?>
</ul>
<?php } ?>

<?php if($_SGLOBAL['my_menu_more']) { ?>
<p class="app_more"><a href="javascript:;" id="a_app_more" onclick="userapp_open();" class="off">展开</a></p>
<?php } ?>

<?php if($_SCONFIG['my_status']) { ?>
<div class="app_m">
<ul>
<li><img src="<?=$_USER_SC['domain']?>image/app_add.gif"><a href="cp.php?ac=userapp&my_suffix=%2Fapp%2Flist" class="addApp">添加应用</a></li>
<li><img src="<?=$_USER_SC['domain']?>image/app_set.gif"><a href="cp.php?ac=userapp&op=menu" class="myApp">管理应用</a></li>
</ul>
</div>
<?php } ?>

<?php } else { ?>
<div class="bar_text">
<form id="loginform" name="loginform" action="do.php?ac=<?=$_SCONFIG['login_action']?>&ref" method="post">
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
<p class="title">登录站点</p>
<p>用户名</p>
<p><input type="text" name="username" id="username" class="t_input" size="15" value="" /></p>
<p>密码</p>
<p><input type="password" name="password" id="password" class="t_input" size="15" value="" /></p>
<p><input type="checkbox" id="cookietime" name="cookietime" value="315360000" checked /><label for="cookietime">记住我</label></p>
<p>
<input type="submit" id="loginsubmit" name="loginsubmit" value="登录" class="submit" />
<input type="button" name="regbutton" value="注册" class="button" onclick="urlto('do.php?ac=<?=$_SCONFIG['register_action']?>');">
</p>
</form>
</div>
<?php } ?>
</div>

<div id="mainarea">

<?php } ?>

<?php } ?>

<?php } ?>

<div class="showmessage">
<div class="ye_r_t"><div class="ye_l_t"><div class="ye_r_b"><div class="ye_l_b">
<caption>
<h2>信息提示</h2>
</caption>
<p><?=$message?></p>
<p class="op">
<?php if($url_forward) { ?>
<a href="<?=$url_forward?>">页面跳转中...</a>
<?php } else { ?>
<a href="javascript:history.go(-1);">返回上一页</a> | 
<a href="index.php">返回首页</a>
<?php } ?>
</p>
</div></div></div></div>
</div>
<?php if(empty($_SGLOBAL['inajax'])) { ?>
<?php if($_SGLOBAL['ad']['contentbottom']) { ?><br style="line-height:0;clear:both;"/><div id="ad_contentbottom"><?php adshow('contentbottom'); ?></div><?php } ?>
<div id="bottom"></div>
<div class="foot">
    <div class="ftnr">
        <p class="minav">
        <a href="#" target="_blank">返回首页</a><span>|</span><a href="#" target="_blank">联系我们</a><span>|</span><a href="#" target="_blank">问题反馈</a><span>|</span><a href="#" target="_blank">网站地图</a>
        <?php if($_SCONFIG['miibeian']) { ?><span>|</span><a  href="http://www.miibeian.gov.cn" target="_blank"><?=$_SCONFIG['miibeian']?></a><?php } ?>
        </p>
        <p>CopyRight © 2008-2016 NewPower Co. All Right Reserved.<br />经营许可证编号:苏B2-20070187 苏ICP备09011225号</p>
    </div>
    <?php if($_SGLOBAL['ad']['footer']) { ?>
    <p style="padding:5px 0 10px 0;"><?php adshow('footer'); ?></p>
    <?php } ?>
    <?php if($_SCONFIG['debuginfo']) { ?>
    <p><?php echo debuginfo(); ?></p>
    <?php } ?>
</div>
</div>

<!--/wrap-->

<?php if($_SGLOBAL['appmenu']) { ?>
<ul id="ucappmenu_menu" class="dropmenu_drop" style="display:none;">
<li><a href="<?=$_SGLOBAL['appmenu']['url']?>" title="<?=$_SGLOBAL['appmenu']['name']?>" target="_blank"><?=$_SGLOBAL['appmenu']['name']?></a></li>
<?php if(is_array($_SGLOBAL['appmenus'])) { foreach($_SGLOBAL['appmenus'] as $value) { ?>
<li><a href="<?=$value['url']?>" title="<?=$value['name']?>" target="_blank"><?=$value['name']?></a></li>
<?php } } ?>
</ul>
<?php } ?>

<?php if($_SGLOBAL['supe_uid']) { ?>
<ul id="membernotemenu_menu" class="dropmenu_drop" style="display:none;">
<?php $member = $_SGLOBAL['member']; ?>
<?php if($member['notenum']) { ?><li><img src="<?=$_USER_SC['domain']?>image/icon/notice.gif" width="16" alt="" /> <a href="space.php?do=notice"><strong><?=$member['notenum']?></strong> 个新通知</a></li><?php } ?>
<?php if($member['pokenum']) { ?><li><img src="<?=$_USER_SC['domain']?>image/icon/poke.gif" alt="" /> <a href="cp.php?ac=poke"><strong><?=$member['pokenum']?></strong> 个新招呼</a></li><?php } ?>
<?php if($member['addfriendnum']) { ?><li><img src="<?=$_USER_SC['domain']?>image/icon/friend.gif" alt="" /> <a href="cp.php?ac=friend&op=request"><strong><?=$member['addfriendnum']?></strong> 个好友请求</a></li><?php } ?>
<?php if($member['mtaginvitenum']) { ?><li><img src="<?=$_USER_SC['domain']?>image/icon/mtag.gif" alt="" /> <a href="cp.php?ac=mtag&op=mtaginvite"><strong><?=$member['mtaginvitenum']?></strong> 个群组邀请</a></li><?php } ?>
<?php if($member['eventinvitenum']) { ?><li><img src="<?=$_USER_SC['domain']?>image/icon/event.gif" alt="" /> <a href="cp.php?ac=event&op=eventinvite"><strong><?=$member['eventinvitenum']?></strong> 个活动邀请</a></li><?php } ?>
<?php if($member['myinvitenum']) { ?><li><img src="<?=$_USER_SC['domain']?>image/icon/userapp.gif" alt="" /> <a href="space.php?do=notice&view=userapp"><strong><?=$member['myinvitenum']?></strong> 个应用消息</a></li><?php } ?>
</ul>
<?php } ?>

<?php if($_SGLOBAL['supe_uid']) { ?>
<?php if(!isset($_SCOOKIE['checkpm'])) { ?>
<script language="javascript"  type="text/javascript" src="cp.php?ac=pm&op=checknewpm&rand=<?=$_SGLOBAL['timestamp']?>"></script>
<?php } ?>
<?php if(!isset($_SCOOKIE['synfriend'])) { ?>
<script language="javascript"  type="text/javascript" src="cp.php?ac=friend&op=syn&rand=<?=$_SGLOBAL['timestamp']?>"></script>
<?php } ?>
<?php } ?>
<?php if(!isset($_SCOOKIE['sendmail'])) { ?>
<script language="javascript"  type="text/javascript" src="do.php?ac=sendmail&rand=<?=$_SGLOBAL['timestamp']?>"></script>
<?php } ?>

<?php if($_SGLOBAL['ad']['couplet']) { ?>
<script language="javascript" type="text/javascript" src="source/script_couplet.js"></script>
<div id="uch_couplet" style="z-index: 10; position: absolute; display:none">
<div id="couplet_left" style="position: absolute; left: 2px; top: 60px; overflow: hidden;">
<div style="position: relative; top: 25px; margin:0.5em;" onMouseOver="this.style.cursor='hand'" onClick="closeBanner('uch_couplet');"><img src="<?=$_USER_SC['domain']?>image/advclose.gif"></div>
<?php adshow('couplet'); ?>
</div>
<div id="couplet_rigth" style="position: absolute; right: 2px; top: 60px; overflow: hidden;">
<div style="position: relative; top: 25px; margin:0.5em;" onMouseOver="this.style.cursor='hand'" onClick="closeBanner('uch_couplet');"><img src="<?=$_USER_SC['domain']?>image/advclose.gif"></div>
<?php adshow('couplet'); ?>
</div>
<script type="text/javascript">
lsfloatdiv('uch_couplet', 0, 0, '', 0).floatIt();
</script>
</div>
<?php } ?>
<?php if($_SCOOKIE['reward_log']) { ?>
<script type="text/javascript">
showreward();
</script>
<?php } ?>
</body>
</html>
<?php } ?>

<?php ob_out();?>