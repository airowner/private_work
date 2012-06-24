<?php if(!defined('IN_UCHOME')) exit('Access Denied');?><?php subtplcheck('template/default/cp_blog|template/default/header|template/default/cp_topic_menu|template/default/footer|template/default/space_topic_inc', '1340553936', 'template/default/cp_blog');?><?php if(empty($_SGLOBAL['inajax'])) { ?>
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


<?php if($_GET['op'] == 'delete') { ?>

<h1>删除日志</h1>
<a href="javascript:hideMenu();" class="float_del" title="关闭">关闭</a>
<div class="popupmenu_inner">
<form method="post" action="cp.php?ac=blog&op=delete&blogid=<?=$blogid?>">
<p>确定删除指定的日志吗？</p>
<p class="btn_line">
<input type="hidden" name="refer" value="<?=$_SGLOBAL['refer']?>" />
<input type="hidden" name="deletesubmit" value="true" />
<input type="submit" name="btnsubmit" value="确定" class="submit" />
</p>
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</form>
</div>

<?php } elseif($_GET['op'] == 'edithot') { ?>

<h1>调整热度</h1>
<a href="javascript:hideMenu();" class="float_del" title="关闭">关闭</a>
<div class="popupmenu_inner">
<form method="post" action="cp.php?ac=blog&op=edithot&blogid=<?=$blogid?>">
<p class="btn_line">
新的热度：<input type="text" name="hot" value="<?=$blog['hot']?>" size="5"> 
<input type="hidden" name="refer" value="<?=$_SGLOBAL['refer']?>" />
<input type="hidden" name="hotsubmit" value="true" />
<input type="submit" name="btnsubmit" value="确定" class="submit" />
</p>
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</form>
</div>

<?php } else { ?>

<script language="javascript" src="<?=$_USER_SC['domain']?>image/editor/editor_function.js"></script>
<script language="javascript" src="source/script_blog.js"></script>

<?php if($topic) { ?>
<h2 class="title">
<img src="<?=$_USER_SC['domain']?>image/app/topic.gif" />热闹 - <a href="space.php?do=topic&topicid=<?=$topicid?>"><?=$topic['subject']?></a>
</h2>
<div class="tabs_header">
<ul class="tabs">
<li class="active"><a href="javascript:;"><span>凑个热闹</span></a></li>
<li><a href="space.php?do=topic&topicid=<?=$topicid?>"><span>查看热闹</span></a></li>
</ul>
<?php if(checkperm('managetopic') || $topic['uid']==$_SGLOBAL['supe_uid']) { ?>
<div class="r_option">
<a href="cp.php?ac=topic&op=edit&topicid=<?=$topic['topicid']?>">编辑</a> | 
<a href="cp.php?ac=topic&op=delete&topicid=<?=$topic['topicid']?>" id="a_delete_<?=$topic['topicid']?>" onclick="ajaxmenu(event,this.id);">删除</a>
</p>
</div>
<?php } ?>
</div>


<div class="affiche">
<table width="100%">
<tr>
<?php if($topic['pic']) { ?>
<td width="160" id="event_icon" valign="top">
<img src="<?=$topic['pic']?>" width="150">
</td>
<?php } ?>
<td valign="top">
<h2>
<a href="space.php?do=topic&topicid=<?=$topic['topicid']?>"><?=$topic['subject']?></a>
</h2>

<div style="padding:5px 0;"><?=$topic['message']?></div>
<ul>
<li class="gray">发起作者: <a href="space.php?uid=<?=$topic['uid']?>"><?=$_SN[$topic['uid']]?></a></li>
<li class="gray">发起时间: <?=$topic['dateline']?></li>
<?php if($topic['endtime']) { ?><li class="gray">参与截止: <?=$topic['endtime']?></li><?php } ?>
<?php if($topic['joinnum']) { ?>
<li class="gray">参与人次: <?=$topic['joinnum']?></li>
<?php } ?>
<li class="gray">最后参与: <?=$topic['lastpost']?></li>
</ul>

<?php if($topic['allowjoin']) { ?>
<a href="<?=$topic['joinurl']?>" class="feed_po" id="hot_add" onmouseover="showMenu(this.id)">凑个热闹</a>
<ul id="hot_add_menu" class="dropmenu_drop" style="display:none;">
<?php if(in_array('blog', $topic['jointype'])) { ?>
<li><a href="cp.php?ac=blog&topicid=<?=$topicid?>">发表日志</a></li>
<?php } ?>
<?php if(in_array('pic', $topic['jointype'])) { ?>
<li><a href="cp.php?ac=upload&topicid=<?=$topicid?>">上传图片</a></li>
<?php } ?>
<?php if(in_array('thread', $topic['jointype'])) { ?>
<li><a href="cp.php?ac=thread&topicid=<?=$topicid?>">发起话题</a></li>
<?php } ?>
<?php if(in_array('poll', $topic['jointype'])) { ?>
<li><a href="cp.php?ac=poll&topicid=<?=$topicid?>">发起投票</a></li>
<?php } ?>
<?php if(in_array('event', $topic['jointype'])) { ?>
<li><a href="cp.php?ac=event&topicid=<?=$topicid?>">发起活动</a></li>
<?php } ?>
<?php if(in_array('share', $topic['jointype'])) { ?>
<li><a href="cp.php?ac=share&topicid=<?=$topicid?>">添加分享</a></li>
<?php } ?>
</ul>
<?php } else { ?>
<p class="r_option">该热闹已经截止</p>
<?php } ?>
</td>
</tr></table>
</div>

<?php } else { ?>
<h2 class="title"><img src="<?=$_USER_SC['domain']?>image/app/blog.gif" />日志</h2>
<div class="tabs_header">
<ul class="tabs">
<?php if($blog['blogid']) { ?>
<li class="active"><a href="cp.php?ac=blog&blogid=<?=$blog['blogid']?>"><span>编辑日志</span></a></li>
<?php } ?>
<li<?php if(empty($blog['blogid'])) { ?> class="active"<?php } ?>><a href="cp.php?ac=blog"><span>发表新日志</span></a></li>
<li><a href="cp.php?ac=import"><span>日志导入</span></a></li>
<li><a href="space.php?uid=<?=$space['uid']?>&do=blog&view=me"><span>返回我的日志</span></a></li>
</ul>
</div>
<?php } ?>

<div class="c_form">

<style type="text/css">
.userData {behavior:url(#default#userdata);}
</style>


<form method="post" action="cp.php?ac=blog&blogid=<?=$blog['blogid']?>" enctype="multipart/form-data">
<table cellspacing="4" cellpadding="4" width="100%" class="infotable">
<tr>
<td>
<select name="classid" id="classid" onchange="addSort(this)">
<option value="0">选择分类</option>
<?php if(is_array($classarr)) { foreach($classarr as $value) { ?>
<?php if($value['classid'] == $blog['classid']) { ?>
<option value="<?=$value['classid']?>" selected><?=$value['classname']?></option>
<?php } else { ?>
<option value="<?=$value['classid']?>"><?=$value['classname']?></option>
<?php } ?>
<?php } } ?>
<?php if(!$blog['uid'] || $blog['uid']==$_SGLOBAL['supe_uid']) { ?><option value="addoption" style="color:red;">+新建分类</option><?php } ?>
</select>
<input type="text" class="t_input" id="subject" name="subject" value="<?=$blog['subject']?>" size="60" onblur="relatekw();" />
</td>
</tr>
<tr>
<td>
<a id="doodleBox" href="magic.php?mid=doodle&showid=blog_doodle&target=uchome-ttHtmlEditor&from=editor" style="display:none"></a>
<textarea class="userData" name="message" id="uchome-ttHtmlEditor" style="height:100%;width:100%;display:none;border:0px"><?=$blog['message']?></textarea>
<iframe src="editor.php?charset=<?=$_SC['charset']?>&allowhtml=<?=$allowhtml?>&doodle=<?php if(isset($_SGLOBAL['magic']['doodle'])) { ?>1<?php } ?>" name="uchome-ifrHtmlEditor" id="uchome-ifrHtmlEditor" scrolling="no" border="0" frameborder="0" style="width:100%;border: 1px solid #C5C5C5;" height="400"></iframe>
</td>
</tr>
</table>
<table cellspacing="4" cellpadding="4" width="100%" class="infotable">
<tr>
<th width="100">标签</th>
<td><input type="text" class="t_input" size="40" id="tag" name="tag" value="<?=$blog['tag']?>"> <input type="button" name="clickbutton[]" value="自动获取" class="button" onclick="relatekw();"></td>
</tr>

<?php if($blog['uid'] && $blog['uid']!=$_SGLOBAL['supe_uid']) { ?>
<?php $selectgroupstyle='display:none'; ?>
<tbody style="display:none;">
<?php } ?>
<tr>
<th>隐私设置</th>
<td>
<select name="friend" onchange="passwordShow(this.value);">
<option value="0"<?=$friendarr['0']?>>全站用户可见</option>
<option value="1"<?=$friendarr['1']?>>全好友可见</option>
<option value="2"<?=$friendarr['2']?>>仅指定的好友可见</option>
<option value="3"<?=$friendarr['3']?>>仅自己可见</option>
<option value="4"<?=$friendarr['4']?>>凭密码查看</option>
</select>
<span id="span_password" style="<?=$passwordstyle?>">密码:<input type="text" name="password" value="<?=$blog['password']?>" size="10" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"></span>
<input type="checkbox" name="noreply" value="1"<?php if($blog['noreply']) { ?> checked<?php } ?>> 不允许评论
</td>
</tr>
<?php if($blog['uid'] && $blog['uid']!=$_SGLOBAL['supe_uid']) { ?></tbody><?php } ?>
<tbody id="tb_selectgroup" style="<?=$selectgroupstyle?>">
<tr>
<th>指定好友</th>
<td><select name="selectgroup" onchange="getgroup(this.value);">
<option value="">从好友组选择好友</option>
<?php if(is_array($groups)) { foreach($groups as $key => $value) { ?>
<option value="<?=$key?>"><?=$value?></option>
<?php } } ?>
</select> 多次选择会累加到下面的好友名单</td>
</tr>
<tr>
<th>&nbsp;</th>
<td>
<textarea name="target_names" id="target_names" style="width:85%;" rows="3"><?=$blog['target_names']?></textarea>
<br>(可以填写多个好友名，请用空格进行分割)</td>
</tr>
</tbody>


<?php if(checkperm('manageblog')) { ?>
<tr>
<th width="100">热度</th>
<td>
<input type="text" class="t_input" name="hot" id="hot" value="<?=$blog['hot']?>" size="5">
</td>
</tr>
<?php } ?>

<?php if(checkperm('seccode')) { ?>
<?php if($_SCONFIG['questionmode']) { ?>
<tr>
<th style="vertical-align: top;">请回答验证问题</th>
<td>
<p><?php question(); ?></p>
<input type="text" id="seccode" name="seccode" value="" size="15" class="t_input" />
</td>
</tr>
<?php } else { ?>
<tr>
<th style="vertical-align: top;">请填写验证码</th>
<td>
<script>seccode();</script>
<p>请输入上面的4位字母或数字，看不清可<a href="javascript:updateseccode()">更换一张</a></p>
<input type="text" id="seccode" name="seccode" value="" size="15" class="t_input" />
</td>
</tr>
<?php } ?>
<?php } ?>

<tr>
<th width="100">动态选项</th>
<td>
<input type="checkbox" name="makefeed" id="makefeed" value="1"<?php if(ckprivacy('blog', 1)) { ?> checked<?php } ?>> 产生动态 (<a href="cp.php?ac=privacy#feed" target="_blank">更改默认设置</a>)
</td>
</tr>			
</table>
<input type="hidden" name="blogsubmit" value="true" />
<input type="button" id="blogbutton" name="blogbutton" value="提交发布" onclick="validate(this);" style="display: none;" />
<input type="hidden" name="topicid" value="<?=$_GET['topicid']?>" />
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</form>

<?php if(!$_SGLOBAL['inajax'] && (!$blog['uid'] || $blog['uid']==$_SGLOBAL['supe_uid'])) { ?>
<table cellspacing="4" cellpadding="4" width="100%" class="infotable">
<tr><th width="100">图片</th><td>
<input type="button" name="clickbutton[]" value="上传图片" class="button" onclick="edit_album_show('pic')">
<input type="button" name="clickbutton[]" value="插入图片" class="button" onclick="edit_album_show('album')">
</td></tr>
</table>
<?php } ?>

<table cellspacing="4" cellpadding="4" width="100%" id="uchome-edit-pic" class="infotable" style="display:none;">
<tr>
<th width="100">&nbsp;</th>
<td>
<strong>选择图片</strong>: 
<table summary="Upload" cellspacing="2" cellpadding="0">
<tbody id="attachbodyhidden" style="display:none">
<tr>
<td>
<form method="post" id="upload" action="cp.php?ac=upload" enctype="multipart/form-data" target="uploadframe" style="background: transparent;">
<input type="file" name="attach" style="border: 1px solid #CCC;" />
<span id="localfile"></span>
<input type="hidden" name="uploadsubmit" id="uploadsubmit" value="true" />
<input type="hidden" name="albumid" id="albumid" value="0" />
<input type="hidden" name="formhash" value="<?php echo formhash(); ?>" />
</form>
</td>
</tr>
</tbody>
<tbody id="attachbody"></tbody>
</table>
<strong>存储相册</strong>: 
<table cellspacing="2" cellpadding="0">
<tr>
<td>
<select name="albumid" id="uploadalbum" onchange="addSort(this)">
<option value="-1">请选择相册</option>
<option value="-1">默认相册</option>
<?php if(is_array($albums)) { foreach($albums as $value) { ?>
<option value="<?=$value['albumid']?>"><?=$value['albumname']?></option>
<?php } } ?>
<option value="addoption" style="color:red;">+新建相册</option>
</select>
<script src="source/script_upload.js" type="text/javascript"></script>
<iframe id="uploadframe" name="uploadframe" width="0" height="0" marginwidth="0" frameborder="0" src="about:blank"></iframe>
</td>
</tr>
</table>
</td>
</tr>
</table>
<table cellspacing="4" cellpadding="4" width="100%" class="infotable" id="uchome-edit-album" style="display:none;">
<tr>
<th width="100">&nbsp;</th>
<td>
选择相册: <select name="view_albumid" onchange="picView(this.value)">
<option value="none">选择一个相册</option>
<option value="0">默认相册</option>
<?php if(is_array($albums)) { foreach($albums as $value) { ?>
<option value="<?=$value['albumid']?>"><?=$value['albumname']?></option>
<?php } } ?>
</select> (点击图片可以插入到内容中)
<div id="albumpic_body"></div>
</td>
</tr>
</table>
<table cellspacing="4" cellpadding="4" width="100%" class="infotable">
<tr>
<th width="100">&nbsp;</th>
<td>
<input type="button" id="issuance" onclick="document.getElementById('blogbutton').click();" value="保存发布" class="submit" /></td>
</tr>
</table>
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
<?php ob_out();?>