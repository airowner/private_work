<?php if(!defined('IN_UCHOME')) exit('Access Denied');?><?php subtplcheck('template/default/space_feed|template/default/sns_header|template/default/space_feed_li|template/default/space_feed_li|template/default/space_feed_li|template/default/space_menu|template/default/sns_footer|template/default/header|template/default/space_status|template/default/space_menu|template/default/space_feed_li|template/default/space_feed_li|template/default/space_feed_li|template/default/footer|template/default/header|template/default/footer', '1340553886', 'template/default/space_feed');?><?php if(empty($_TPL['getmore'])) { ?>	
<?php $_TPL['titles'] = array('首页'); ?>
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

<?php if(empty($_SGLOBAL['inajax'])) { ?>

<div class="main"<?php if(!$space['uid'] || !$space['self']) { ?> style="padding-top:37px;"<?php } ?>>
<?php if($_SGLOBAL['ad']['contenttop']) { ?><div id="ad_contenttop"><?php adshow('contenttop'); ?></div><?php } ?>
<link rel="stylesheet" type="text/css" href="<?=$_USER_SC['domain']?>css/spbulic.css"/>
<?php if($space['uid'] && $space['self']) { ?>
<div class="head">
    <div class="grxx">
        <div class="legr">
            <div class="grtx"><?php echo avatar($_SGLOBAL[supe_uid], 'small'); ?>"</div>
            <div class="grjj"><p class="mz"><?=$_SN[$_SGLOBAL['supe_uid']]?></p><p>ID:<?=$_SGLOBAL['supe_uid']?></p></div>
        </div>
        <div class="rigr">
            <div class="zbkj"><a href="<?php echo usr_url('cp', array('ac'=>'theme')) ?>">装扮空间</a></div>
            <div class="qtcz"><a href="<?php echo usr_url('cp', array('ac'=>'invite')) ?>">邀请好友</a><a href="<?php echo usr_url('cp', array('ac'=>'task')) ?>">任务中心</a><a href="<?php echo usr_url('cp', array('ac'=>'magic')) ?>">道具中心</a><a href="<?php echo usr_url('cp', array('ac'=>'privacy')) ?>">隐私设置</a><a href="<?php echo usr_url('cp') ?>">账号设置</a></div>
        </div>
    </div>
</div>
<?php } ?>
<div class="content">
    <!--左侧菜单-->
    <div class="lecd">
        <h3>个人主页</h3>
        <div class="cdnr">
            <ul>
                <p class="sy dq"><a href="<?php echo usr_url('space', array('do'=>'home')) ?>">首页</a></p>
                <p class="xq"><a href="<?php echo usr_url('cp', array('ac'=>'theme')) ?>#">心情</a><span><a href="<?php echo usr_url('cp', array('ac'=>'theme')) ?>#">发表</a></span></p>
                <p class="fx"><a href="<?php echo usr_url('space', array('do'=>'share')) ?>">分享</a></p>
                    <ul class="xni">
                        <li><a href="<?php echo usr_url('space', array('do'=>'share', 'view'=>'friend')) ?>">好友的分享</a></li>
                        <li><a href="<?php echo usr_url('space', array('do'=>'share', 'view'=>'me')) ?>">我的分享</a></li>
                        <li><a href="<?php echo usr_url('space', array('do'=>'share', 'view'=>'all')) ?>#">大家的分享</a></li>
                    </ul>
                <p class="rz"><a href="<?php echo usr_url('space', array('do'=>'blog')) ?>">日志</a><span><a href="<?php echo usr_url('cp', array('ac'=>'blog')) ?>">发布</a></span></p>
                    <ul class="xni">
                        <li><a href="<?php echo usr_url('space', array('do'=>'blog', 'view'=>'friend')) ?>">好友的日志</a></li>
                        <li><a href="<?php echo usr_url('space', array('do'=>'blog', 'view'=>'me')) ?>">我的日志</a></li>
                        <li><a href="<?php echo usr_url('space', array('do'=>'blog', 'view'=>'all')) ?>">大家的日志</a></li>
                    </ul>
                <p class="xc"><a href="<?php echo usr_url('space', array('do'=>'album')) ?>">相册</a><span><a href="<?php echo usr_url('cp', array('ac'=>'upload')) ?>">上传</a></span></p>
                    <ul class="xni">
                        <li><a href="<?php echo usr_url('space', array('do'=>'album', 'view'=>'friend')) ?>">好友的相册</a></li>
                        <li><a href="<?php echo usr_url('space', array('do'=>'album', 'view'=>'me')) ?>">我的相册</a></li>
                        <li><a href="<?php echo usr_url('space', array('do'=>'album', 'view'=>'all')) ?>">大家的相册</a></li>
                    </ul>
                <p class="zx"><a href="<?php echo usr_url('cp', array('ac'=>'theme')) ?>#">在线PS</a></p>
                <p class="lw"><a href="<?php echo usr_url('cp', array('ac'=>'theme')) ?>#">礼物</a></p>
                <p class="tp"><a href="<?php echo usr_url('space', array('do'=>'poll')) ?>">投票</a></p>
                <p class="hd" style="float:none"><a href="<?php echo usr_url('space', array('do'=>'event')) ?>">活动</a></p>
                <p class="hy"><a href="<?php echo usr_url('cp', array('ac'=>'theme')) ?>#">好友</a><span><a href="<?php echo usr_url('cp', array('ac'=>'theme')) ?>#">发表</a></span></p>
                <p class="qz"><a href="<?php echo usr_url('space', array('do'=>'mtag')) ?>">圈子</a><span><a href="<?php echo usr_url('cp', array('ac'=>'thread')) ?>">发表</a></span></p>
            </ul>
        </div>
    </div>
    <!--左侧菜单结束-->
<?php } ?>


<link rel="stylesheet" type="text/css" href="<?=$_USER_SC['domain']?>css/sns.css"/>
<script type="text/javascript" src="<?=$_USER_SC['domain']?>js/ss.js"></script>
<div class="mixq">
    <!--主人详情-->
    <?php if($space['uid'] && $space['self']) { ?>
    <div class="zrxq">
        <div class="zrtx"><?php echo avatar($space[uid],'100x100'); ?></div>
        <div class="zrjj">
            <p class="mzd"><b><?=$space['username']?> ID：1</b><?php if($_SGLOBAL['session']['magichidden']) { ?>当前隐身<?php } else { ?>当前在线<?php } ?>
            <?php if($_SGLOBAL['magic']['invisible']) { ?>
                <?php if($_SGLOBAL['session']['magichidden']) { ?>
                <span><img src="image/magic/invisible.small.gif" class="magicicon"><a id="a_magic_appear" href="<?php echo usr_url('cp', array('ac'=>'magic', 'op'=>'appear')) ?>" onclick="ajaxmenu(event,this.id)" class="gray">我要在线</a></span>
                <?php } else { ?>
                <span><img src="image/magic/invisible.small.gif" alt="<?=$_SGLOBAL['magic']['invisible']?>" class="magicicon"><a id="a_magic_invisible" href="<?php echo usr_url('magic', array('mid'=>'invisible')) ?>" onclick="ajaxmenu(event,this.id,1)" class="gray">我要隐身</a></span>
                <?php } ?>
            <?php } ?>
            </p>
            <p>已有 <?=$space['viewnum']?> 人次访问, <?=$space['credit']?> 个积分, <?=$space['experience']?> 个经验 <?=$space['star']?></p>
        <p class="qtlj">
        <a href="<?php echo usr_url('cp', array('ac'=>'avatar')) ?>">我的头像</a><span>|</span><a href="<?php echo usr_url('cp', array('ac'=>'profile')) ?>">个人资料</a><span>|</span><a href="<?php echo usr_url('cp', array('ac'=>'theme')) ?>">主页风格</a><span>|</span><a href="<?php echo usr_url('cp', array('ac'=>'credit')) ?>">我的积分</a>
        <?php if($_SCONFIG['sendmailday']) { ?>
        <span>|</span><a href="<?php echo usr_url('cp', array('ac'=>'sendmail')) ?>">邮件提醒</a>
        <?php } ?>
        <span>|</span><a href="<?php echo usr_url('cp', array('ac'=>'privacy')) ?>">隐私筛选</a>
        <?php if(checkperm('admin')) { ?>
            <span>|</span><a href="<?php echo usr_url('admincp') ?>">站点管理</a>
        <?php } ?>
        <?php if(0 && checkperm('allowstat')) { ?>
        <span>|</span><a href="<?php echo usr_url('do', array('ac'=>'stat')) ?>">趋势统计</a>
        <?php } ?>
        </p>
        </div>
    </div>
    <?php } elseif($space['uid']) { ?>
    <div class="zrxq">
        <div class="zrtx"><?php echo avatar($space[uid],'100x100'); ?></div>
        <div class="zrjj">
            <p class="mzd">
                <?php if($_TPL['spacetitle']) { ?>
                    <span style="font-size:14px"><?=$_SN[$space['uid']]?>的<?=$_TPL['spacetitle']?></span>
                <?php } ?>
                <?php if($_SGLOBAL['refer']) { ?>
                    <a class="r_option" href="<?=$_SGLOBAL['refer']?>">&laquo; 返回上一页</a>
                <?php } ?>
                <span><a href="<?php echo usr_url('space', array('uid'=>$space[uid])) ?>" class="spacelink"><?=$_SN[$space['uid']]?>的主页</a><span>
            </p>
            <p>
            <?php if($_TPL['spacemenus']) { ?>
                <?php if(is_array($_TPL['spacemenus'])) { foreach($_TPL['spacemenus'] as $value) { ?> <span class="pipe">&raquo;</span> <?=$value?><?php } } ?>
            <?php } ?>
            </p>
        <p class="qtlj">
            <?php if(!$space['isfriend']) { ?>
            <a href="<?php echo usr_url('cp', array('ac'=>'friend', 'op'=>'add', 'uid'=>$space[uid])) ?>">加为好友</a><span>|</span>
            <?php } ?>
            <a href="#comment">给我留言</a><span>|</span>
            <a href="<?php echo usr_url('cp', array('ac'=>'poke', 'op'=>'send', 'uid'=>$space[uid])) ?>" id="a_poke" onclick="ajaxmenu(event, this.id, 1)">打个招呼</a><span>|</span>
            <a href="<?php echo usr_url('cp', array('ac'=>'pm', 'uid'=>$space[uid])) ?>" id="a_pm" onclick="ajaxmenu(event, this.id, 1)">发送消息</a><span>|</span>
            <?php if($space['isfriend']) { ?>
            <a href="<?php echo usr_url('cp', array('ac'=>'friend', 'op'=>'ignore', 'uid'=>$space[uid])) ?>" id="a_ignore" onclick="ajaxmenu(event, this.id)">解除好友</a><span>|</span>
            <?php } ?>
            <a href="<?php echo usr_url('cp', array('ac'=>'common', 'op'=>'report', 'idtype'=>'uid', 'uid'=>$space[uid])) ?>" id="a_report" onclick="ajaxmenu(event, this.id, 1)">违规举报</a>
            </p>
        </div>
    </div>
    <?php } ?>
    <!--主人详情结束-->

<?php if(empty($_SCOOKIE['closefeedbox']) && $_SGLOBAL['ad']['feedbox']) { ?>
        <div class="gg"><?php adshow('feedbox'); ?></div>
    <?php } ?>

    <?php if($space['uid'] && $space['self']) { ?>
    <div class="yd">
        <img src="<?=$task['image']?>" alt="" class="icon" />
        <h3><a href="<?php echo usr_url('cp', array('ac'=>'task', 'op'=>'do', 'taskid'=>$task[$taskid])) ?>"><?=$task['name']?></a></h3>
        <p>可获得 <span class="num"><?=$task['credit']?></span> 积分</p>
    </div>
    <!--好友动态-->
    <div class="hydt">
        <div class="dtfl">
            <ul>
                <?php if($space['friendnum']) { ?><li<?php if($actives['we']) { ?> class="sdd01"<?php } else { ?> class="sdd02"<?php } ?> id="zs01"><a class="o" href="<?php echo usr_url('space', array('do'=>'home', 'view'=>'we')) ?>">好友动态</a></li><?php } ?>
                <li<?php if($actives['me']) { ?> class="sdd01"<?php } else { ?> class="sdd02"<?php } ?> id="zs02"><a class="t" href="<?php echo usr_url('space', array('do'=>'home', 'view'=>'me')) ?>">我的动态</a></li>
                <li<?php if($actives['all']) { ?> class="sdd01"<?php } else { ?> class="sdd02"<?php } ?> id="zs03"><a class="f" href="<?php echo usr_url('space', array('do'=>'home', 'view'=>'all')) ?>">全站动态</a></li>
                <li<?php if($actives['hot']) { ?> class="sdd01"<?php } else { ?> class="sdd02"<?php } ?> id="zs04"><a class="s" href="<?php echo usr_url('space', array('do'=>'home', 'view'=>'hot')) ?>">精选图片</a></li>
            </ul>
        </div>

        <div class="hydnr">
            <?php if($hotlist) { ?>
            <div id="space_feed" class="feed">
                <a href="<?php echo usr_url('space', array('do'=>'home', 'view'=>'hot')) ?>space.php?do=home&view=hot" class="r_option">&raquo; 查看更多热点</a>
            <h4 class="feedtime">近期热点推荐</h4>
            <ul>
            <?php if(is_array($hotlist)) { foreach($hotlist as $value) { ?>
            <?php $value = mkfeed($value); ?>
            <li class="s_clear <?=$value['magic_class']?>" id="feed_<?=$value['feedid']?>_li" onmouseover="feed_menu(<?=$value['feedid']?>,1);" onmouseout="feed_menu(<?=$value['feedid']?>,0);">
<div style="width:100%;overflow:hidden;" <?=$value['style']?>>
<?php if($value['uid'] && empty($_TPL['hidden_more'])) { ?>
<a href="cp.php?ac=feed&op=menu&feedid=<?=$value['feedid']?>" class="float_more" id="a_feed_menu_<?=$value['feedid']?>"  onmouseover="feed_menu(<?=$value['feedid']?>,1);" onmouseout="feed_menu(<?=$value['feedid']?>,0);" onclick="ajaxmenu(event, this.id)" title="显示更多选项" style="display:none;">菜单</a>
<?php } ?>
<a class="type" href="space.php?uid=<?=$_GET['uid']?>&do=feed&view=<?=$_GET['view']?>&appid=<?=$value['appid']?>&icon=<?=$value['icon']?>" title="只看此类动态"><img src="<?=$value['icon_image']?>" /></a>
<?=$value['title_template']?> 

<?php if(empty($_TPL['hidden_time'])) { ?>
<span class="gray"><?php echo sgmdate('m-d H:i',$value[dateline],1); ?></span>
<?php } ?>

<?php if(empty($_TPL['hidden_menu'])) { ?>
<?php if($value['idtype']=='doid') { ?>
(<a href="javascript:;" onclick="docomment_get('docomment_<?=$value['id']?>', 1);" id="do_a_op_<?=$value['id']?>">回复</a>)
<?php } elseif(in_array($value['idtype'], array('blogid','picid','sid','pid','eventid'))) { ?>
(<a href="javascript:;" onclick="feedcomment_get(<?=$value['feedid']?>);" id="feedcomment_a_op_<?=$value['feedid']?>">评论</a>)
<?php } ?>
<?php } ?>

<div class="feed_content">

<?php if(empty($_TPL['hidden_hot']) && $value['hot']) { ?>
<div class="hotspot"><a href="cp.php?ac=feed&feedid=<?=$value['feedid']?>"><?=$value['hot']?></a></div>
<?php } ?>	

<?php if($value['image_1']) { ?>
<a href="<?=$value['image_1_link']?>"<?=$value['target']?>><img src="<?=$value['image_1']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_2']) { ?>
<a href="<?=$value['image_2_link']?>"<?=$value['target']?>><img src="<?=$value['image_2']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_3']) { ?>
<a href="<?=$value['image_3_link']?>"<?=$value['target']?>><img src="<?=$value['image_3']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_4']) { ?>
<a href="<?=$value['image_4_link']?>"<?=$value['target']?>><img src="<?=$value['image_4']?>" class="summaryimg" /></a>
<?php } ?>

<?php if($value['body_template']) { ?>
<div class="detail"<?php if($value['image_3']) { ?> style="clear: both;"<?php } ?>>
<?=$value['body_template']?>
</div>
<?php } ?>

<?php if($value['thisapp'] && !empty($value['body_data']['flashvar'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/vd.gif" alt="点击播放" onclick="javascript:showFlash('<?=$value['body_data']['host']?>', '<?=$value['body_data']['flashvar']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif($value['thisapp'] && !empty($value['body_data']['musicvar'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/music.gif" alt="点击播放" onclick="javascript:showFlash('music', '<?=$value['body_data']['musicvar']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif($value['thisapp'] && !empty($value['body_data']['flashaddr'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/flash.gif" alt="点击查看" onclick="javascript:showFlash('flash', '<?=$value['body_data']['flashaddr']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } ?>

<?php if($value['body_general']) { ?>
<div class="quote"><span class="q"><?=$value['body_general']?></span></div>
<?php } ?>
</div>
</div>

<?php if($value['idtype']=='doid') { ?>
<div id="docomment_<?=$value['id']?>" style="display:none;"></div>
<?php } elseif($value['idtype']) { ?>
<div id="feedcomment_<?=$value['feedid']?>" style="display:none;"></div>
<?php } ?>

<?php if(!empty($hiddenfeed_num[$value['icon']])) { ?>
<div id="appfeed_open_<?=$value['feedid']?>"><a href="javascript:;" id="feed_a_more_<?=$value['feedid']?>" onclick="feed_more_show('<?=$value['feedid']?>');">&raquo; 更多动态(<?=$hiddenfeed_num[$value['icon']]?>)</a></div>
<div id="feed_more_<?=$value['feedid']?>" style="display:none;">
<ol>
<?php if(is_array($hiddenfeed_list[$value['icon']])) { foreach($hiddenfeed_list[$value['icon']] as $appvalue) { ?>
<?php $appvalue = mkfeed($appvalue); ?>
<li>
<?=$appvalue['title_template']?>
<div class="feed_content" style="width:100%;overflow:hidden;">
<?php if($appvalue['image_1']) { ?>
<a href="<?=$appvalue['image_1_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_1']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_2']) { ?>
<a href="<?=$appvalue['image_2_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_2']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_3']) { ?>
<a href="<?=$appvalue['image_3_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_3']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_4']) { ?>
<a href="<?=$appvalue['image_4_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_4']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['body_template']) { ?>
<div class="detail"<?php if($appvalue['image_3']) { ?> style="clear: both;"<?php } ?>>
<?=$appvalue['body_template']?>
</div>
<?php } ?>
<?php if($appvalue['body_general']) { ?>
<div class="quote"><span class="q"><?=$appvalue['body_general']?></span></div>
<?php } ?>
</div>
</li>
<?php } } ?>
</ol>
</div>
<?php } ?>
</li>
            <?php } } ?>
            </ul>
            </div>
            <?php } ?>

            <div>
            <?php if($list) { ?>
            <?php if(is_array($list)) { foreach($list as $day => $values) { ?>
                <?php if($_GET['view']!='hot') { ?>
                <h4 class="feedtime">
                    <?php if($day=='yesterday') { ?>昨天
                    <?php } elseif($day=='today') { ?>今天
                    <?php } elseif($day=='app') { ?>看看大家都在玩什么
                    <?php } else { ?><?=$day?>
                    <?php } ?>
                </h4>
                <?php } ?>
                <ul>
                <?php if(is_array($values)) { foreach($values as $value) { ?>
                    <li class="s_clear <?=$value['magic_class']?>" id="feed_<?=$value['feedid']?>_li" onmouseover="feed_menu(<?=$value['feedid']?>,1);" onmouseout="feed_menu(<?=$value['feedid']?>,0);">
<div style="width:100%;overflow:hidden;" <?=$value['style']?>>
<?php if($value['uid'] && empty($_TPL['hidden_more'])) { ?>
<a href="cp.php?ac=feed&op=menu&feedid=<?=$value['feedid']?>" class="float_more" id="a_feed_menu_<?=$value['feedid']?>"  onmouseover="feed_menu(<?=$value['feedid']?>,1);" onmouseout="feed_menu(<?=$value['feedid']?>,0);" onclick="ajaxmenu(event, this.id)" title="显示更多选项" style="display:none;">菜单</a>
<?php } ?>
<a class="type" href="space.php?uid=<?=$_GET['uid']?>&do=feed&view=<?=$_GET['view']?>&appid=<?=$value['appid']?>&icon=<?=$value['icon']?>" title="只看此类动态"><img src="<?=$value['icon_image']?>" /></a>
<?=$value['title_template']?> 

<?php if(empty($_TPL['hidden_time'])) { ?>
<span class="gray"><?php echo sgmdate('m-d H:i',$value[dateline],1); ?></span>
<?php } ?>

<?php if(empty($_TPL['hidden_menu'])) { ?>
<?php if($value['idtype']=='doid') { ?>
(<a href="javascript:;" onclick="docomment_get('docomment_<?=$value['id']?>', 1);" id="do_a_op_<?=$value['id']?>">回复</a>)
<?php } elseif(in_array($value['idtype'], array('blogid','picid','sid','pid','eventid'))) { ?>
(<a href="javascript:;" onclick="feedcomment_get(<?=$value['feedid']?>);" id="feedcomment_a_op_<?=$value['feedid']?>">评论</a>)
<?php } ?>
<?php } ?>

<div class="feed_content">

<?php if(empty($_TPL['hidden_hot']) && $value['hot']) { ?>
<div class="hotspot"><a href="cp.php?ac=feed&feedid=<?=$value['feedid']?>"><?=$value['hot']?></a></div>
<?php } ?>	

<?php if($value['image_1']) { ?>
<a href="<?=$value['image_1_link']?>"<?=$value['target']?>><img src="<?=$value['image_1']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_2']) { ?>
<a href="<?=$value['image_2_link']?>"<?=$value['target']?>><img src="<?=$value['image_2']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_3']) { ?>
<a href="<?=$value['image_3_link']?>"<?=$value['target']?>><img src="<?=$value['image_3']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_4']) { ?>
<a href="<?=$value['image_4_link']?>"<?=$value['target']?>><img src="<?=$value['image_4']?>" class="summaryimg" /></a>
<?php } ?>

<?php if($value['body_template']) { ?>
<div class="detail"<?php if($value['image_3']) { ?> style="clear: both;"<?php } ?>>
<?=$value['body_template']?>
</div>
<?php } ?>

<?php if($value['thisapp'] && !empty($value['body_data']['flashvar'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/vd.gif" alt="点击播放" onclick="javascript:showFlash('<?=$value['body_data']['host']?>', '<?=$value['body_data']['flashvar']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif($value['thisapp'] && !empty($value['body_data']['musicvar'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/music.gif" alt="点击播放" onclick="javascript:showFlash('music', '<?=$value['body_data']['musicvar']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif($value['thisapp'] && !empty($value['body_data']['flashaddr'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/flash.gif" alt="点击查看" onclick="javascript:showFlash('flash', '<?=$value['body_data']['flashaddr']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } ?>

<?php if($value['body_general']) { ?>
<div class="quote"><span class="q"><?=$value['body_general']?></span></div>
<?php } ?>
</div>
</div>

<?php if($value['idtype']=='doid') { ?>
<div id="docomment_<?=$value['id']?>" style="display:none;"></div>
<?php } elseif($value['idtype']) { ?>
<div id="feedcomment_<?=$value['feedid']?>" style="display:none;"></div>
<?php } ?>

<?php if(!empty($hiddenfeed_num[$value['icon']])) { ?>
<div id="appfeed_open_<?=$value['feedid']?>"><a href="javascript:;" id="feed_a_more_<?=$value['feedid']?>" onclick="feed_more_show('<?=$value['feedid']?>');">&raquo; 更多动态(<?=$hiddenfeed_num[$value['icon']]?>)</a></div>
<div id="feed_more_<?=$value['feedid']?>" style="display:none;">
<ol>
<?php if(is_array($hiddenfeed_list[$value['icon']])) { foreach($hiddenfeed_list[$value['icon']] as $appvalue) { ?>
<?php $appvalue = mkfeed($appvalue); ?>
<li>
<?=$appvalue['title_template']?>
<div class="feed_content" style="width:100%;overflow:hidden;">
<?php if($appvalue['image_1']) { ?>
<a href="<?=$appvalue['image_1_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_1']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_2']) { ?>
<a href="<?=$appvalue['image_2_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_2']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_3']) { ?>
<a href="<?=$appvalue['image_3_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_3']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_4']) { ?>
<a href="<?=$appvalue['image_4_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_4']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['body_template']) { ?>
<div class="detail"<?php if($appvalue['image_3']) { ?> style="clear: both;"<?php } ?>>
<?=$appvalue['body_template']?>
</div>
<?php } ?>
<?php if($appvalue['body_general']) { ?>
<div class="quote"><span class="q"><?=$appvalue['body_general']?></span></div>
<?php } ?>
</div>
</li>
<?php } } ?>
</ol>
</div>
<?php } ?>
</li>
                <?php } } ?>
                </ul>
            <?php } } ?>
            <?php } else { ?>
                <ul>
                    <li>没有相关动态</li>
                </ul>
            <?php } ?>
            </div>

            <?php if($filtercount) { ?>
            <div class="notice" id="feed_filter_notice_<?=$start?>">
                根据您的<a href="cp.php?ac=privacy&op=view">筛选设置</a>，有 <?=$filtercount?> 条动态被屏蔽 (<a href="javascript:;" onclick="filter_more(<?=$start?>);" id="a_feed_privacy_more">点击查看</a>)
            </div>
            <div id="feed_filter_div_<?=$start?>" class="enter-content" style="display:none;">
                <h4 class="feedtime">以下是被屏蔽的动态</h4>
                <ul>
                <?php if(is_array($filter_list)) { foreach($filter_list as $value) { ?>
                <?php $value = mkfeed($value); ?>
                <li class="s_clear <?=$value['magic_class']?>" id="feed_<?=$value['feedid']?>_li" onmouseover="feed_menu(<?=$value['feedid']?>,1);" onmouseout="feed_menu(<?=$value['feedid']?>,0);">
<div style="width:100%;overflow:hidden;" <?=$value['style']?>>
<?php if($value['uid'] && empty($_TPL['hidden_more'])) { ?>
<a href="cp.php?ac=feed&op=menu&feedid=<?=$value['feedid']?>" class="float_more" id="a_feed_menu_<?=$value['feedid']?>"  onmouseover="feed_menu(<?=$value['feedid']?>,1);" onmouseout="feed_menu(<?=$value['feedid']?>,0);" onclick="ajaxmenu(event, this.id)" title="显示更多选项" style="display:none;">菜单</a>
<?php } ?>
<a class="type" href="space.php?uid=<?=$_GET['uid']?>&do=feed&view=<?=$_GET['view']?>&appid=<?=$value['appid']?>&icon=<?=$value['icon']?>" title="只看此类动态"><img src="<?=$value['icon_image']?>" /></a>
<?=$value['title_template']?> 

<?php if(empty($_TPL['hidden_time'])) { ?>
<span class="gray"><?php echo sgmdate('m-d H:i',$value[dateline],1); ?></span>
<?php } ?>

<?php if(empty($_TPL['hidden_menu'])) { ?>
<?php if($value['idtype']=='doid') { ?>
(<a href="javascript:;" onclick="docomment_get('docomment_<?=$value['id']?>', 1);" id="do_a_op_<?=$value['id']?>">回复</a>)
<?php } elseif(in_array($value['idtype'], array('blogid','picid','sid','pid','eventid'))) { ?>
(<a href="javascript:;" onclick="feedcomment_get(<?=$value['feedid']?>);" id="feedcomment_a_op_<?=$value['feedid']?>">评论</a>)
<?php } ?>
<?php } ?>

<div class="feed_content">

<?php if(empty($_TPL['hidden_hot']) && $value['hot']) { ?>
<div class="hotspot"><a href="cp.php?ac=feed&feedid=<?=$value['feedid']?>"><?=$value['hot']?></a></div>
<?php } ?>	

<?php if($value['image_1']) { ?>
<a href="<?=$value['image_1_link']?>"<?=$value['target']?>><img src="<?=$value['image_1']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_2']) { ?>
<a href="<?=$value['image_2_link']?>"<?=$value['target']?>><img src="<?=$value['image_2']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_3']) { ?>
<a href="<?=$value['image_3_link']?>"<?=$value['target']?>><img src="<?=$value['image_3']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_4']) { ?>
<a href="<?=$value['image_4_link']?>"<?=$value['target']?>><img src="<?=$value['image_4']?>" class="summaryimg" /></a>
<?php } ?>

<?php if($value['body_template']) { ?>
<div class="detail"<?php if($value['image_3']) { ?> style="clear: both;"<?php } ?>>
<?=$value['body_template']?>
</div>
<?php } ?>

<?php if($value['thisapp'] && !empty($value['body_data']['flashvar'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/vd.gif" alt="点击播放" onclick="javascript:showFlash('<?=$value['body_data']['host']?>', '<?=$value['body_data']['flashvar']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif($value['thisapp'] && !empty($value['body_data']['musicvar'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/music.gif" alt="点击播放" onclick="javascript:showFlash('music', '<?=$value['body_data']['musicvar']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif($value['thisapp'] && !empty($value['body_data']['flashaddr'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/flash.gif" alt="点击查看" onclick="javascript:showFlash('flash', '<?=$value['body_data']['flashaddr']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } ?>

<?php if($value['body_general']) { ?>
<div class="quote"><span class="q"><?=$value['body_general']?></span></div>
<?php } ?>
</div>
</div>

<?php if($value['idtype']=='doid') { ?>
<div id="docomment_<?=$value['id']?>" style="display:none;"></div>
<?php } elseif($value['idtype']) { ?>
<div id="feedcomment_<?=$value['feedid']?>" style="display:none;"></div>
<?php } ?>

<?php if(!empty($hiddenfeed_num[$value['icon']])) { ?>
<div id="appfeed_open_<?=$value['feedid']?>"><a href="javascript:;" id="feed_a_more_<?=$value['feedid']?>" onclick="feed_more_show('<?=$value['feedid']?>');">&raquo; 更多动态(<?=$hiddenfeed_num[$value['icon']]?>)</a></div>
<div id="feed_more_<?=$value['feedid']?>" style="display:none;">
<ol>
<?php if(is_array($hiddenfeed_list[$value['icon']])) { foreach($hiddenfeed_list[$value['icon']] as $appvalue) { ?>
<?php $appvalue = mkfeed($appvalue); ?>
<li>
<?=$appvalue['title_template']?>
<div class="feed_content" style="width:100%;overflow:hidden;">
<?php if($appvalue['image_1']) { ?>
<a href="<?=$appvalue['image_1_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_1']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_2']) { ?>
<a href="<?=$appvalue['image_2_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_2']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_3']) { ?>
<a href="<?=$appvalue['image_3_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_3']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_4']) { ?>
<a href="<?=$appvalue['image_4_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_4']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['body_template']) { ?>
<div class="detail"<?php if($appvalue['image_3']) { ?> style="clear: both;"<?php } ?>>
<?=$appvalue['body_template']?>
</div>
<?php } ?>
<?php if($appvalue['body_general']) { ?>
<div class="quote"><span class="q"><?=$appvalue['body_general']?></span></div>
<?php } ?>
</div>
</li>
<?php } } ?>
</ol>
</div>
<?php } ?>
</li>
                <?php } } ?>
                <li><a href="javascript:;" onclick="filter_more(<?=$start?>);">&laquo; 收起</a></li>
                </ul>
            </div>
            <?php } ?>

        <?php if(empty($_TPL['getmore'])) { ?>	
            <?php if($count==$perpage) { ?>
            <div class="page" style="padding-top:20px;">
                <a href="javascript:;" onclick="feed_more();" id="a_feed_more">查看更多动态</a>
            </div>
            <?php } ?>

            <div id="ajax_wait"></div>
        <?php } ?>
        </div>
    </div>
<?php } elseif($space['uid']) { ?>
<?php $_TPL['spacetitle'] = "动态";
	$_TPL['spacemenus'][] = "<a href=\"space.php?uid=$space[uid]&do=feed&view=me\">TA的近期动态</a>"; ?>
    <div class="hydnr">
        <div class="c_header a_header">
<div class="avatar48"><a href="space.php?uid=<?=$space['uid']?>"><?php echo avatar($space[uid],small); ?></a></div>
<?php if($_SGLOBAL['refer']) { ?>
<a class="r_option" href="<?=$_SGLOBAL['refer']?>">&laquo; 返回上一页</a>
<?php } ?>
<p style="font-size:14px"><?=$_SN[$space['uid']]?>的<?=$_TPL['spacetitle']?></p>
<a href="space.php?uid=<?=$space['uid']?>" class="spacelink"><?=$_SN[$space['uid']]?>的主页</a>
<?php if($_TPL['spacemenus']) { ?>
<?php if(is_array($_TPL['spacemenus'])) { foreach($_TPL['spacemenus'] as $value) { ?> <span class="pipe">&raquo;</span> <?=$value?><?php } } ?>
<?php } ?>
</div>

    </div>
<?php } ?>
    <!--好友动态结束-->
</div>
<!--中间内容结束-->

<!--右侧内容-->
<div class="ricz">
    <?php if($visitorlist) { ?>
    <div class="xcy zjlf">
        <h4>最近来访</h4>
        <div class="cynr">
            <ul>
<?php if(is_array($visitorlist)) { foreach($visitorlist as $key => $value) { ?>
<?php if($value['vusername'] == '') { ?>
                <li<?php if($key % 3 == 0) { ?> class="nm"<?php } ?>><img src="<?=$_USER_SC['domain']?>image/magic/hidden.gif" alt="匿名" /><br />匿名</a><br /><?php echo sgmdate('n月j日',$value[dateline],1); ?></li>
<?php } else { ?>
                <li<?php if($key % 3 == 0) { ?> class="nm"<?php } ?>><a href="<?php echo usr_url('space', array('uid'=>$value[vuid])) ?>"><?php echo avatar($value[vuid],small); ?><br /><?=$_SN[$value['vuid']]?></a><br /><?php echo sgmdate('n月j日',$value[dateline],1); ?></li>
                    <?php } ?>
<?php } } ?>
            </ul>
        </div>
    </div>
    <?php } ?>
    
<?php if($newspacelist) { ?>
    <div class="xcy">
        <h4>新成员</h4>
        <div class="cynr">
            <ul>
<?php if(is_array($newspacelist)) { foreach($newspacelist as $key => $value) { ?>
            <li class="<?php if($ols[$value['uid']]) { ?>
            online_icon_p<?php if($key % 3 == 0) { ?> nm<?php } ?>
            <?php } ?>" title="在线"><a href="<?php echo usr_url('space', array('uid'=>$value[uid])) ?>"><?php echo avatar($value[uid],small); ?><br /><?=$_SN[$value['uid']]?></a><br /><?php echo sgmdate('n月j日',$value[dateline],1); ?></li>
<?php } } ?>
            </ul>
        </div>
    </div>
<?php } ?>
    
<?php if($space['self'] && $task) { ?>
    <div class="zjhd">
        <h4>活动任务表</h4>
        <div class="hdnr">
            <div class="dghd">
                <p><a href="<?php echo usr_url('cp', array('ac'=>'task', 'op'=>'do', 'taskid'=>$task['taskid'])) ?>"><?=$task['name']?></a></p>
<p>可获得 <span class="num"><?=$task['credit']?></span> 积分</p>
            </div>
        </div>
    </div>
<?php } ?>

<?php if($space['self'] && $olfriendlist) { ?>
    <div class="xcy zjlf">
        <a href="<?php echo usr_url('space', array('uid'=>$space['uid'], 'do'=>'friend')) ?>"><h4>我的好友</h4></a>
        <div class="cynr">
            <ul>
<?php if(is_array($olfriendlist)) { foreach($olfriendlist as $key => $value) { ?>
            <li class="<?php if($ols[$value['uid']]) { ?>
            online_icon_p<?php if($key % 3 == 0) { ?> nm<?php } ?>
            <?php } ?>" title="在线"><a href="<?php echo usr_url('space', array('uid'=>$value[uid])) ?>"><?php echo avatar($value[uid],small); ?><br /><?=$_SN[$value['uid']]?></a><br /><?php if($value['lastactivity']) { ?><?php echo sgmdate('H:i',$value[lastactivity],1); ?><?php } else { ?>热度(<?=$value['num']?>)<?php } ?></li>
<?php } } ?>
            </ul>
        </div>
    </div>
    <?php } ?>
    
    <div class="ksdw">
        <h4>快速定位</h4>
        <div class="cznr">
            <form action="<?php echo usr_url('cp', array('ac'=>'friend', 'op'=>'search', 'searchmode'=>'1')) ?>" method="get">
                <input class="txt" type="text" name="searchkey" /><input class="btn" type="submit" name="searchsubmit" />
            </form>
            <p><a href="<?php echo usr_url('cp', array('ac'=>'friend', 'op'=>'search', 'all'=>'yes')) ?>">高级搜索</a>|<a href="<?php echo usr_url('cp', array('ac'=>'friend', 'op'=>'find')) ?>">可能认识的人</a>|<a href="<?php echo usr_url('cp', array('ac'=>'friend', 'op'=>'invite')) ?>">邀请好友</a></p>
        </div>
    </div>
</div>

<script type="text/javascript">

var next = <?=$start?>;
function feed_more() {
var x = new Ajax('XML', 'ajax_wait');
var html = '';
next = next + <?=$perpage?>;
        x.get(<?php echo usr_url('cp', array('ac'=>'feed', 'op'=>'get', 'view'=>$_GET['view'], 'appid'=>$_GET['appid'], 'icon'=>$_GET['icon'], 'filter'=>$_GET['filter'], 'day'=>$_GET['day']), array('start'=>'next')) ?>, function(s){
html = '<h4 class="feedtime">以下是新读取的动态</h4>' + s;
$('feed_div').innerHTML += html;
});
}

function filter_more(id) {
if($('feed_filter_div_'+id).style.display == '') {
$('feed_filter_div_'+id).style.display = 'none';
$('feed_filter_notice_'+id).style.display = '';
} else {
$('feed_filter_div_'+id).style.display = '';
$('feed_filter_notice_'+id).style.display = 'none';
}
}

function close_feedbox() {
var x = new Ajax();
        x.get("<?php echo usr_url('cp', array('ac'=>'common', 'op'=>'close_feedbox')) ?>", function(s){
$('feed_box').style.display = 'none';
});
}

var elems = selector('li[class~=magicthunder]', $('feed_div')); 
for(var i=0; i<elems.length; i++){		
magicColor(elems[i]); 
}
</script>

<?php my_checkupdate(); ?>
<?php my_showgift(); ?>
<?php if(empty($_SGLOBAL['inajax'])) { ?>
</div>
<?php } ?>
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



<?php if(0) { ?>
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
{if <?=$_SCONFIG['my_status']?>}
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


<div id="content">

<?php if($space['uid'] && $space['self']) { ?>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr>
<td valign="top" width="150">
<div class="ar_r_t"><div class="ar_l_t"><div class="ar_r_b"><div class="ar_l_b"><?php echo avatar($_SGLOBAL[supe_uid],middle); ?></div></div></div></div>

<ul class="u_setting">
<li class="dropmenu" id="usettingli" onclick="showMenu(this.id)"><a href="javascript:;">个人设置 <img src="<?=$_USER_SC['domain']?>image/more.gif" align="absmiddle"></a></li>
</ul>
<ul id="usettingli_menu" class="dropmenu_drop" style="display:none;">
<li><a href="cp.php?ac=avatar">我的头像</a></li>
<li><a href="cp.php?ac=profile">个人资料</a></li>
<li><a href="cp.php?ac=theme">主页风格</a></li>
<li><a href="cp.php?ac=credit">我的积分</a></li>
<?php if($_SCONFIG['sendmailday']) { ?>
<li><a href="cp.php?ac=sendmail">邮件提醒</a></li>
<?php } ?>
<li><a href="cp.php?ac=privacy">隐私筛选</a></li>
<?php if(checkperm('admin')) { ?>
<li><a href="admincp.php">站点管理</a></li>
<?php } ?>
<?php if(checkperm('allowstat')) { ?>
<li><a href="do.php?ac=stat">趋势统计</a></li>
<?php } ?>
</ul>
</td>
<td valign="top">
<h3 class="index_name">
<div class="r_option">
<?php if($_SGLOBAL['session']['magichidden']) { ?>当前隐身<?php } else { ?>当前在线<?php } ?>

<?php if($_SGLOBAL['magic']['invisible']) { ?>
<?php if($_SGLOBAL['session']['magichidden']) { ?>
<img src="<?=$_USER_SC['domain']?>image/magic/invisible.small.gif" class="magicicon"><a id="a_magic_appear" href="cp.php?ac=magic&op=appear" onclick="ajaxmenu(event,this.id)" class="gray">我要在线</a>
<?php } else { ?>
<img src="<?=$_USER_SC['domain']?>image/magic/invisible.small.gif" alt="<?=$_SGLOBAL['magic']['invisible']?>" class="magicicon"><a id="a_magic_invisible" href="magic.php?mid=invisible" onclick="ajaxmenu(event,this.id,1)" class="gray">我要隐身</a>
<?php } ?>
<?php } ?>
</div>

<a href="space.php?uid=<?=$space['uid']?>"<?php g_color($space[groupid]); ?>><?=$_SN[$space['uid']]?></a>
<?php g_icon($space[groupid]); ?>
<a href="cp.php?ac=credit"><?=$space['star']?></a>
</h3>

<div class="index_note">
已有 <?=$space['viewnum']?> 人次访问, <?=$space['credit']?> 个积分, <?=$space['experience']?> 个经验
</div>

<div id="mood_mystatus">
<?=$space['spacenote']?>
</div>

<div id="mood_form">
<form method="post" action="cp.php?ac=doing" id="mood_addform">
<div id="mood_statusinput" class="statusinput"><textarea name="message" id="mood_message" onclick="statusFace();" onkeydown="if(event.keyCode == 13 ){ event.returnValue=false;event.cancel = true;$('mood_add').click();$('mood_message').value='';this.blur(); };" >你可以更新状态, 让好友们知道你在做什么...</textarea></div>
<div class="statussubmit">
<input type="button" id="mood_add" name="add" value="更新" class="submit" style="display:none;" onclick="ajaxpost('mood_addform', 'reloadMood');$('mood_message').value='';" />
<input type="hidden" name="addsubmit" value="true" />
<input type="hidden" name="spacenote" value="true" />
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</div>

</form>
</div>


<script type="text/javascript">
function statusFace() {
if($('mood_message').value == '你可以更新状态, 让好友们知道你在做什么...'){
$('mood_message').value = '';
}
$('mood_statusinput').style.zIndex = '20005';
$('mood_statusinput').className = 'statusinput2';
$('mood_add').style.display = 'block';


var div = $('mood_face_bg');
if(div) {
div.parentNode.removeChild(div);
}
div = document.createElement('div');
div.id = 'mood_face_bg';
div.style.position = 'absolute';
div.style.left = div.style.top = '0px';
div.style.width = '100%';
div.style.height = document.body.scrollHeight + 'px';
div.style.backgroundColor = '#000';
div.style.zIndex = 10000;
div.style.display = 'none';
div.style.filter = 'alpha(opacity=0)';
div.style.opacity = 0;
div.onclick = function() {
hiddenstatus();
}
$('append_parent').appendChild(div);


if($('mood_message_menu') != null) {
$('mood_message_menu').style.display = '';
$('mood_add').style.display = '';
} else {
var faceDiv = document.createElement("div");
faceDiv.id = 'mood_message_menu';
faceDiv.className = 'facebox';
faceDiv.style.position = 'absolute';
var faceul = document.createElement("ul");
for(i=1; i<31; i++) {
getStatusFace(i, faceul);	
}
faceDiv.appendChild(faceul);
$('append_parent').appendChild(faceDiv);
}
//定位菜单
setMenuPosition('mood_message', 0);
div.style.display = '';
}

function hiddenstatus() {
$('mood_message_menu').style.display = 'none';
$('mood_face_bg').style.display = 'none';
$('mood_add').style.display = 'none';
$('mood_statusinput').className = 'statusinput';
if($('mood_message').value == ''){
$('mood_message').value = '你可以更新状态, 让好友们知道你在做什么...';
}
$('mood_statusinput').style.zIndex = '1';
}

function getStatusFace(i, faceul) {
var faceli = document.createElement("li");
faceli.innerHTML = '<img src="<?=$_USER_SC['domain']?>image/face/'+i+'.gif" style="cursor:pointer; position:relative;" />';
faceli.getElementsByTagName('img').item(0).onclick = function(){var faceText = '[em:'+i+':]'; if($('mood_message') != null) { insertContent('mood_message', faceText); }};
faceul.appendChild(faceli);
}

function reloadMood(showid, result) {
var x = new Ajax();
x.get('cp.php?ac=doing&op=getmood', function(s){
$('mood_mystatus').innerHTML = s;
});
//提示获得积分
showreward();
hiddenstatus();
}
</script>
</td>
</tr>
</table>

<?php if($space['allnum']) { ?>
<div class="mgs_list">
<?php if($space['notenum']) { ?><div><img src="<?=$_USER_SC['domain']?>image/icon/notice.gif"><a href="space.php?do=notice"><strong><?=$space['notenum']?></strong> 条新通知</a></div><?php } ?>
<?php if($space['addfriendnum']) { ?><div><img src="<?=$_USER_SC['domain']?>image/icon/friend.gif" alt="" /><a href="cp.php?ac=friend&op=request"><strong><?=$space['addfriendnum']?></strong> 个好友请求</a></div><?php } ?>
<?php if($space['mtaginvitenum']) { ?><div><img src="<?=$_USER_SC['domain']?>image/icon/mtag.gif" alt="" /><a href="cp.php?ac=mtag&op=mtaginvite"><strong><?=$space['mtaginvitenum']?></strong> 个群组邀请</a></div><?php } ?>
<?php if($space['eventinvitenum']) { ?><div><img src="<?=$_USER_SC['domain']?>image/icon/event.gif" alt="" /><a href="cp.php?ac=event&op=eventinvite"><strong><?=$space['eventinvitenum']?></strong> 个活动邀请</a></div><?php } ?>
<?php if($space['myinvitenum']) { ?><div><img src="<?=$_USER_SC['domain']?>image/icon/userapp.gif" alt="" /><a href="space.php?do=notice&view=userapp"><strong><?=$space['myinvitenum']?></strong> 个应用消息</a></div><?php } ?>
<?php if($space['pmnum']) { ?><div><img src="<?=$_USER_SC['domain']?>image/icon/pm.gif" alt="" /><a href="space.php?do=pm"><strong><?=$space['pmnum']?></strong> 条新短消息</a></div><?php } ?>
<?php if($space['pokenum']) { ?><div><img src="<?=$_USER_SC['domain']?>image/icon/poke.gif" alt="" /><a href="cp.php?ac=poke"><strong> <?=$space['pokenum']?></strong> 个新招呼</a></div><?php } ?>
<?php if($space['reportnum']) { ?><div><img src="<?=$_USER_SC['domain']?>image/icon/report.gif" alt="" /><a href="admincp.php?ac=report"><strong><?=$space['reportnum']?></strong> 个举报</a></div><?php } ?>
<?php if($space['namestatusnum']) { ?><div><img src="<?=$_USER_SC['domain']?>image/icon/profile.gif" alt="" /><a href="admincp.php?ac=space&perpage=20&namestatus=0&searchsubmit=1"><strong><?=$space['namestatusnum']?></strong> 个待认证用户</a></div><?php } ?>
<?php if($space['eventverifynum']) { ?><div><img src="<?=$_USER_SC['domain']?>image/icon/event.gif" alt="" /><a href="admincp.php?ac=event&perpage=20&grade=0&searchsubmit=1"><strong><?=$space['eventverifynum']?></strong> 个待审核活动</a></div><?php } ?>
</div>
<?php } ?>

<?php if($isnewer && $task) { ?>
<div class="ye_r_t"><div class="ye_l_t"><div class="ye_r_b"><div class="ye_l_b">
<div class="task_notice">
<div class="task_notice_body">
<div class="notice">您好，<?=$_SN[$space['uid']]?>，欢迎加入我们。有新任务等着您，挺简单的，赶快来参加吧</div>
<img src="<?=$task['image']?>" alt="" class="icon" />
<h3><a href="cp.php?ac=task&op=do&taskid=<?=$task['taskid']?>"><?=$task['name']?></a></h3>
<p>可获得 <span class="num"><?=$task['credit']?></span> 积分</p>
</div>
</div>
</div></div></div></div><br>
<?php } ?>

<?php if(empty($_SCOOKIE['closefeedbox']) && $_SGLOBAL['ad']['feedbox']) { ?>
<div id="feed_box" class="ye_r_t"><div class="ye_l_t"><div class="ye_r_b"><div class="ye_l_b">
<div class="task_notice">
<a title="忽略" class="float_cancel" href="javascript:;" onclick="close_feedbox();">忽略</a>
<div class="task_notice_body">
<?php adshow('feedbox'); ?>
</div>
</div>
</div></div></div></div>
<?php } ?>

<div class="tabs_header" style="padding-top:10px;">

<?php if($_SGLOBAL['magic']['thunder']) { ?>
<a id="a_magic_thunder" href="magic.php?mid=thunder" onclick="ajaxmenu(event,this.id, 1)" class="r_option gray"><img src="<?=$_USER_SC['domain']?>image/magic/thunder.small.gif" alt="<?=$_SGLOBAL['magic']['thunder']?>" class="magicicon"><?=$_SGLOBAL['magic']['thunder']?></a>
<?php } ?>

<ul class="tabs">
<?php if($space['friendnum']) { ?><li<?=$actives['we']?>><a href="space.php?do=home&view=we"><span>好友动态</span></a></li><?php } ?>
<li<?=$actives['hot']?>><a href="space.php?do=home&view=hot"><span>热门推荐</span></a></li>
<li<?=$actives['me']?>><a href="space.php?do=home&view=me"><span>我的动态</span></a></li>
<li<?=$actives['all']?>><a href="space.php?do=home&view=all"><span>全站动态</span></a></li>
</ul>
</div>
<?php } elseif($space['uid']) { ?>

<?php $_TPL['spacetitle'] = "动态";
	$_TPL['spacemenus'][] = "<a href=\"space.php?uid=$space[uid]&do=feed&view=me\">TA的近期动态</a>"; ?>
<div class="c_header a_header">
<div class="avatar48"><a href="space.php?uid=<?=$space['uid']?>"><?php echo avatar($space[uid],small); ?></a></div>
<?php if($_SGLOBAL['refer']) { ?>
<a class="r_option" href="<?=$_SGLOBAL['refer']?>">&laquo; 返回上一页</a>
<?php } ?>
<p style="font-size:14px"><?=$_SN[$space['uid']]?>的<?=$_TPL['spacetitle']?></p>
<a href="space.php?uid=<?=$space['uid']?>" class="spacelink"><?=$_SN[$space['uid']]?>的主页</a>
<?php if($_TPL['spacemenus']) { ?>
<?php if(is_array($_TPL['spacemenus'])) { foreach($_TPL['spacemenus'] as $value) { ?> <span class="pipe">&raquo;</span> <?=$value?><?php } } ?>
<?php } ?>
</div>

<?php } ?>

<div class="feed">
<div id="feed_div" class="enter-content">

<?php if($hotlist) { ?>
<a href="space.php?do=home&view=hot" class="r_option">&raquo; 查看更多热点</a>
<h4 class="feedtime" style="margin-top:5px;">近期热点推荐</h4>
<ul>
<?php if(is_array($hotlist)) { foreach($hotlist as $value) { ?>
<?php $value = mkfeed($value); ?>
<li class="s_clear <?=$value['magic_class']?>" id="feed_<?=$value['feedid']?>_li" onmouseover="feed_menu(<?=$value['feedid']?>,1);" onmouseout="feed_menu(<?=$value['feedid']?>,0);">
<div style="width:100%;overflow:hidden;" <?=$value['style']?>>
<?php if($value['uid'] && empty($_TPL['hidden_more'])) { ?>
<a href="cp.php?ac=feed&op=menu&feedid=<?=$value['feedid']?>" class="float_more" id="a_feed_menu_<?=$value['feedid']?>"  onmouseover="feed_menu(<?=$value['feedid']?>,1);" onmouseout="feed_menu(<?=$value['feedid']?>,0);" onclick="ajaxmenu(event, this.id)" title="显示更多选项" style="display:none;">菜单</a>
<?php } ?>
<a class="type" href="space.php?uid=<?=$_GET['uid']?>&do=feed&view=<?=$_GET['view']?>&appid=<?=$value['appid']?>&icon=<?=$value['icon']?>" title="只看此类动态"><img src="<?=$value['icon_image']?>" /></a>
<?=$value['title_template']?> 

<?php if(empty($_TPL['hidden_time'])) { ?>
<span class="gray"><?php echo sgmdate('m-d H:i',$value[dateline],1); ?></span>
<?php } ?>

<?php if(empty($_TPL['hidden_menu'])) { ?>
<?php if($value['idtype']=='doid') { ?>
(<a href="javascript:;" onclick="docomment_get('docomment_<?=$value['id']?>', 1);" id="do_a_op_<?=$value['id']?>">回复</a>)
<?php } elseif(in_array($value['idtype'], array('blogid','picid','sid','pid','eventid'))) { ?>
(<a href="javascript:;" onclick="feedcomment_get(<?=$value['feedid']?>);" id="feedcomment_a_op_<?=$value['feedid']?>">评论</a>)
<?php } ?>
<?php } ?>

<div class="feed_content">

<?php if(empty($_TPL['hidden_hot']) && $value['hot']) { ?>
<div class="hotspot"><a href="cp.php?ac=feed&feedid=<?=$value['feedid']?>"><?=$value['hot']?></a></div>
<?php } ?>	

<?php if($value['image_1']) { ?>
<a href="<?=$value['image_1_link']?>"<?=$value['target']?>><img src="<?=$value['image_1']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_2']) { ?>
<a href="<?=$value['image_2_link']?>"<?=$value['target']?>><img src="<?=$value['image_2']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_3']) { ?>
<a href="<?=$value['image_3_link']?>"<?=$value['target']?>><img src="<?=$value['image_3']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_4']) { ?>
<a href="<?=$value['image_4_link']?>"<?=$value['target']?>><img src="<?=$value['image_4']?>" class="summaryimg" /></a>
<?php } ?>

<?php if($value['body_template']) { ?>
<div class="detail"<?php if($value['image_3']) { ?> style="clear: both;"<?php } ?>>
<?=$value['body_template']?>
</div>
<?php } ?>

<?php if($value['thisapp'] && !empty($value['body_data']['flashvar'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/vd.gif" alt="点击播放" onclick="javascript:showFlash('<?=$value['body_data']['host']?>', '<?=$value['body_data']['flashvar']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif($value['thisapp'] && !empty($value['body_data']['musicvar'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/music.gif" alt="点击播放" onclick="javascript:showFlash('music', '<?=$value['body_data']['musicvar']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif($value['thisapp'] && !empty($value['body_data']['flashaddr'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/flash.gif" alt="点击查看" onclick="javascript:showFlash('flash', '<?=$value['body_data']['flashaddr']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } ?>

<?php if($value['body_general']) { ?>
<div class="quote"><span class="q"><?=$value['body_general']?></span></div>
<?php } ?>
</div>
</div>

<?php if($value['idtype']=='doid') { ?>
<div id="docomment_<?=$value['id']?>" style="display:none;"></div>
<?php } elseif($value['idtype']) { ?>
<div id="feedcomment_<?=$value['feedid']?>" style="display:none;"></div>
<?php } ?>

<?php if(!empty($hiddenfeed_num[$value['icon']])) { ?>
<div id="appfeed_open_<?=$value['feedid']?>"><a href="javascript:;" id="feed_a_more_<?=$value['feedid']?>" onclick="feed_more_show('<?=$value['feedid']?>');">&raquo; 更多动态(<?=$hiddenfeed_num[$value['icon']]?>)</a></div>
<div id="feed_more_<?=$value['feedid']?>" style="display:none;">
<ol>
<?php if(is_array($hiddenfeed_list[$value['icon']])) { foreach($hiddenfeed_list[$value['icon']] as $appvalue) { ?>
<?php $appvalue = mkfeed($appvalue); ?>
<li>
<?=$appvalue['title_template']?>
<div class="feed_content" style="width:100%;overflow:hidden;">
<?php if($appvalue['image_1']) { ?>
<a href="<?=$appvalue['image_1_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_1']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_2']) { ?>
<a href="<?=$appvalue['image_2_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_2']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_3']) { ?>
<a href="<?=$appvalue['image_3_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_3']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_4']) { ?>
<a href="<?=$appvalue['image_4_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_4']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['body_template']) { ?>
<div class="detail"<?php if($appvalue['image_3']) { ?> style="clear: both;"<?php } ?>>
<?=$appvalue['body_template']?>
</div>
<?php } ?>
<?php if($appvalue['body_general']) { ?>
<div class="quote"><span class="q"><?=$appvalue['body_general']?></span></div>
<?php } ?>
</div>
</li>
<?php } } ?>
</ol>
</div>
<?php } ?>
</li>
<?php } } ?>
</ul>
<?php } ?>


<?php if($list) { ?>
<?php if(is_array($list)) { foreach($list as $day => $values) { ?>
<?php if($_GET['view']!='hot') { ?>
<h4 class="feedtime">
<?php if($day=='yesterday') { ?>昨天
<?php } elseif($day=='today') { ?>今天
<?php } elseif($day=='app') { ?>看看大家都在玩什么
<?php } else { ?><?=$day?>
<?php } ?>
</h4>
<?php } ?>
<ul>
<?php if(is_array($values)) { foreach($values as $value) { ?>
<li class="s_clear <?=$value['magic_class']?>" id="feed_<?=$value['feedid']?>_li" onmouseover="feed_menu(<?=$value['feedid']?>,1);" onmouseout="feed_menu(<?=$value['feedid']?>,0);">
<div style="width:100%;overflow:hidden;" <?=$value['style']?>>
<?php if($value['uid'] && empty($_TPL['hidden_more'])) { ?>
<a href="cp.php?ac=feed&op=menu&feedid=<?=$value['feedid']?>" class="float_more" id="a_feed_menu_<?=$value['feedid']?>"  onmouseover="feed_menu(<?=$value['feedid']?>,1);" onmouseout="feed_menu(<?=$value['feedid']?>,0);" onclick="ajaxmenu(event, this.id)" title="显示更多选项" style="display:none;">菜单</a>
<?php } ?>
<a class="type" href="space.php?uid=<?=$_GET['uid']?>&do=feed&view=<?=$_GET['view']?>&appid=<?=$value['appid']?>&icon=<?=$value['icon']?>" title="只看此类动态"><img src="<?=$value['icon_image']?>" /></a>
<?=$value['title_template']?> 

<?php if(empty($_TPL['hidden_time'])) { ?>
<span class="gray"><?php echo sgmdate('m-d H:i',$value[dateline],1); ?></span>
<?php } ?>

<?php if(empty($_TPL['hidden_menu'])) { ?>
<?php if($value['idtype']=='doid') { ?>
(<a href="javascript:;" onclick="docomment_get('docomment_<?=$value['id']?>', 1);" id="do_a_op_<?=$value['id']?>">回复</a>)
<?php } elseif(in_array($value['idtype'], array('blogid','picid','sid','pid','eventid'))) { ?>
(<a href="javascript:;" onclick="feedcomment_get(<?=$value['feedid']?>);" id="feedcomment_a_op_<?=$value['feedid']?>">评论</a>)
<?php } ?>
<?php } ?>

<div class="feed_content">

<?php if(empty($_TPL['hidden_hot']) && $value['hot']) { ?>
<div class="hotspot"><a href="cp.php?ac=feed&feedid=<?=$value['feedid']?>"><?=$value['hot']?></a></div>
<?php } ?>	

<?php if($value['image_1']) { ?>
<a href="<?=$value['image_1_link']?>"<?=$value['target']?>><img src="<?=$value['image_1']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_2']) { ?>
<a href="<?=$value['image_2_link']?>"<?=$value['target']?>><img src="<?=$value['image_2']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_3']) { ?>
<a href="<?=$value['image_3_link']?>"<?=$value['target']?>><img src="<?=$value['image_3']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_4']) { ?>
<a href="<?=$value['image_4_link']?>"<?=$value['target']?>><img src="<?=$value['image_4']?>" class="summaryimg" /></a>
<?php } ?>

<?php if($value['body_template']) { ?>
<div class="detail"<?php if($value['image_3']) { ?> style="clear: both;"<?php } ?>>
<?=$value['body_template']?>
</div>
<?php } ?>

<?php if($value['thisapp'] && !empty($value['body_data']['flashvar'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/vd.gif" alt="点击播放" onclick="javascript:showFlash('<?=$value['body_data']['host']?>', '<?=$value['body_data']['flashvar']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif($value['thisapp'] && !empty($value['body_data']['musicvar'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/music.gif" alt="点击播放" onclick="javascript:showFlash('music', '<?=$value['body_data']['musicvar']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif($value['thisapp'] && !empty($value['body_data']['flashaddr'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/flash.gif" alt="点击查看" onclick="javascript:showFlash('flash', '<?=$value['body_data']['flashaddr']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } ?>

<?php if($value['body_general']) { ?>
<div class="quote"><span class="q"><?=$value['body_general']?></span></div>
<?php } ?>
</div>
</div>

<?php if($value['idtype']=='doid') { ?>
<div id="docomment_<?=$value['id']?>" style="display:none;"></div>
<?php } elseif($value['idtype']) { ?>
<div id="feedcomment_<?=$value['feedid']?>" style="display:none;"></div>
<?php } ?>

<?php if(!empty($hiddenfeed_num[$value['icon']])) { ?>
<div id="appfeed_open_<?=$value['feedid']?>"><a href="javascript:;" id="feed_a_more_<?=$value['feedid']?>" onclick="feed_more_show('<?=$value['feedid']?>');">&raquo; 更多动态(<?=$hiddenfeed_num[$value['icon']]?>)</a></div>
<div id="feed_more_<?=$value['feedid']?>" style="display:none;">
<ol>
<?php if(is_array($hiddenfeed_list[$value['icon']])) { foreach($hiddenfeed_list[$value['icon']] as $appvalue) { ?>
<?php $appvalue = mkfeed($appvalue); ?>
<li>
<?=$appvalue['title_template']?>
<div class="feed_content" style="width:100%;overflow:hidden;">
<?php if($appvalue['image_1']) { ?>
<a href="<?=$appvalue['image_1_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_1']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_2']) { ?>
<a href="<?=$appvalue['image_2_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_2']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_3']) { ?>
<a href="<?=$appvalue['image_3_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_3']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_4']) { ?>
<a href="<?=$appvalue['image_4_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_4']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['body_template']) { ?>
<div class="detail"<?php if($appvalue['image_3']) { ?> style="clear: both;"<?php } ?>>
<?=$appvalue['body_template']?>
</div>
<?php } ?>
<?php if($appvalue['body_general']) { ?>
<div class="quote"><span class="q"><?=$appvalue['body_general']?></span></div>
<?php } ?>
</div>
</li>
<?php } } ?>
</ol>
</div>
<?php } ?>
</li>
<?php } } ?>
</ul>
<?php } } ?>

<?php } else { ?>
<ul>
<li>没有相关动态</li>
</ul>
<?php } ?>

<?php if($filtercount) { ?>
<div class="notice" id="feed_filter_notice_<?=$start?>">
根据您的<a href="cp.php?ac=privacy&op=view">筛选设置</a>，有 <?=$filtercount?> 条动态被屏蔽 (<a href="javascript:;" onclick="filter_more(<?=$start?>);" id="a_feed_privacy_more">点击查看</a>)
</div>
<div id="feed_filter_div_<?=$start?>" class="enter-content" style="display:none;">
<h4 class="feedtime">以下是被屏蔽的动态</h4>
<ul>
<?php if(is_array($filter_list)) { foreach($filter_list as $value) { ?>
<?php $value = mkfeed($value); ?>
<li class="s_clear <?=$value['magic_class']?>" id="feed_<?=$value['feedid']?>_li" onmouseover="feed_menu(<?=$value['feedid']?>,1);" onmouseout="feed_menu(<?=$value['feedid']?>,0);">
<div style="width:100%;overflow:hidden;" <?=$value['style']?>>
<?php if($value['uid'] && empty($_TPL['hidden_more'])) { ?>
<a href="cp.php?ac=feed&op=menu&feedid=<?=$value['feedid']?>" class="float_more" id="a_feed_menu_<?=$value['feedid']?>"  onmouseover="feed_menu(<?=$value['feedid']?>,1);" onmouseout="feed_menu(<?=$value['feedid']?>,0);" onclick="ajaxmenu(event, this.id)" title="显示更多选项" style="display:none;">菜单</a>
<?php } ?>
<a class="type" href="space.php?uid=<?=$_GET['uid']?>&do=feed&view=<?=$_GET['view']?>&appid=<?=$value['appid']?>&icon=<?=$value['icon']?>" title="只看此类动态"><img src="<?=$value['icon_image']?>" /></a>
<?=$value['title_template']?> 

<?php if(empty($_TPL['hidden_time'])) { ?>
<span class="gray"><?php echo sgmdate('m-d H:i',$value[dateline],1); ?></span>
<?php } ?>

<?php if(empty($_TPL['hidden_menu'])) { ?>
<?php if($value['idtype']=='doid') { ?>
(<a href="javascript:;" onclick="docomment_get('docomment_<?=$value['id']?>', 1);" id="do_a_op_<?=$value['id']?>">回复</a>)
<?php } elseif(in_array($value['idtype'], array('blogid','picid','sid','pid','eventid'))) { ?>
(<a href="javascript:;" onclick="feedcomment_get(<?=$value['feedid']?>);" id="feedcomment_a_op_<?=$value['feedid']?>">评论</a>)
<?php } ?>
<?php } ?>

<div class="feed_content">

<?php if(empty($_TPL['hidden_hot']) && $value['hot']) { ?>
<div class="hotspot"><a href="cp.php?ac=feed&feedid=<?=$value['feedid']?>"><?=$value['hot']?></a></div>
<?php } ?>	

<?php if($value['image_1']) { ?>
<a href="<?=$value['image_1_link']?>"<?=$value['target']?>><img src="<?=$value['image_1']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_2']) { ?>
<a href="<?=$value['image_2_link']?>"<?=$value['target']?>><img src="<?=$value['image_2']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_3']) { ?>
<a href="<?=$value['image_3_link']?>"<?=$value['target']?>><img src="<?=$value['image_3']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($value['image_4']) { ?>
<a href="<?=$value['image_4_link']?>"<?=$value['target']?>><img src="<?=$value['image_4']?>" class="summaryimg" /></a>
<?php } ?>

<?php if($value['body_template']) { ?>
<div class="detail"<?php if($value['image_3']) { ?> style="clear: both;"<?php } ?>>
<?=$value['body_template']?>
</div>
<?php } ?>

<?php if($value['thisapp'] && !empty($value['body_data']['flashvar'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/vd.gif" alt="点击播放" onclick="javascript:showFlash('<?=$value['body_data']['host']?>', '<?=$value['body_data']['flashvar']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif($value['thisapp'] && !empty($value['body_data']['musicvar'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/music.gif" alt="点击播放" onclick="javascript:showFlash('music', '<?=$value['body_data']['musicvar']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } elseif($value['thisapp'] && !empty($value['body_data']['flashaddr'])) { ?>
<div class="media">
<img src="<?=$_USER_SC['domain']?>image/flash.gif" alt="点击查看" onclick="javascript:showFlash('flash', '<?=$value['body_data']['flashaddr']?>', this, '<?=$value['feedid']?>');" style="cursor:pointer;" />
</div>
<?php } ?>

<?php if($value['body_general']) { ?>
<div class="quote"><span class="q"><?=$value['body_general']?></span></div>
<?php } ?>
</div>
</div>

<?php if($value['idtype']=='doid') { ?>
<div id="docomment_<?=$value['id']?>" style="display:none;"></div>
<?php } elseif($value['idtype']) { ?>
<div id="feedcomment_<?=$value['feedid']?>" style="display:none;"></div>
<?php } ?>

<?php if(!empty($hiddenfeed_num[$value['icon']])) { ?>
<div id="appfeed_open_<?=$value['feedid']?>"><a href="javascript:;" id="feed_a_more_<?=$value['feedid']?>" onclick="feed_more_show('<?=$value['feedid']?>');">&raquo; 更多动态(<?=$hiddenfeed_num[$value['icon']]?>)</a></div>
<div id="feed_more_<?=$value['feedid']?>" style="display:none;">
<ol>
<?php if(is_array($hiddenfeed_list[$value['icon']])) { foreach($hiddenfeed_list[$value['icon']] as $appvalue) { ?>
<?php $appvalue = mkfeed($appvalue); ?>
<li>
<?=$appvalue['title_template']?>
<div class="feed_content" style="width:100%;overflow:hidden;">
<?php if($appvalue['image_1']) { ?>
<a href="<?=$appvalue['image_1_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_1']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_2']) { ?>
<a href="<?=$appvalue['image_2_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_2']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_3']) { ?>
<a href="<?=$appvalue['image_3_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_3']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['image_4']) { ?>
<a href="<?=$appvalue['image_4_link']?>"<?=$appvalue['target']?>><img src="<?=$appvalue['image_4']?>" class="summaryimg" /></a>
<?php } ?>
<?php if($appvalue['body_template']) { ?>
<div class="detail"<?php if($appvalue['image_3']) { ?> style="clear: both;"<?php } ?>>
<?=$appvalue['body_template']?>
</div>
<?php } ?>
<?php if($appvalue['body_general']) { ?>
<div class="quote"><span class="q"><?=$appvalue['body_general']?></span></div>
<?php } ?>
</div>
</li>
<?php } } ?>
</ol>
</div>
<?php } ?>
</li>
<?php } } ?>
<li><a href="javascript:;" onclick="filter_more(<?=$start?>);">&laquo; 收起</a></li>
</ul>
</div>
<?php } ?>

<?php if(empty($_TPL['getmore'])) { ?>	
</div>

<?php if($count==$perpage) { ?>
<div class="page" style="padding-top:20px;">
<a href="javascript:;" onclick="feed_more();" id="a_feed_more">查看更多动态</a>
</div>
<?php } ?>

<div id="ajax_wait"></div>

</div>
</div>
<?php } ?>	
<!--/content-->

<div id="sidebar">
<?php if(!$isnewer && $task) { ?>
<div class="ye_r_t"><div class="ye_l_t"><div class="ye_r_b"><div class="ye_l_b">
<div class="task_notice" style="width:230px;">
<a title="忽略" class="float_cancel" href="cp.php?ac=task&taskid=<?=$task['taskid']?>&op=ignore">忽略</a>
<div class="task_notice_body">
<img src="<?=$task['image']?>" alt="" class="icon" />
<h3><a href="cp.php?ac=task&op=do&taskid=<?=$task['taskid']?>"><?=$task['name']?></a></h3>
<p>可获得 <span class="num"><?=$task['credit']?></span> 积分</p>
</div>
</div>
</div></div></div></div>
<?php } ?>

<?php if($topiclist) { ?>
<div class="ye_r_t"><div class="ye_l_t"><div class="ye_r_b"><div class="ye_l_b">
<div class="task_notice" style="width:230px;">
<?php if(is_array($topiclist)) { foreach($topiclist as $key => $value) { ?>
<div class="task_notice_body">
<?php if($value['pic']) { ?>
<a href="space.php?do=topic&topicid=<?=$value['topicid']?>"><img src="<?=$value['pic']?>" alt="" class="icon" /></a>
<?php } ?>
<h3>
<img src="<?=$_USER_SC['domain']?>image/app/topic.gif" align="absmiddle">
<a href="space.php?do=topic&topicid=<?=$value['topicid']?>"><?=$value['subject']?></a>
</h3>
<div class="gray">已有 <span class="num"><?=$value['joinnum']?></span> 人参与</div>
</div>
<?php } } ?>
</div>
</div></div></div></div>
<?php } ?>

<?php if($newspacelist) { ?>
<div class="sidebox">
<h2 class="title">
<p class="r_option">
<a href="space.php?do=top">排行</a>
</p>
热烈欢迎新成员
</h2>
<ul class="avatar_list">
<?php if(is_array($newspacelist)) { foreach($newspacelist as $key => $value) { ?>
<li>
<div class="avatar48"><a href="space.php?uid=<?=$value['uid']?>"><?php echo avatar($value[uid],small); ?></a></div>
<p<?php if($ols[$value['uid']]) { ?> class="online_icon_p" title="在线"<?php } ?>><a href="space.php?uid=<?=$value['uid']?>" title="<?=$_SN[$value['uid']]?>"><?=$_SN[$value['uid']]?></a></p>
<p class="gray"><?php echo sgmdate('n月j日',$value[dateline],1); ?></p>
</li>
<?php } } ?>
</ul>
</div>
<?php } ?>

<?php if($visitorlist) { ?>
<div class="sidebox">
<h2 class="title">
<p class="r_option">
<a href="space.php?uid=<?=$space['uid']?>&do=friend&view=visitor">全部</a>
</p>
最近来访
<?php if($_SGLOBAL['magic']['detector']) { ?>
<span class="gray"><img src="<?=$_USER_SC['domain']?>image/magic/detector.small.gif" title="<?=$_SGLOBAL['magic']['detector']?>" /><a id="a_magic_detector" href="magic.php?mid=detector" onclick="ajaxmenu(event,this.id,1)"><?=$_SGLOBAL['magic']['detector']?></a></span>
<?php } ?>
</h2>
<ul class="avatar_list">
<?php if(is_array($visitorlist)) { foreach($visitorlist as $key => $value) { ?>
<li>
<?php if($value['vusername'] == '') { ?>
<div class="avatar48"><img src="<?=$_USER_SC['domain']?>image/magic/hidden.gif" alt="匿名" /></a></div>
<p>匿名</p>
<p class="gray"><?php echo sgmdate('n月j日',$value[dateline],1); ?></p>
<?php } else { ?>
<div class="avatar48"><a href="space.php?uid=<?=$value['vuid']?>"><?php echo avatar($value[vuid],small); ?></a></div>
<p<?php if($ols[$value['vuid']]) { ?> class="online_icon_p" title="在线"<?php } ?>><a href="space.php?uid=<?=$value['vuid']?>" title="<?=$_SN[$value['vuid']]?>"><?=$_SN[$value['vuid']]?></a></p>
<p class="gray"><?php echo sgmdate('n月j日',$value[dateline],1); ?></p>
<?php } ?>
</li>
<?php } } ?>
</ul>
</div>
<?php } ?>

<?php if($olfriendlist) { ?>
<div class="sidebox">
<h2 class="title">
<p class="r_option">
<a href="space.php?uid=<?=$space['uid']?>&do=friend">全部</a>
</p>
我的好友
<?php if($_SGLOBAL['magic']['visit']) { ?>
<span class="gray"><img src="<?=$_USER_SC['domain']?>image/magic/visit.small.gif" title="<?=$_SGLOBAL['magic']['visit']?>" /><a id="a_magic_visit" href="magic.php?mid=visit" onclick="ajaxmenu(event,this.id,1)"><?=$_SGLOBAL['magic']['visit']?></a></span>
<?php } ?>
</h2>
<ul class="avatar_list">
<?php if(is_array($olfriendlist)) { foreach($olfriendlist as $key => $value) { ?>
<li>
<div class="avatar48"><a href="space.php?uid=<?=$value['uid']?>"><?php echo avatar($value[uid],small); ?></a></div>
<p<?php if($ols[$value['uid']]) { ?> class="online_icon_p" title="在线"<?php } ?>><a href="space.php?uid=<?=$value['uid']?>" title="<?=$_SN[$value['uid']]?>"><?=$_SN[$value['uid']]?></a></p>
<p class="gray"><?php if($value['lastactivity']) { ?><?php echo sgmdate('H:i',$value[lastactivity],1); ?><?php } else { ?>热度(<?=$value['num']?>)<?php } ?></p>
</li>
<?php } } ?>
</ul>
</div>
<?php } ?>

<?php if($birthlist) { ?>
<div class="searchfriend">
<div class="ye_r_t"><div class="ye_l_t"><div class="ye_r_b"><div class="ye_l_b">
<h3>好友生日提醒</h3>
<div class="box">
<table cellpadding="2" cellspacing="4">
<?php if(is_array($birthlist)) { foreach($birthlist as $key => $values) { ?>
<tr>
<td align="right" valign="top" style="padding-left:10px;">
<?php if($values['0']['istoday']) { ?>今天<?php } else { ?><?=$values['0']['birthmonth']?>-<?=$values['0']['birthday']?><?php } ?>
</td>
<td style="padding-left:10px;">
<ul>
<?php if(is_array($values)) { foreach($values as $value) { ?>
<li><a href="space.php?uid=<?=$value['uid']?>"><?=$_SN[$value['uid']]?></a></li>
<?php } } ?>
</ul>
</td>
</tr>
<?php } } ?>
</table>
</div>
</div></div></div></div>
</div>
<?php } ?>

<div class="searchfriend">
<div class="ye_r_t"><div class="ye_l_t"><div class="ye_r_b"><div class="ye_l_b">
<h3>搜索用户</h3>
<form method="get" action="cp.php" style="padding:10px 0 5px 0;">
<input name="searchkey" value="" size="20" class="t_input" type="text">
<input name="searchsubmit" value="找人" class="submit" type="submit">
<input type="hidden" name="searchmode" value="1" />
<input type="hidden" name="ac" value="friend" />
<input type="hidden" name="op" value="search" />
</form>
<p>
<a href="cp.php?ac=friend&op=search">高级搜索</a><span class="pipe">|</span>
<a href="cp.php?ac=friend&op=find">可能认识的人</a><span class="pipe">|</span>
<a href="cp.php?ac=invite">邀请好友</a></p>
</div></div></div></div>
</div>

</div>
<!--/sidebar-->

<script type="text/javascript">

var next = <?=$start?>;
function feed_more() {
var x = new Ajax('XML', 'ajax_wait');
var html = '';
next = next + <?=$perpage?>;
x.get('cp.php?ac=feed&op=get&start='+next+'&view=<?=$_GET['view']?>&appid=<?=$_GET['appid']?>&icon=<?=$_GET['icon']?>&filter=<?=$_GET['filter']?>&day=<?=$_GET['day']?>', function(s){
html = '<h4 class="feedtime">以下是新读取的动态</h4>' + s;
$('feed_div').innerHTML += html;
});
}

function filter_more(id) {
if($('feed_filter_div_'+id).style.display == '') {
$('feed_filter_div_'+id).style.display = 'none';
$('feed_filter_notice_'+id).style.display = '';
} else {
$('feed_filter_div_'+id).style.display = '';
$('feed_filter_notice_'+id).style.display = 'none';
}
}

function close_feedbox() {
var x = new Ajax();
x.get('cp.php?ac=common&op=closefeedbox', function(s){
$('feed_box').style.display = 'none';
});
}

var elems = selector('li[class~=magicthunder]', $('feed_div')); 
for(var i=0; i<elems.length; i++){		
magicColor(elems[i]); 
}
</script>

<?php my_checkupdate(); ?>
<?php my_showgift(); ?>
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

<?php } ?>
<?php ob_out();?>