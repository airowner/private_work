<?php if(!defined('IN_UCHOME')) exit('Access Denied');?><?php subtplcheck('template/default/space_index|template/default/sns_header|template/default/space_feed_li|template/default/space_status|template/default/space_feed_li|template/default/space_comment_li|template/default/sns_footer|template/default/header|template/default/footer', '1340553856', 'template/default/space_index');?><?php $_TPL['nosidebar']=1; ?>
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
    <div class="zrxq">
        <div class="zrtx"><?php echo avatar($space[uid],'100x100'); ?></div>
        <div class="zrjj">
            <p class="mzd"><b><?=$space['username']?> ID：1</b><?php if($isonline) { ?>当前在线<?php } else { ?>当前离线<?php } ?><span><a href="#">我要隐身</a></span></p>
            <p>已有 <?=$space['viewnum']?> 人次访问, <?=$space['credit']?> 个积分, <?=$space['experience']?> 个经验 <?=$space['star']?></p>
<?php if($space['self']) { ?>
        <p class="qtlj">
        <a href="<?php echo usr_url('cp', array('ac'=>'avatar')) ?>">我的头像</a><span>|</span><a href="<?php echo usr_url('cp', array('ac'=>'profile')) ?>">个人资料</a><span>|</span><a href="<?php echo usr_url('cp', array('ac'=>'theme')) ?>">主页风格</a><span>|</span><a href="<?php echo usr_url('cp', array('ac'=>'credit')) ?>">我的积分</a><span>|</span><a href="<?php echo usr_url('cp', array('ac'=>'privacy')) ?>">隐私筛选</a>
        <?php if(checkperm('managename')||checkperm('managespacegroup')||checkperm('managespaceinfo')||checkperm('managespacecredit')||checkperm('managespacenote')) { ?>
            <span>|</span><a href="<?php echo usr_url('admincp', array('ac'=>'space', 'op'=>'manage', 'uid'=>$space[uid])) ?>" id="a_manage">管理用户</a>
        <?php } ?>
        </p>
<?php } else { ?>
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
<?php } ?>
        </div>
    </div>
    <!--主人详情结束-->
    <div class="gg"><a href="#"><img src="<?=$_USER_SC['domain']?>images/gg.png" /></a></div>
    <div class="yd">任务引导</div>
    <!--好友动态-->
    <div class="hydt">
        <div class="dtfl">
            <ul>
                <li class="sdd01" id="zs01"><a class="o" href="#">好友动态</a></li>
                <li class="sdd02" id="zs02"><a class="t" href="#">全站动态</a></li>
                <li class="sdd02" id="zs03"><a class="f" href="#">我的动态</a></li>
                <li class="sdd02" id="zs04"><a class="s" href="#">精选图片</a></li>
            </ul>
        </div>
        <div class="hydnr">
            <?php if($feedlist) { ?>
            <?php $_TPL['hidden_hot']=1; ?>
            <div id="space_feed" class="feed">
                <h3 class="feed_header">
                    <span class="r_option">
                    <a href="space.php?uid=<?=$space['uid']?>&do=feed&view=me" class="action">全部</a>
                    </span>
                    <span class="entry-title">个人动态</span>
                </h3>
                <div class="box_content">
                    <ul>
                    <?php if(is_array($feedlist)) { foreach($feedlist as $value) { ?>
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
            </div>
            <?php } ?>
            <div id="to01">
                <p class="ntx">好友动态：</p>
                <p>好友 参与的 [心情][日志][相册][分享][投票][活动]</p>
                <p>好友 收到的[礼物]</p>
                <p>好友 加入的[圈子]、发表的[话题]</p>
                <p>好友 结交好友</p>
                <p class="ntx">全站动态：</p>
                <p>同好友动态</p>
                <p class="ntx">我的动态：</p>
                <p>我的所有动态</p>
                <a class="mdt" href="#"><img src="<?=$_USER_SC['domain']?>images/gddt.gif" /></a>
            </div>
            <div class="hidden" id="to02"></div>
            <div class="hidden" id="to03"></div>
            <div class="hidden" id="to04"></div>
        </div>
    </div>
    <!--好友动态结束-->
</div>
<!--中间内容结束-->
<!--右侧内容-->
<div class="ricz">
    <div class="hf">
        <div class="hffld">
            <ul>
                <li class="sd01" id="zt01"><a class="o" href="#">谁来看过我</a></li>
                <li class="sd02" id="zt02"><a class="t" href="#">我去看过谁</a></li>
            </ul>
        </div>
        <div class="hfnr">
            <div id="nr01">
            <ul>
                <li><a href="#"><img src="<?=$_USER_SC['domain']?>images/fktx.png" /><br />skldfje</a><br />3月25日</li>
                <li><a href="#"><img src="<?=$_USER_SC['domain']?>images/fktx.png" /><br />skldfje</a><br />3月25日</li>
                <li class="nm"><a href="#"><img src="<?=$_USER_SC['domain']?>images/fktx.png" /><br />skldfje</a><br />3月25日</li>
            </ul>
            </div>
            <div class="hidden" id="nr02">
            <ul>
                <li><a href="#"><img src="<?=$_USER_SC['domain']?>images/fktx.png" /><br />skldfje</a><br />3月25日</li>
                <li><a href="#"><img src="<?=$_USER_SC['domain']?>images/fktx.png" /><br />skldfje</a><br />3月25日</li>
                <li class="nm"><a href="#"><img src="<?=$_USER_SC['domain']?>images/fktx.png" /><br />skldfje</a><br />3月25日</li>
            </ul>
            </div>
        </div>
    </div>
    
    <div class="xcy">
        <h4>新成员</h4>
        <div class="cynr">
            <ul>
                <li><a href="#"><img src="<?=$_USER_SC['domain']?>images/fktx.png" /><br />skldfje</a><br />3月25日</li>
                <li><a href="#"><img src="<?=$_USER_SC['domain']?>images/fktx.png" /><br />skldfje</a><br />3月25日</li>
                <li class="nm"><a href="#"><img src="<?=$_USER_SC['domain']?>images/fktx.png" /><br />skldfje</a><br />3月25日</li>
            </ul>
        </div>
    </div>
    
    <div class="zjhd">
        <h4>活动任务表</h4>
        <div class="hdnr">
            <div class="dghd">
                <p><a href="#">机密资料完善</a></p>
                <p>Time: 2012.01.02</p>
            </div>
            <div class="dghd">
                <p><a href="#">机密资料完善</a></p>
                <p>Time: 2012.01.02</p>
            </div>
        </div>
    </div>

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


<?php if(0) { ?>
<?php if($narrowlist || $widelist) { ?>
<script type="text/javascript" src="source/script_swfobject.js"></script>
<?php } ?>

<div id="space_page">

<div id="ubar">

<div id="space_avatar">
            <?php if($space['magicstar'] && $space['magicexpire']>$_SGLOBAL['timestamp']) { ?>
<div class="magicstar">
<object codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,45,0" width="200" height="250">
<param name="movie" value="image/magic/star/<?=$space['magicstar']?>.swf" />
<param name="quality" value="high" />
<param NAME="wmode" value="transparent">
<embed src="<?=$_USER_SC['domain']?>image/magic/star/<?=$space['magicstar']?>.swf" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash"  wmode="transparent" width="200" height="250"></embed>
</object>
</div>

<div class="magicavatar"><?php } else { ?><div><?php } ?><?php echo avatar($space[uid],big); ?></div>

</div>

<?php if($space['self'] && $_SGLOBAL['magic']['superstar']) { ?>
<div class="borderbox">
<div style="width:100%; overflow:hidden;">
<img src="<?=$_USER_SC['domain']?>image/magic/superstar.small.gif" class="magicicon" />
<?php if($space['magicstar'] && $space['magicexpire']>$_SGLOBAL['timestamp']) { ?>
<a id="a_magic_superstar" href="cp.php?ac=magic&op=cancelsuperstar" onclick="ajaxmenu(event, this.id)">取消超级明星</a>
<?php } else { ?>
<a id="a_magic_superstar" href="magic.php?mid=superstar" onclick="ajaxmenu(event, this.id, 1)">我要变超级明星</a>
<?php } ?>
</div>
</div><br />
<?php } ?>

<div class="borderbox">
<ul class="spacemenu_list" style="width:100%; overflow:hidden;">
<?php if($space['self']) { ?>
<li><a href="cp.php?ac=avatar">我的头像</a></li>
<li><a href="cp.php?ac=profile">个人资料</a></li>
<li><a href="cp.php?ac=theme">主页风格</a></li>
<li><a href="cp.php?ac=credit">我的积分</a></li>
<?php if($_SCONFIG['sendmailday']) { ?>
<li><a href="cp.php?ac=sendmail">邮件提醒</a></li>
<?php } ?>
<li><a href="cp.php?ac=privacy">隐私筛选</a></li>
<?php } else { ?>
<?php if(!$space['isfriend']) { ?>
<li><img src="<?=$_USER_SC['domain']?>image/icon/friend.gif"><a href="cp.php?ac=friend&op=add&uid=<?=$space['uid']?>" id="a_friend_li" onclick="ajaxmenu(event, this.id, 1)">加为好友</a></li>
<?php } ?>
<li><img src="<?=$_USER_SC['domain']?>image/icon/wall.gif"><a href="#comment">给我留言</a></li>
<li><img src="<?=$_USER_SC['domain']?>image/icon/poke.gif"><a href="cp.php?ac=poke&op=send&uid=<?=$space['uid']?>" id="a_poke" onclick="ajaxmenu(event, this.id, 1)">打个招呼</a></li>
<li><img src="<?=$_USER_SC['domain']?>image/icon/pm.gif"><a href="cp.php?ac=pm&uid=<?=$space['uid']?>" id="a_pm" onclick="ajaxmenu(event, this.id, 1)">发送消息</a></li>
<?php if($space['isfriend']) { ?>
<li><img src="<?=$_USER_SC['domain']?>image/icon/friend.gif"><a href="cp.php?ac=friend&op=ignore&uid=<?=$space['uid']?>" id="a_ignore" onclick="ajaxmenu(event, this.id)">解除好友</a></li>
<?php } ?>
<li><img src="<?=$_USER_SC['domain']?>image/icon/report.gif"><a href="cp.php?ac=common&op=report&idtype=uid&id=<?=$space['uid']?>" id="a_report" onclick="ajaxmenu(event, this.id, 1)">违规举报</a></li>
<?php if(checkperm('managename')||checkperm('managespacegroup')||checkperm('managespaceinfo')||checkperm('managespacecredit')||checkperm('managespacenote')) { ?>
<li><img src="<?=$_USER_SC['domain']?>image/icon/profile.gif"><a href="admincp.php?ac=space&op=manage&uid=<?=$space['uid']?>" id="a_manage">管理用户</a></li>
<?php } ?>
<?php } ?>
</ul>
</div><br />

<div id="space_mymenu">
<h2>个人菜单</h2>
<ul class="line_list">
<li>
<?php if($space['self']) { ?>
<a href="cp.php?ac=profile" class="r_option" target="_blank">完善</a>
<?php } ?>
<img src="<?=$_USER_SC['domain']?>image/icon/profile.gif"><a href="javascript:;" onclick="getindex('info');">个人资料</a>
</li>
<li>
<?php if($space['self']) { ?>
<a href="space.php?do=doing&view=me" class="r_option" target="_blank">记录</a>
<?php } ?>
<img src="<?=$_USER_SC['domain']?>image/icon/doing.gif"><a href="javascript:;" onclick="getindex('doing');">记录</a><?php if($space['doingnum']) { ?><em>(<?=$space['doingnum']?>)</em><?php } ?>
</li>
<li>
<?php if($space['self']) { ?>
<a href="cp.php?ac=blog" class="r_option" target="_blank">发表</a>
<?php } ?>
<img src="<?=$_USER_SC['domain']?>image/icon/blog.gif"><a href="javascript:;" onclick="getindex('blog');">日志</a><?php if($space['blognum']) { ?><em>(<?=$space['blognum']?>)</em><?php } ?></li>
<li><?php if($space['self']) { ?>
<a href="cp.php?ac=upload" class="r_option" target="_blank">上传</a>
<?php } ?>
<img src="<?=$_USER_SC['domain']?>image/icon/album.gif"><a href="javascript:;" onclick="getindex('album');">相册</a><?php if($space['albumnum']) { ?><em>(<?=$space['albumnum']?>)</em><?php } ?></li>
<li><?php if($space['self']) { ?>
<a href="cp.php?ac=thread" class="r_option" target="_blank">发表</a>
<?php } ?>
<img src="<?=$_USER_SC['domain']?>image/icon/thread.gif"><a href="javascript:;" onclick="getindex('thread');">话题</a><?php if($space['threadnum']) { ?><em>(<?=$space['threadnum']?>)</em><?php } ?></li>
<li><?php if($space['self']) { ?>
<a href="cp.php?ac=poll" class="r_option" target="_blank">发起</a>
<?php } ?>
<img src="<?=$_USER_SC['domain']?>image/icon/poll.gif"><a href="javascript:;" onclick="getindex('poll');">投票</a><?php if($space['pollnum']) { ?><em>(<?=$space['pollnum']?>)</em><?php } ?></li>
<li><?php if($space['self']) { ?>
<a href="cp.php?ac=event" class="r_option" target="_blank">发起</a>
<?php } ?>
<img src="<?=$_USER_SC['domain']?>image/icon/event.gif"><a href="javascript:;" onclick="getindex('event');">活动</a><?php if($space['eventnum']) { ?><em>(<?=$space['eventnum']?>)</em><?php } ?></li>
<li><?php if($space['self']) { ?>
<a href="space.php?do=share&view=me" class="r_option" target="_blank">添加</a>
<?php } ?>
<img src="<?=$_USER_SC['domain']?>image/icon/share.gif"><a href="javascript:;" onclick="getindex('share');">分享</a><?php if($space['sharenum']) { ?><em>(<?=$space['sharenum']?>)</em><?php } ?></li>
<li><?php if($space['self']) { ?>
<a href="cp.php?ac=friend&op=search" class="r_option" target="_blank">寻找</a>
<?php } ?>
<img src="<?=$_USER_SC['domain']?>image/icon/friend.gif"><a href="javascript:;" onclick="getindex('friend');">好友</a><?php if($space['friendnum']) { ?><em>(<?=$space['friendnum']?>)</em><?php } ?></li>
</ul>
</div>

<?php if($guidelist) { ?>
<div id="space_app_guide">
<h2>应用菜单</h2>
<ul class="line_list">
<?php if(is_array($guidelist)) { foreach($guidelist as $value) { ?>
<li id="space_app_profilelink_<?=$value['appid']?>">
<?php if($space['self']) { ?>
<a href="cp.php?ac=space&op=delete&appid=<?=$value['appid']?>&type=profilelink" id="user_app_profile_<?=$value['appid']?>" class="r_option float_del" style="position: static;" onclick="ajaxmenu(event, this.id)" title="删除">删除</a>
<?php } ?>
<img src="http://appicon.manyou.com/icons/<?=$value['appid']?>"><?php eval($value[profilelink]); ?>
</li>
<?php } } ?>
</ul>
</div>
<?php } ?>

<?php if(is_array($narrowlist)) { foreach($narrowlist as $value) { ?>
<div id="space_app_<?=$value['appid']?>">
<h2>
<?php if($space['self']) { ?>
<a href="cp.php?ac=space&op=delete&appid=<?=$value['appid']?>" id="user_app_<?=$value['appid']?>" class="r_option float_del" onclick="ajaxmenu(event, this.id)" title="删除">删除</a>
<?php } ?>
<a href="<?=$value['appurl']?>"><?=$value['appname']?></a>
</h2>
<?php if($value['myml']) { ?>
<div class="box">
<?php eval($value[myml]); ?>
</div>
<?php } ?>
</div>
<?php } } ?>

</div>

<div id="content">

<h3 id="spaceindex_name">
<?php if($_SCONFIG['realname']) { ?>
<?php if($space['name']) { ?><a href="space.php?uid=<?=$space['uid']?>"<?php g_color($space[groupid]); ?>><?=$space['name']?></a><?php } else { ?>未填写实名<?php } ?>
&nbsp;<em>(用户名: <?=$space['username']?>)</em>
<?php } else { ?>
<a href="space.php?uid=<?=$space['uid']?>"<?php g_color($space[groupid]); ?>><?=$space['username']?></a>
<?php if($space['name']) { ?>&nbsp;<em>(姓名: <?=$space['name']?>)</em><?php } ?>
<?php } ?>

<?php if($_SCONFIG['realname']) { ?>
<?php if($space['namestatus']) { ?>
&nbsp;<img src="<?=$_USER_SC['domain']?>image/realname_yes.gif" align="absmiddle" alt="已通过实名认证">
<?php } else { ?>
&nbsp;<img src="<?=$_USER_SC['domain']?>image/realname_no.gif" align="absmiddle" alt="未通过实名认证"> <span class="gray">实名未认证</span>
<?php } ?>
<?php } ?>

<?php if($_SCONFIG['videophoto']) { ?>	
<?php if($space['videostatus']) { ?>
&nbsp;<img src="<?=$_USER_SC['domain']?>image/videophoto_yes.gif" align="absmiddle" alt="已通过视频认证"> <a id="a_space_videophoto" href="space.php?uid=<?=$space['uid']?>&do=videophoto" onclick="ajaxmenu(event, this.id, 1)"><span style="color:red;font-weight:bold;font-size:12px;">查看视频认证照</span></a>
<?php } else { ?>
&nbsp; <img src="<?=$_USER_SC['domain']?>image/videophoto_no.gif" align="absmiddle" alt="未通过视频认证"> <span class="gray"><a href="cp.php?ac=videophoto">视频未认证</a></span>
<?php } ?>
<?php } ?>
</h3>


<div id="spaceindex_note">
<a href="cp.php?ac=share&type=space&id=<?=$space['uid']?>" class="a_share" id="a_share" onclick="ajaxmenu(event, this.id, 1)">分享</a>
<a href="rss.php?uid=<?=$space['uid']?>" id="i_rss" title="订阅 RSS">订阅</a>

<ul class="note_list">
<li>已有 <?=$space['viewnum']?> 人次访问, <?=$space['credit']?> 个积分, <?=$space['experience']?> 个经验 <?=$space['star']?></li>
<li>用户组别：<a href="cp.php?ac=credit&op=usergroup"><?=$_SGLOBAL['grouptitle'][$space['groupid']]['grouptitle']?></a> <?php g_icon($space[groupid]); ?></li>
<li>主页地址：<a href="<?=$space['domainurl']?>" onclick="javascript:setCopy('<?=$space['domainurl']?>');return false;" class="spacelink domainurl"><?=$space['domainurl']?></a></li>

<?php if(!$space['self'] && $space['spacenote']) { ?>
<li><?=$space['spacenote']?> <a href="space.php?uid=<?=$space['uid']?>&do=doing">&raquo;</a></li>
<?php } ?>
</ul>

<?php if($space['self']) { ?>
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
<?php } ?>
</div>

<div id="maincontent">

<?php if(!$space['isfriend']) { ?>
<div class="borderbox">
<p style="padding-bottom:10px;">如果您认识<?=$_SN[$space['uid']]?>，可以给TA留个言，或者打个招呼，或者添加为好友。<br />成为好友后，您就可以第一时间关注到TA的更新动态。</p>
<a href="cp.php?ac=friend&op=add&uid=<?=$space['uid']?>" id="a_friend_notice" onclick="ajaxmenu(event, this.id, 1)" class="submit">加为好友</a></p>
</div><br>
<?php } ?>

<div id="space_info">
<h3 class="feed_header">
<?php if($space['self']) { ?>
<a href="cp.php?ac=profile" class="r_option">完善资料</a>
<?php } ?>
个人资料
</h3>
<ul class="spacemenu_list">
<li><em>创建:</em><?php echo sgmdate('Y-m-d',$space[dateline],1); ?></li>
<li><em>登录:</em><?php if($space['lastlogin']) { ?><?php echo sgmdate('Y-m-d',$space[lastlogin],1); ?><?php } ?></li>
<?php if($isonline) { ?>
<li><em>活跃:</em><?=$isonline?> (当前在线)</li>
<?php } ?>
<?php if($space['sex']) { ?>
<li><em>性别:</em><?=$space['sex']?></li>
<?php } ?>
<?php if($space['birth']) { ?>
<li><em>生日:</em><?=$space['birth']?></li>
<?php } ?>
<?php if($space['blood']) { ?>
<li><em>血型:</em><?=$space['blood']?></li>
<?php } ?>
<?php if($space['marry']) { ?>
<li><em>婚恋:</em><?=$space['marry']?></li>
<?php } ?>
<?php if($space['residecity']) { ?>
<li><em>居住:</em><?=$space['residecity']?></li>
<?php } ?>
<?php if($space['birthcity']) { ?>
<li><em>家乡:</em><?=$space['birthcity']?></li>
<?php } ?>
<?php if($space['mobile']) { ?>
<li><em>手机:</em><?=$space['mobile']?></li>
<?php } ?>
<?php if($space['qq']) { ?>
<li><em>QQ:</em><?=$space['qq']?></li>
<?php } ?>
<?php if($space['msn']) { ?>
<li><em>MSN:</em><?=$space['msn']?></li>
<?php } ?>
</ul>
<p class="info_more"><a href="javascript:;" onclick="getindex('info');">&raquo; 查看全部个人资料</a></p>
</div>

<?php if($feedlist) { ?>
<?php $_TPL['hidden_hot']=1; ?>
<div id="space_feed" class="feed">
<h3 class="feed_header">
<span class="r_option">
<a href="space.php?uid=<?=$space['uid']?>&do=feed&view=me" class="action">全部</a>
</span>
<span class="entry-title">个人动态</span>
</h3>
<div class="box_content">
<ul>
<?php if(is_array($feedlist)) { foreach($feedlist as $value) { ?>
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
</div>
<?php } ?>

<?php if($albumlist) { ?>
<div id="space_photo">
<h3 class="feed_header">
<a href="space.php?uid=<?=$space['uid']?>&do=album&view=me" class="r_option">全部</a>
相册
</h3>
<table cellspacing="4" cellpadding="4" width="100%">
<tr>
<?php if(is_array($albumlist)) { foreach($albumlist as $key => $value) { ?>
<td width="85" align="center"><a href="space.php?uid=<?=$space['uid']?>&do=album&id=<?=$value['albumid']?>" target="_blank"><img src="<?=$value['pic']?>" alt="<?=$value['albumname']?>" width="70" /></a></td>
<td width="165">
<h6><a href="space.php?uid=<?=$space['uid']?>&do=album&id=<?=$value['albumid']?>" target="_blank" title="<?=$value['albumname']?>"><?=$value['albumname']?></a></h6>
<p class="gray"><?=$value['picnum']?> 张照片</p>
<p class="gray">更新于 <?php echo sgmdate('m-d',$value[dateline],1); ?></p>
</td>
<?php if($key%2==1) { ?></tr><tr><?php } ?>
<?php } } ?>
</tr>
</table>
</div>
<?php } ?>

<?php if($bloglist) { ?>
<div id="space_blog" class="feed">
<h3 class="feed_header">
<a href="space.php?uid=<?=$space['uid']?>&do=blog&view=me" class="r_option">全部</a>
日志
</h3>
<ul class="line_list">
<?php if(is_array($bloglist)) { foreach($bloglist as $value) { ?>
<li>

<h4>
<span class="gray r_option"><?php echo sgmdate('m-d H:i',$value[dateline],1); ?></span>
<a href="space.php?uid=<?=$space['uid']?>&do=blog&id=<?=$value['blogid']?>" target="_blank"><?=$value['subject']?></a>
</h4>
<div class="detail">
<?=$value['message']?>
</div>
</li>
<?php } } ?>
</ul>
</div>
<?php } ?>


<?php if(is_array($widelist)) { foreach($widelist as $value) { ?>
<?php if($value['myml']) { ?>
<div id="space_app_<?=$value['appid']?>" class="appbox">
<h3 class="feed_header">
<?php if($space['self']) { ?>
<a href="cp.php?ac=space&op=delete&appid=<?=$value['appid']?>" id="user_app_<?=$value['appid']?>" class="r_option float_del" onclick="ajaxmenu(event, this.id)" title="删除">删除</a>
<?php } ?>
<a href="<?=$value['appurl']?>"><?=$value['appname']?></a>
</h3>
<div class="box" style="margin: 0 0 20px;">
<?php eval($value[myml]); ?>
</div>
</div>
<?php } ?>
<?php } } ?>

</div>

<div id="comment" class="comments_list">
<h3 class="feed_header">
<a href="space.php?uid=<?=$space['uid']?>&do=wall&view=me" class="r_option">全部</a>
留言板
</h3>

<div class="box">
<form action="cp.php?ac=comment" id="quick_commentform_<?=$space['uid']?>" name="quick_commentform_<?=$space['uid']?>" method="post" style="padding:0 0 0 5px;">
<a href="###" id="editface" onclick="showFace(this.id, 'comment_message');return false;"><img src="<?=$_USER_SC['domain']?>image/facelist.gif" align="absmiddle" /></a>
<?php if($_SGLOBAL['magic']['doodle']) { ?>
<a id="a_magic_doodle" href="magic.php?mid=doodle&showid=comment_doodle&target=comment_message" onclick="ajaxmenu(event, this.id, 1)"><img src="<?=$_USER_SC['domain']?>image/magic/doodle.small.gif" class="magicicon" />涂鸦板</a>
<?php } ?>
<br />
<textarea name="message" id="comment_message" rows="4" cols="60" style="width:98%;" onkeydown="ctrlEnter(event, 'commentsubmit_btn');"></textarea><br>
<input type="hidden" name="refer" value="space.php?uid=<?=$space['uid']?>" />
<input type="hidden" name="id" value="<?=$space['uid']?>" />
<input type="hidden" name="idtype" value="uid" />
<input type="hidden" name="commentsubmit" value="true" />
<input type="button" id="commentsubmit_btn" name="commentsubmit_btn" class="submit" value="留言" onclick="ajaxpost('quick_commentform_<?=$space['uid']?>', 'wall_add')" />
<span id="__quick_commentform_<?=$space['uid']?>"></span>
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</form>
</div>

<div class="box_content">
<ul class="post_list a_list justify_list" id="comment_ul">
<?php if(is_array($walllist)) { foreach($walllist as $value) { ?>
<?php if(empty($ajax_edit)) { ?><li id="comment_<?=$value['cid']?>_li"><?php } ?>
<?php if($value['author']) { ?>
<div class="avatar48"><a href="space.php?uid=<?=$value['authorid']?>"><?php echo avatar($value[authorid],small); ?></a></div>
<?php } else { ?>
<div class="avatar48"><img src="<?=$_USER_SC['domain']?>image/magic/hidden.gif" class="avatar" /></div>
<?php } ?>
<div class="title">
<div class="r_option">

<?php if($value['authorid'] != $_SGLOBAL['supe_uid'] && $value['author'] == "" && $_SGLOBAL['magic']['reveal']) { ?>
<a id="a_magic_reveal_<?=$value['cid']?>" href="magic.php?mid=reveal&idtype=cid&id=<?=$value['cid']?>" onclick="ajaxmenu(event,this.id,1)"><img src="<?=$_USER_SC['domain']?>image/magic/reveal.small.gif" class="magicicon"><?=$_SGLOBAL['magic']['reveal']?></a>
<span class="pipe">|</span>
<?php } ?>

<?php if($value['authorid']==$_SGLOBAL['supe_uid']) { ?>
<?php if($_SGLOBAL['magic']['anonymous']) { ?>
<img src="<?=$_USER_SC['domain']?>image/magic/anonymous.small.gif" class="magicicon">
<a id="a_magic_anonymous_<?=$value['cid']?>" href="magic.php?mid=anonymous&idtype=cid&id=<?=$value['cid']?>" onclick="ajaxmenu(event,this.id, 1)"><?=$_SGLOBAL['magic']['anonymous']?></a>
<span class="pipe">|</span>
<?php } ?>
<?php if($_SGLOBAL['magic']['flicker']) { ?>
<img src="<?=$_USER_SC['domain']?>image/magic/flicker.small.gif" class="magicicon">
<?php if($value['magicflicker']) { ?>
<a id="a_magic_flicker_<?=$value['cid']?>" href="cp.php?ac=magic&op=cancelflicker&idtype=cid&id=<?=$value['cid']?>" onclick="ajaxmenu(event,this.id)">取消<?=$_SGLOBAL['magic']['flicker']?></a>
<?php } else { ?>
<a id="a_magic_flicker_<?=$value['cid']?>" href="magic.php?mid=flicker&idtype=cid&id=<?=$value['cid']?>" onclick="ajaxmenu(event,this.id, 1)"><?=$_SGLOBAL['magic']['flicker']?></a>
<?php } ?>
<span class="pipe">|</span>
<?php } ?>

<a href="cp.php?ac=comment&op=edit&cid=<?=$value['cid']?>" id="c_<?=$value['cid']?>_edit" onclick="ajaxmenu(event, this.id, 1)">编辑</a>
<?php } ?>
<?php if($value['authorid']==$_SGLOBAL['supe_uid'] || $value['uid']==$_SGLOBAL['supe_uid'] || checkperm('managecomment')) { ?>
<a href="cp.php?ac=comment&op=delete&cid=<?=$value['cid']?>" id="c_<?=$value['cid']?>_delete" onclick="ajaxmenu(event, this.id)">删除</a>
<?php } ?>
<?php if($value['authorid']!=$_SGLOBAL['supe_uid'] && ($value['idtype'] != 'uid' || $space['self'])) { ?>
<a href="cp.php?ac=comment&op=reply&cid=<?=$value['cid']?>&feedid=<?=$feedid?>" id="c_<?=$value['cid']?>_reply" onclick="ajaxmenu(event, this.id, 1)">回复</a>
<?php } ?>
<a href="cp.php?ac=common&op=report&idtype=comment&id=<?=$value['cid']?>" id="a_report_<?=$value['cid']?>" onclick="ajaxmenu(event, this.id, 1)">举报</a>
</div>

<?php if($value['author']) { ?>
<a href="space.php?uid=<?=$value['authorid']?>" id="author_<?=$value['cid']?>"><?=$_SN[$value['authorid']]?></a> 
<?php } else { ?>
匿名
<?php } ?>
<span class="gray"><?php echo sgmdate('Y-m-d H:i',$value[dateline],1); ?></span>

</div>

<div class="detail<?php if($value['magicflicker']) { ?> magicflicker<?php } ?>" id="comment_<?=$value['cid']?>"><?=$value['message']?></div>

<?php if(empty($ajax_edit)) { ?></li><?php } ?>
<?php } } ?>
</ul>
<?php if($walllist) { ?>
<p class="r_option" style="padding:5px 0 10px 0;"><a href="space.php?uid=<?=$space['uid']?>&do=wall&view=me">&raquo; 更多留言</a></p>
<?php } ?>
</div>
</div>
</div>

<div id="obar">
<?php if(!$space['self']) { ?>

<?php if($space['magiccredit']) { ?>
<div class="magichongbao" id="div_magic_gift">
<a id="a_magic_gift" href="cp.php?&ac=magic&op=receive&uid=<?=$space['uid']?>" onclick="ajaxmenu(event, this.id)">送你 <span><?=$space['magiccredit']?></span> 积分大红包</a>
</div>
<?php } ?>

<?php if($_SGLOBAL['magic']['viewmagiclog'] || $_SGLOBAL['magic']['viewmagic'] || $_SGLOBAL['magic']['viewvisitor']) { ?>
<div class="indexmagic">
<?php if(is_array(array('viewmagiclog','viewmagic','viewvisitor'))) { foreach(array('viewmagiclog','viewmagic','viewvisitor') as $mid) { ?>
<?php if($_SGLOBAL['magic'][$mid]) { ?>
<a id="a_magic_<?=$mid?>" href="magic.php?mid=<?=$mid?>&idtype=uid&id=<?=$space['uid']?>" onclick="ajaxmenu(event,this.id,1)">
<img src="<?=$_USER_SC['domain']?>image/magic/<?=$mid?>.small.gif" title="<?=$_SGLOBAL['magic'][$mid]?>" alt="<?=$_SGLOBAL['magic'][$mid]?>">
</a>
<?php } ?>
<?php } } ?>
</div>
<?php } ?>
<?php } else { ?>
<?php if($_SGLOBAL['magic']['gift']) { ?>
<div class="magichongbao" id="div_magic_gift">				
<?php if($space['magiccredit']) { ?>
<a id="a_magic_retrieve" href="cp.php?ac=magic&op=retrieve" onclick="ajaxmenu(event,this.id)">回收埋下的积分</a>
<?php } else { ?>
<a id="a_magic_gift" href="magic.php?mid=gift" onclick="ajaxmenu(event,this.id,1)">给来访者埋个红包</a>
<?php } ?>				
</div>
<?php } ?>
<?php } ?>


<?php if($visitorlist) { ?>
<div class="sidebox">
<h2 class="title">
<a href="space.php?uid=<?=$space['uid']?>&do=friend&view=visitor" class="r_option">全部</a>
最近来访
<?php if(!$space['self'] && $_SGLOBAL['magic']['anonymous']) { ?>
<span class="gray"><img title="<?=$_SGLOBAL['magic']['anonymous']?>" src="<?=$_USER_SC['domain']?>image/magic/anonymous.small.gif"/><a id="a_magic_anonymous" href="magic.php?mid=anonymous&idtype=uid&id=<?=$space['uid']?>" onclick="ajaxmenu(event,this.id,1)">匿名</a></span>
<?php } ?>
</h2>
<ul class="avatar_list">
<?php if(is_array($visitorlist)) { foreach($visitorlist as $key => $value) { ?>
<li>
<?php if($value['vusername'] == '') { ?>
<div class="avatar48"><img src="<?=$_USER_SC['domain']?>image/magic/hidden.gif" alt="匿名" /></div>
<p>匿名</p>
<p class="gray"><?php echo sgmdate('n月j日',$value[dateline],1); ?></p>
<?php } else { ?>
<div class="avatar48"><a href="space.php?uid=<?=$value['vuid']?>"><?php echo avatar($value[vuid],small); ?></a></div>
<p<?php if($ols[$value['vuid']]) { ?> class="online_icon_p"<?php } ?>><a href="space.php?uid=<?=$value['vuid']?>" title="<?=$_SN[$value['vuid']]?>"><?=$_SN[$value['vuid']]?></a></p>
<p class="gray"><?php echo sgmdate('n月j日',$value[dateline],1); ?></p>
<?php } ?>
</li>
<?php } } ?>
</ul>
</div>
<?php } ?>


<?php if($friendlist) { ?>
<div class="sidebox">
<h2 class="title">
<span class="r_option">
<a href="space.php?uid=<?=$space['uid']?>&do=friend&view=me" class="action">全部(<?=$space['friendnum']?>)</a>
</span>
好友
</h2>
<ul class="avatar_list">
<?php if(is_array($friendlist)) { foreach($friendlist as $value) { ?>
<li>
<div class="avatar48"><a href="space.php?uid=<?=$value['fuid']?>"><?php echo avatar($value[fuid],small); ?></a></div>
<p<?php if($ols[$value['fuid']]) { ?> class="online_icon_p"<?php } ?>><a href="space.php?uid=<?=$value['fuid']?>"><?=$_SN[$value['fuid']]?></a></p>
</li>
<?php } } ?>
</ul>
</div>
<?php } ?>

</div>

</div>

<?php if($_GET['theme']) { ?><div class="nn">您是否想使用这款个性风格?<br /><a href="cp.php?ac=theme&op=use&dir=<?=$_GET['theme']?>">[应用]</a><a href="cp.php?ac=theme">[取消]</a></div><?php } ?>
<?php } ?>

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


<script>
function getindex(type) {
var plus = '';
if(type == 'event') plus = '&type=self';
ajaxget('space.php?uid=<?=$space['uid']?>&do='+type+'&view=me'+plus+'&ajaxdiv=maincontent', 'maincontent');
}

//彩虹炫
var elems = selector('div[class~=magicflicker]'); 
for(var i=0; i<elems.length; i++){
magicColor(elems[i]);
}

</script>
<?php ob_out();?>