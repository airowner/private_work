<?php if(!defined('IN_UCHOME')) exit('Access Denied');?><?php subtplcheck('template/default/space_blog_list|template/default/sns_header|template/default/space_menu|template/default/sns_footer|template/default/header|template/default/space_menu|template/default/footer|template/default/header|template/default/footer', '1340553854', 'template/default/space_blog_list');?><?php $_TPL['titles'] = array('日志'); ?>
<?php $friendsname = array(1 => '仅好友可见',2 => '指定好友可见',3 => '仅自己可见',4 => '凭密码可见'); ?>

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


<?php if(!empty($_SGLOBAL['inajax'])) { ?>
<div id="space_blog" class="feed">
    <h3 class="feed_header">
        <a href="<?php echo usr_url('cp', array('ac'=>'blog')) ?>" class="r_option" target="_blank">发表日志</a>
        日志(共 <?=$count?> 篇)
    </h3>
    <?php if($count) { ?>
    <ul class="line_list">
    <?php if(is_array($list)) { foreach($list as $value) { ?>
        <li>
            <span class="gray r_option"><?php echo sgmdate('m-d H:i',$value[dateline],1); ?></span>
            <h4><a href="<?php echo usr_url('space', array('do'=>'blog', 'id'=>$value['blogid'], 'uid'=>$space['uid'])) ?>" target="_blank" <?php if($value['magiccolor']) { ?> class="magiccolor<?=$value['magiccolor']?>"<?php } ?>><?=$value['subject']?></a></h4>
            <div class="detail">
                <?=$value['message']?>
            </div>
        </li>
    <?php } } ?>
    </ul>
    <?php if($pricount) { ?>
    <div class="c_form">本页有 <?=$pricount?> 篇日志因作者的隐私设置而隐藏</div>
    <?php } ?>
    <div class="page"><?=$multi?></div>
    <?php } else { ?>
    <div class="c_form">还没有相关的日志。</div>
    <?php } ?>
</div>
<?php } else { ?>
<link rel="stylesheet" type="text/css" href="<?=$_USER_SC['domain']?>css/rz.css"/>
<div class="ricz">
    <?php if($space['self']) { ?>
    <div class="ss">
        <div class="hdd">续写我的人生故事</div>
        <form method="get" action="<?php echo usr_url('space', array('do'=>'blog', 'view'=>'all', 'orderby'=>'dateline', 'searchmode'=>'1')) ?>">
            <input class="txt" type="text" name="searchkey" />
            <input class="btn" type="submit" value="搜索日志" />
        </form>
    </div>
    <div class="hdfl">
        <a class="fqhd" href="<?php echo usr_url('space', array('ac'=>$do)) ?>"><img src="<?=$_USER_SC['domain']?>images/fbrz.png" /></a>
        <ul>
            <?php if($space['friendnum']) { ?><li<?php if($actives['we']) { ?> class="sdd01"<?php } else { ?> class="sdd02"<?php } ?>><a href="<?php echo usr_url('space', array('do'=>$do, 'view'=>'we', 'uid'=>$space['uid'])) ?>" class="o"><span>好友最新日志</span></a></li><?php } ?>
<li<?php if($actives['all']) { ?> class="sdd01"<?php } else { ?> class="sdd02"<?php } ?>><a href="<?php echo usr_url('space', array('do'=>$do, 'view'=>'all', 'uid'=>$space['uid'])) ?>" class="t"><span>大家的日志</span></a></li>
<li<?php if($actives['me']) { ?> class="sdd01"<?php } else { ?> class="sdd02"<?php } ?>><a href="<?php echo usr_url('space', array('do'=>$do, 'view'=>'me', 'uid'=>$space['uid'])) ?>" class="f"><span>我的日志</span></a></li>
<?php if(0) { ?><li<?php if($actives['click']) { ?> class="sdd01"<?php } else { ?> class="sdd02"<?php } ?>><a href="<?php echo usr_url('space', array('do'=>$do, 'view'=>'click', 'uid'=>$space['uid'])) ?>"><span>我表态过的日志</span></a></li><?php } ?>
        </ul>
    </div>
    <?php } else { ?>
    <?php $_TPL['spacetitle'] = "日志";
        $_TPL['spacemenus'][] = "<a href=\"space.php?uid=$space[uid]&do=$do&view=me\">TA的所有日志</a>"; ?>
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

    <div class="h_status">按照发布时间排序</div>
    <?php } ?>
    <div class="hdnr">
        <?php if($_GET['orderby'] && $_GET['orderby'] != 'dateline') { ?>
        <div class="h_status">
            排行时间范围：
            <a href="<?php echo usr_url('space', array('do'=>$do, 'view'=>'all', 'orderby'=>$_GET['orderby'])) ?>"<?=$day_actives['0']?>>全部</a><span class="pipe">|</span>
            <a href="<?php echo usr_url('space', array('do'=>$do, 'view'=>'all', 'orderby'=>$_GET['orderby'], 'day'=>'1')) ?>"<?=$day_actives['1']?>>最近一天</a><span class="pipe">|</span>
            <a href="<?php echo usr_url('space', array('do'=>$do, 'view'=>'all', 'orderby'=>$_GET['orderby'], 'day'=>'2')) ?>"<?=$day_actives['2']?>>最近两天</a><span class="pipe">|</span>
            <a href="<?php echo usr_url('space', array('do'=>$do, 'view'=>'all', 'orderby'=>$_GET['orderby'], 'day'=>'7')) ?>"<?=$day_actives['7']?>>最近七天</a><span class="pipe">|</span>
            <a href="<?php echo usr_url('space', array('do'=>$do, 'view'=>'all', 'orderby'=>$_GET['orderby'], 'day'=>'30')) ?>"<?=$day_actives['30']?>>最近三十天</a><span class="pipe">|</span>
            <a href="<?php echo usr_url('space', array('do'=>$do, 'view'=>'all', 'orderby'=>$_GET['orderby'], 'day'=>'90')) ?>"<?=$day_actives['90']?>>最近三个月</a><span class="pipe">|</span>
            <a href="<?php echo usr_url('space', array('do'=>$do, 'view'=>'all', 'orderby'=>$_GET['orderby'], 'day'=>'120')) ?>"<?=$day_actives['120']?>>最近六个月</a>
        </div>
        <?php } ?>

        <?php if($searchkey) { ?>
        <div class="h_status">以下是搜索日志 <span style="color:red;font-weight:bold;"><?=$searchkey?></span> 结果列表</div>
        <?php } ?>
        <?php if($count) { ?>
         <div>
<?php if(is_array($list)) { foreach($list as $value) { ?>
            <div class="dgrz">
                <div class="rztp"><a href="<?php echo usr_url('space', array('uid'=>$value['uid'])) ?>"><?php echo avatar($value[uid],small); ?></a>
                </div>
                <div class="rzjj">
                    <a class="djfx" href="<?php echo usr_url('cp', array('ac'=>'share', 'type'=>'blog', 'id'=>$value['blogid'])) ?>" id="a_share_<?=$value['blogid']?>" onclick="ajaxmenu(event, this.id, 1)" ><img src="<?=$_USER_SC['domain']?>images/qzfx.gif" /></a>
                    <p class="bt"><a href="<?php echo usr_url('space', array('do'=>$do, 'uid'=>$value['uid'], 'id'=>$value['blogid'])) ?>"><?=$value['subject']?></a><span>热度：7</span></p>
                    <p class="bdm"><a href="<?php echo usr_url('space', array('uid'=>$value['uid'])) ?>"><?=$_SN[$value['uid']]?></a>:<?php echo sgmdate('Y-m-d H:i',$value[dateline],1); ?></p>
                    <p id="blog_article_<?=$value['blogid']?>">
<?php if($value['pic']) { ?><p class="image"><a href="<?php echo usr_url('space', array('do'=>$do, 'uid'=>$value['uid'], 'id'=>$value['blogid'])) ?>"><img src="<?=$value['pic']?>" alt="<?=$value['subject']?>" /></a></p><?php } ?>
                    <?=$value['message']?>
                    </p>
                    <?php if($classarr[$value['classid']]) { ?><p>分类: <a href="<?php echo usr_url('space', array('uid'=>$value['uid'], 'do'=>$do, 'classid'=>$value['classid'])) ?>"><?=$classarr[$value['classid']]?></a></p><?php } ?>
                    <p>
                    <?php if($value['viewnum']) { ?><a href="<?php echo usr_url('space', array('uid'=>$value['uid'], 'do'=>$do, 'id'=>$value['blogid'])) ?>"><?=$value['viewnum']?> 次阅读</a><span class="pipe">|</span><?php } ?>
<?php if($value['replynum']) { ?><a href="<?php echo usr_url('space', array('uid'=>$value['uid'], 'do'=>$do, 'id'=>$value['blogid'])) ?>#comment"><?=$value['replynum']?> 个评论</a><?php } else { ?>没有评论<?php } ?>
                    </p>
                </div>
            </div>
<?php } } ?>
<?php if($pricount) { ?>
            <div class="dgrz">本页有 <?=$pricount?> 篇日志因作者的隐私设置而隐藏</div>
<?php } ?>
            <p class="page"><?=$multi?></p>
        </div>
        <?php } else { ?>
        <div>还没有相关的日志。</div>
        <?php } ?>
    </div>
</div>

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


<?php if(!empty($_SGLOBAL['inajax'])) { ?>
<div id="space_blog" class="feed">
<h3 class="feed_header">
<a href="cp.php?ac=blog" class="r_option" target="_blank">发表日志</a>
日志(共 <?=$count?> 篇)
</h3>
<?php if($count) { ?>
<ul class="line_list">
<?php if(is_array($list)) { foreach($list as $value) { ?>
<li>
<span class="gray r_option"><?php echo sgmdate('m-d H:i',$value[dateline],1); ?></span>
<h4><a href="space.php?uid=<?=$space['uid']?>&do=blog&id=<?=$value['blogid']?>" target="_blank" <?php if($value['magiccolor']) { ?> class="magiccolor<?=$value['magiccolor']?>"<?php } ?>><?=$value['subject']?></a></h4>
<div class="detail">
<?=$value['message']?>
</div>
</li>
<?php } } ?>
</ul>
<?php if($pricount) { ?>
<div class="c_form">本页有 <?=$pricount?> 篇日志因作者的隐私设置而隐藏</div>
<?php } ?>
<div class="page"><?=$multi?></div>
<?php } else { ?>
<div class="c_form">还没有相关的日志。</div>
<?php } ?>
</div>
<?php } else { ?>

<?php if($space['self']) { ?>
<div class="searchbar floatright">
<form method="get" action="space.php">
<input name="searchkey" value="" size="15" class="t_input" type="text">
<input name="searchsubmit" value="搜索日志" class="submit" type="submit">
<input type="hidden" name="searchmode" value="1" />
<input type="hidden" name="do" value="blog" />
<input type="hidden" name="view" value="all" />
<input type="hidden" name="orderby" value="dateline" />
</form>
</div>
<h2 class="title"><img src="<?=$_USER_SC['domain']?>image/app/blog.gif" />日志</h2>
<div class="tabs_header">
<ul class="tabs">
<?php if($space['friendnum']) { ?><li<?=$actives['we']?>><a href="space.php?uid=<?=$space['uid']?>&do=<?=$do?>&view=we"><span>好友最新日志</span></a></li><?php } ?>
<li<?=$actives['all']?>><a href="space.php?uid=<?=$space['uid']?>&do=<?=$do?>&view=all"><span>大家的日志</span></a></li>
<li<?=$actives['me']?>><a href="space.php?uid=<?=$space['uid']?>&do=<?=$do?>&view=me"><span>我的日志</span></a></li>
<li<?=$actives['click']?>><a href="space.php?uid=<?=$space['uid']?>&do=<?=$do?>&view=click"><span>我表态过的日志</span></a></li>
<li class="null"><a href="cp.php?ac=blog">发表新日志</a></li>
</ul>
</div>		
<?php } else { ?>
<?php $_TPL['spacetitle'] = "日志";
	$_TPL['spacemenus'][] = "<a href=\"space.php?uid=$space[uid]&do=$do&view=me\">TA的所有日志</a>"; ?>
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

<div class="h_status">按照发布时间排序</div>
<?php } ?>

<div id="content" style="width:640px;">
<?php if($_GET['orderby'] && $_GET['orderby'] != 'dateline') { ?>
<div class="h_status">
排行时间范围：
<a href="space.php?do=blog&view=all&orderby=<?=$_GET['orderby']?>"<?=$day_actives['0']?>>全部</a><span class="pipe">|</span>
<a href="space.php?do=blog&view=all&orderby=<?=$_GET['orderby']?>&day=1"<?=$day_actives['1']?>>最近一天</a><span class="pipe">|</span>
<a href="space.php?do=blog&view=all&orderby=<?=$_GET['orderby']?>&day=2"<?=$day_actives['2']?>>最近两天</a><span class="pipe">|</span>
<a href="space.php?do=blog&view=all&orderby=<?=$_GET['orderby']?>&day=7"<?=$day_actives['7']?>>最近七天</a><span class="pipe">|</span>
<a href="space.php?do=blog&view=all&orderby=<?=$_GET['orderby']?>&day=30"<?=$day_actives['30']?>>最近三十天</a><span class="pipe">|</span>
<a href="space.php?do=blog&view=all&orderby=<?=$_GET['orderby']?>&day=90"<?=$day_actives['90']?>>最近三个月</a><span class="pipe">|</span>
<a href="space.php?do=blog&view=all&orderby=<?=$_GET['orderby']?>&day=120"<?=$day_actives['120']?>>最近六个月</a>
</div>
<?php } ?>

<?php if($searchkey) { ?>
<div class="h_status">以下是搜索日志 <span style="color:red;font-weight:bold;"><?=$searchkey?></span> 结果列表</div>
<?php } ?>

<?php if($count) { ?>
<div class="entry_list">
<ul>
<?php if(is_array($list)) { foreach($list as $value) { ?>
<li>
<div class="avatardiv">
<div class="avatar48"><a href="space.php?uid=<?=$value['uid']?>"><?php echo avatar($value[uid],small); ?></a></div>
<?php if($value['hot']) { ?><div class="digb"><?=$value['hot']?></div><?php } ?>
</div>

<div class="title">
<a href="cp.php?ac=share&type=blog&id=<?=$value['blogid']?>" id="a_share_<?=$value['blogid']?>" onclick="ajaxmenu(event, this.id, 1)" class="a_share">分享</a>
<h4><a href="space.php?uid=<?=$value['uid']?>&do=<?=$do?>&id=<?=$value['blogid']?>" <?php if($value['magiccolor']) { ?> class="magiccolor<?=$value['magiccolor']?>"<?php } ?>><?=$value['subject']?></a></h4>
<div>
<?php if($value['friend']) { ?>
<span class="r_option locked gray"><a href="<?=$theurl?>&friend=<?=$value['friend']?>" class="gray"><?=$friendsname[$value['friend']]?></a></span>
<?php } ?>
<a href="space.php?uid=<?=$value['uid']?>"><?=$_SN[$value['uid']]?></a> <span class="gray"><?php echo sgmdate('Y-m-d H:i',$value[dateline],1); ?></span>
</div>
</div>
<div class="detail image_right l_text s_clear" id="blog_article_<?=$value['blogid']?>">
<?php if($value['pic']) { ?><p class="image"><a href="space.php?uid=<?=$value['uid']?>&do=blog&id=<?=$value['blogid']?>"><img src="<?=$value['pic']?>" alt="<?=$value['subject']?>" /></a></p><?php } ?>
<?=$value['message']?>
</div>
<div class="gray">
<?php if($classarr[$value['classid']]) { ?>分类: <a href="space.php?uid=<?=$value['uid']?>&do=blog&classid=<?=$value['classid']?>"><?=$classarr[$value['classid']]?></a><span class="pipe">|</span><?php } ?>
<?php if($value['viewnum']) { ?><a href="space.php?uid=<?=$value['uid']?>&do=<?=$do?>&id=<?=$value['blogid']?>"><?=$value['viewnum']?> 次阅读</a><span class="pipe">|</span><?php } ?>
<?php if($value['replynum']) { ?><a href="space.php?uid=<?=$value['uid']?>&do=<?=$do?>&id=<?=$value['blogid']?>#comment"><?=$value['replynum']?> 个评论</a><?php } else { ?>没有评论<?php } ?>
</div>
</li>
<?php } } ?>
<?php if($pricount) { ?>
<li>
<div class="title">本页有 <?=$pricount?> 篇日志因作者的隐私设置而隐藏</div>
</li>
<?php } ?>
</ul>
</div>

<div class="page"><?=$multi?></div>

<?php } else { ?>
<div class="c_form">还没有相关的日志。</div>
<?php } ?>

</div>

<div id="sidebar" style="width:150px;">

<?php if($userlist) { ?>
<div class="cat">
<h3>按好友查看</h3>
<ul class="post_list line_list">
<li>
选择好友:<br>
<select name="fuidsel" onchange="fuidgoto(this.value);">
<option value="">全部好友</option>
<?php if(is_array($userlist)) { foreach($userlist as $value) { ?>
<option value="<?=$value['fuid']?>"<?=$fuid_actives[$value['fuid']]?>><?=$_SN[$value['fuid']]?></option>
<?php } } ?>
</select>
</li>
</ul>
</div>
<?php } ?>

<?php if($classarr) { ?>
<div class="cat">
<h3>日志分类</h3>
<ul class="post_list line_list">
<li<?php if(!$_GET['classid']) { ?> class="current"<?php } ?>><a href="space.php?uid=<?=$space['uid']?>&do=blog&view=me">全部日志</a></li>
<?php if(is_array($classarr)) { foreach($classarr as $classid => $classname) { ?>
<li<?php if($_GET['classid']==$classid) { ?> class="current"<?php } ?>>
<?php if($space['self']) { ?>
<a href="cp.php?ac=class&op=edit&classid=<?=$classid?>" id="c_edit_<?=$classid?>" onclick="ajaxmenu(event, this.id)" class="c_edit">编辑</a>
<a href="cp.php?ac=class&op=delete&classid=<?=$classid?>" id="c_delete_<?=$classid?>" onclick="ajaxmenu(event, this.id)" class="c_delete">删除</a>
<?php } ?>
<a href="space.php?uid=<?=$space['uid']?>&do=blog&classid=<?=$classid?>&view=me"><?=$classname?></a>
</li>
<?php } } ?>
</ul>
</div>
<?php } ?>

<?php if($_GET['view'] == 'click') { ?>
<div class="cat">
<h3>表态动作</h3>
<ul class="post_list line_list">
<li<?=$click_actives['all']?>><a href="space.php?do=blog&view=click">全部动作</a></li>
<?php if(is_array($clicks)) { foreach($clicks as $value) { ?>
<li<?=$click_actives[$value['clickid']]?>>
<a href="space.php?do=blog&view=click&clickid=<?=$value['clickid']?>"><?=$value['name']?></a>
</li>
<?php } } ?>
</ul>
</div>
<?php } elseif($_GET['view'] == 'all') { ?>
<div class="cat">
<h3>排行榜</h3>
<ul class="post_list line_list">
<li<?=$all_actives['all']?>><a href="space.php?do=blog&view=all">推荐阅读</a></li>
<li<?=$all_actives['dateline']?>><a href="space.php?do=blog&view=all&orderby=dateline">最新发表</a></li>
<li<?=$all_actives['hot']?>><a href="space.php?do=blog&view=all&orderby=hot&day=<?=$_GET['hotday']?>">人气排行</a></li>
<li<?=$all_actives['replynum']?>><a href="space.php?do=blog&view=all&orderby=replynum&day=<?=$_GET['hotday']?>">评论排行</a></li>
<li<?=$all_actives['viewnum']?>><a href="space.php?do=blog&view=all&orderby=viewnum&day=<?=$_GET['hotday']?>">查看排行</a></li>
<?php if(is_array($clicks)) { foreach($clicks as $value) { ?>
<li<?=$all_actives['click_'.$value['clickid']]?>><a href="space.php?do=blog&view=all&orderby=click_<?=$value['clickid']?>&day=<?=$_GET['hotday']?>"><?=$value['name']?>排行</a></li>
<?php } } ?>
</ul>

</div>
<?php } ?>

</div>

<script>
function fuidgoto(fuid) {
window.location.href = "space.php?do=blog&view=we&fuid="+fuid;
}
</script>
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

<?php } ?>
<?php ob_out();?>