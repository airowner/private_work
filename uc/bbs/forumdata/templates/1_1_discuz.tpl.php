<? if(!defined('IN_DISCUZ')) exit('Access Denied'); hookscriptoutput('discuz');
0
|| checktplrefresh('/srv/http/uc/bbs/././templates/default/discuz.htm', '/srv/http/uc/bbs/././templates/default/header.htm', 1333532456, '1', './templates/default')
|| checktplrefresh('/srv/http/uc/bbs/././templates/default/discuz.htm', '/srv/http/uc/bbs/././templates/default/index_heats.htm', 1333532456, '1', './templates/default')
|| checktplrefresh('/srv/http/uc/bbs/././templates/default/discuz.htm', '/srv/http/uc/bbs/././templates/default/index_navbar.htm', 1333532456, '1', './templates/default')
|| checktplrefresh('/srv/http/uc/bbs/././templates/default/discuz.htm', '/srv/http/uc/bbs/././templates/default/footer.htm', 1333532456, '1', './templates/default')
|| checktplrefresh('/srv/http/uc/bbs/././templates/default/discuz.htm', '/srv/http/uc/bbs/././templates/default/jsmenu.htm', 1333532456, '1', './templates/default')
;?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?=$charset?>" />
<title><?=$navtitle?> <?=$bbname?> <?=$seotitle?> - Powered by Discuz!</title>
<?=$seohead?>
<meta name="keywords" content="<?=$metakeywords?><?=$seokeywords?>" />
<meta name="description" content="<?=$metadescription?> <?=$bbname?> <?=$seodescription?> - Discuz! Board" />
<meta name="generator" content="Discuz! <?=$version?>" />
<meta name="author" content="Discuz! Team and Comsenz UI Team" />
<meta name="copyright" content="2001-2009 Comsenz Inc." />
<meta name="MSSmartTagsPreventParsing" content="True" />
<meta http-equiv="MSThemeCompatible" content="Yes" />
<meta http-equiv="x-ua-compatible" content="ie=7" />
<link rel="archives" title="<?=$bbname?>" href="<?=$boardurl?>archiver/" />
<?=$rsshead?>
<?=$extrahead?><link rel="stylesheet" type="text/css" href="forumdata/cache/style_<?=STYLEID?>_common.css?<?=VERHASH?>" /><link rel="stylesheet" type="text/css" href="forumdata/cache/scriptstyle_<?=STYLEID?>_<?=CURSCRIPT?>.css?<?=VERHASH?>" />
<? if($forum['ismoderator']) { ?>
<link href="forumdata/cache/style_1_moderator.css?fpX" rel="stylesheet" type="text/css" />
<? } ?><script type="text/javascript">var STYLEID = '<?=STYLEID?>', IMGDIR = '<?=IMGDIR?>', VERHASH = '<?=VERHASH?>', charset = '<?=$charset?>', discuz_uid = <?=$discuz_uid?>, cookiedomain = '<?=$cookiedomain?>', cookiepath = '<?=$cookiepath?>', attackevasive = '<?=$attackevasive?>', disallowfloat = '<?=$disallowfloat?>', creditnotice = '<? if($creditnotice) { ?><?=$creditnames?><? } ?>', <? if(in_array(CURSCRIPT, array('viewthread', 'forumdisplay'))) { ?>gid = parseInt('<?=$thisgid?>')<? } elseif(CURSCRIPT == 'index') { ?>gid = parseInt('<?=$gid?>')<? } else { ?>gid = 0<? } ?>, fid = parseInt('<?=$fid?>'), tid = parseInt('<?=$tid?>')</script>
<script src="<?=$jspath?>common.js?<?=VERHASH?>" type="text/javascript"></script>
</head>

<body id="<?=CURSCRIPT?>" onkeydown="if(event.keyCode==27) return false;">

<div id="append_parent"></div><div id="ajaxwaitid"></div>

<div id="header">
<div class="wrap s_clear">
<h2><a href="<?=$indexname?>" title="<?=$bbname?>"><?=BOARDLOGO?></a></h2>
<div id="umenu">
<? if($discuz_uid) { ?>
<cite><a href="space.php?uid=<?=$discuz_uid?>" class="noborder"><?=$discuz_userss?></a><? if($allowinvisible) { ?><span id="loginstatus"><? if(!empty($invisible)) { ?><a href="member.php?action=switchstatus" onclick="ajaxget(this.href, 'loginstatus');doane(event);">隐身</a><? } else { ?><a href="member.php?action=switchstatus" title="我要隐身" onclick="ajaxget(this.href, 'loginstatus');doane(event);">在线</a><? } ?></span><? } ?></cite>
<span class="pipe">|</span>
<? if($ucappopen['UCHOME']) { ?>
<a href="<?=$uchomeurl?>/space.php?uid=<?=$discuz_uid?>" target="_blank">空间</a>
<? } elseif($ucappopen['XSPACE']) { ?>
<a href="<?=$xspaceurl?>/?uid-<?=$discuz_uid?>" target="_blank">空间</a>
<? } ?>
<a id="myprompt" href="notice.php" <? if($prompt) { ?>class="new" onmouseover="showMenu({'ctrlid':this.id})"<? } ?>>提醒</a>
<span id="myprompt_check"></span>
<a href="pm.php" id="pm_ntc" target="_blank">短消息</a>
<? if($taskon) { ?>
<a id="task_ntc" <? if($doingtask) { ?>href="task.php?item=doing" class="new" title="您有未完成的任务"<? } else { ?>href="task.php"<? } ?> target="_blank">论坛任务</a>
<? } ?>

<span class="pipe">|</span>
<a href="memcp.php">个人中心</a>
<? if($discuz_uid && $adminid > 1) { ?><a href="modcp.php?fid=<?=$fid?>" target="_blank">管理面板</a><? } if($discuz_uid && $adminid == 1) { ?><a href="admincp.php" target="_blank">管理中心</a><? } ?>
<a href="logging.php?action=logout&amp;formhash=<?=FORMHASH?>">退出</a>
<? } elseif(!empty($_DCOOKIE['loginuser'])) { ?>
<cite><a id="loginuser" class="noborder"><?=$_DCOOKIE['loginuser']?></a></cite>
<a href="logging.php?action=login" onclick="showWindow('login', this.href);return false;">激活</a>
<a href="logging.php?action=logout&amp;formhash=<?=FORMHASH?>">退出</a>
<? } else { ?>
<a href="<?=$regname?>" onclick="showWindow('register', this.href);return false;" class="noborder"><?=$reglinkname?></a>
<a href="logging.php?action=login" onclick="showWindow('login', this.href);return false;">登录</a>
<? } ?>
</div>
<div id="ad_headerbanner"><? if($admode && !empty($advlist['headerbanner'])) { ?><?=$advlist['headerbanner']?><? } ?></div>
<div id="menu">
<ul>
<? if($_DCACHE['settings']['frameon'] > 0) { ?>
<li>
<span class="frameswitch">
<script type="text/javascript">
if(top == self) {
<? if(($_DCACHE['settings']['frameon'] == 2 && !defined('CACHE_FILE') && in_array(CURSCRIPT, array('index', 'forumdisplay', 'viewthread')) && (($_DCOOKIE['frameon'] == 'yes' && $_GET['frameon'] != 'no') || (empty($_DCOOKIE['frameon']) && empty($_GET['frameon']))))) { ?>
top.location = 'frame.php?frameon=yes&referer='+escape(self.location);
<? } ?>
document.write('<a href="frame.php?frameon=yes" target="_top" class="frameon">分栏模式<\/a>');
} else {
document.write('<a href="frame.php?frameon=no" target="_top" class="frameoff">平板模式<\/a>');
}
</script>
</span>
</li>
<? } if(is_array($navs)) { foreach($navs as $id => $nav) { if($id == 3) { if(!empty($plugins['jsmenu'])) { ?>
<?=$nav['nav']?>
<? } if(!empty($plugins['links'])) { if(is_array($plugins['links'])) { foreach($plugins['links'] as $module) { if(!$module['adminid'] || ($module['adminid'] && $adminid > 0 && $module['adminid'] >= $adminid)) { ?><li><?=$module['url']?></li><? } } } } } else { if(!$nav['level'] || ($nav['level'] == 1 && $discuz_uid) || ($nav['level'] == 2 && $adminid > 0) || ($nav['level'] == 3 && $adminid == 1)) { ?><?=$nav['nav']?><? } } } } if(in_array($BASEFILENAME, $navmns)) { $mnid = $BASEFILENAME; } elseif($navmngs[$BASEFILENAME]) { if(is_array($navmngs[$BASEFILENAME])) { foreach($navmngs[$BASEFILENAME] as $navmng) { if($navmng['0'] == array_intersect_assoc($navmng['0'], $_GET)) { $mnid = $navmng['1']; } } } } ?>
</ul>
<script type="text/javascript">
var currentMenu = $('mn_<?=$mnid?>') ? $('mn_<?=$mnid?>') : $('mn_<?=$navmns['0']?>');
currentMenu.parentNode.className = 'current';
</script>
</div>
<? if(!empty($stylejumpstatus)) { ?>
<script type="text/javascript">
function setstyle(styleid) {
str = unescape('<? echo str_replace("'", "\\'", urlencode($_SERVER['QUERY_STRING'])); ?>');
str = str.replace(/(^|&)styleid=\d+/ig, '');
str = (str != '' ? str + '&' : '') + 'styleid=' + styleid;
location.href = '<?=$BASESCRIPT?>?' + str;
}
</script>
<ul id="style_switch"><? if(is_array($styles)) { foreach($styles as $id => $stylename) { ?><li<? if($id == STYLEID) { ?> class="current"<? } ?>><a href="###" onclick="setstyle(<?=$id?>)" title="<?=$stylename?>" style="background: <?=$styleicons[$id]?>;"><?=$stylename?></a></li><? } } ?></ul>
<? } ?>
</div>
<div id="myprompt_menu" style="display:none" class="promptmenu">
<div class="promptcontent">
<ul class="s_clear"><? if(is_array($prompts)) { foreach($prompts as $promptkey => $promptdata) { if($promptkey) { ?><li<? if(!$promptdata['new']) { ?> style="display:none"<? } ?>><a id="prompt_<?=$promptkey?>" href="<? if($promptdata['script']) { ?><?=$promptdata['script']?><? } else { ?>notice.php?filter=<?=$promptkey?><? } ?>" target="_blank"><?=$promptdata['name']?> (<?=$promptdata['new']?>)</a></li><? } } } ?></ul>
</div>
</div>
</div>
<?=$pluginhooks['global_header']?><div id="nav"><a href="<?=$indexname?>"><?=$bbname?></a> &raquo; 首页</div>
<? if($admode && !empty($advlist['text'])) { ?><div class="ad_text" id="ad_text"><table summary="Text Ad" cellpadding="0" cellspacing="1"><?=$advlist['text']?></table></div><? } else { ?><div id="ad_text"></div><? } ?>
<div id="wrap"<? if($infosidestatus['allow'] < 2) { ?> class="wrap s_clear"<? } else { ?> class="wrap with_side s_clear"<? } ?>>
<? if($infosidestatus['allow'] == 2) { ?>
<a id="sidebar_img" href="javascript:;" onclick="sidebar_collapse(['打开边栏', '关闭边栏']);" class="<?=$collapseimg['sidebar']?>"><? if($collapseimg['sidebar'] == 'collapsed_yes') { ?>打开边栏<? } else { ?>关闭边栏<? } ?></a>
<? } elseif($infosidestatus['allow'] == 1) { ?>
<a id="sidebar_img" href="javascript:;" onclick="sidebar_collapse(['', '关闭边栏']);" class="collapsed_yes">打开边栏</a>
<? } ?>
<div class="main"><div class="content">
<?=$pluginhooks['index_header']?><? include template('index_header', '0', ''); if($indexhot['status']) { if($_DCACHE['heats']['message']) { ?>
<div id="hot" class="s_clear<? if($_DCACHE['heats']['image']) { ?> img<? } ?>">
<h3>论坛热点</h3>
<div id="hot_main">
<dl><? if(is_array($_DCACHE['heats']['message'])) { foreach($_DCACHE['heats']['message'] as $data) { ?><dt>
<strong><? if($adminid == 1) { ?><a class="deloption" href="misc.php?action=removeindexheats&amp;tid=<?=$data['tid']?>&amp;from=indexheats" onclick="return removeindexheats()">delete</a><? } ?><a href="viewthread.php?tid=<?=$data['tid']?>&amp;from=indexheats"><?=$data['subject']?></a></strong>
<cite><a href="space.php?uid=<?=$data['authorid']?>&amp;from=indexheats"><?=$data['author']?></a></cite>
</dt>
<dd class="desc">
<?=$data['message']?> ...
<a href="viewthread.php?tid=<?=$data['tid']?>&amp;from=indexheats_readmore">查看全文</a>
</dd><? } } ?></dl>
<? if($_DCACHE['heats']['subject']) { ?>
<ul class="s_clear"><? if(is_array($_DCACHE['heats']['subject'])) { foreach($_DCACHE['heats']['subject'] as $data) { ?><li><? if($adminid == 1) { ?><a class="deloption" href="misc.php?action=removeindexheats&amp;tid=<?=$data['tid']?>" onclick="return removeindexheats()">delete</a><? } ?><a href="viewthread.php?tid=<?=$data['tid']?>"><?=$data['subject']?></a></li><? } } ?></ul>
<? } ?>
</div>

<? if($_DCACHE['heats']['image']) { ?>
<div id="hot_img">
<a href="viewthread.php?tid=<?=$_DCACHE['heats']['image']['tid']?>&amp;from=indexheats_pic"><img src="<?=$_DCACHE['heats']['image']['thumb']?>" alt="<?=$_DCACHE['heats']['image']['subject']?>" /></a>
<h2><? if($adminid == 1) { ?><a class="deloption" href="misc.php?action=removeindexheats&amp;tid=<?=$_DCACHE['heats']['image']['tid']?>" onclick="return removeindexheats()">delete</a><? } ?><a href="viewthread.php?tid=<?=$_DCACHE['heats']['image']['tid']?>&amp;from=indexheats"><?=$_DCACHE['heats']['image']['subject']?></a></h2>
<p class="desc"><?=$_DCACHE['heats']['image']['message']?> ...<a href="viewthread.php?tid=<?=$_DCACHE['heats']['image']['tid']?>&amp;from=indexheats_readmore">查看全文</a></p>
<cite><a href="space.php?uid=<?=$_DCACHE['heats']['image']['authorid']?>&amp;from=indexheats"><?=$_DCACHE['heats']['image']['author']?></a> 发表于 <? echo dgmdate("$dateformat $timeformat", $_DCACHE['heats']['image']['dateline'] + $timeoffset * 3600); ?></cite>
</div>
<? } ?>
</div>
<? } } ?>

<?=$pluginhooks['index_hot']?>

<div class="itemtitle s_clear">
<p class="right forumcount">
今日: <em><?=$todayposts?></em>, 昨日: <em><?=$postdata['0']?></em>, 会员: <em><?=$totalmembers?></em>
</p>
<? if($indextype) { ?><ul>
<li<? if($indexfile == 'classics') { ?> class="current"<? } ?>><a href="<?=$indexname?>?op=classics"><span>论坛版块</span></a></li>
<li<? if($indexfile == 'feeds' && !$type) { ?> class="current"<? } ?>><a href="<?=$indexname?>?op=feeds"><span>论坛动态</span></a></li>
<? if($my_status) { ?>
<li<? if($indexfile == 'feeds' && $type == 'manyou') { ?> class="current"<? } ?>><a href="<?=$indexname?>?op=feeds&type=manyou"><span>应用动态</span></a></li>
<? } ?>
<?=$pluginhooks['index_navbar']?>
</ul><? } ?>
</div><? $rkey=array_rand($catlist); ?><?=$pluginhooks['index_top']?><? if(is_array($catlist)) { foreach($catlist as $key => $cat) { if($cat['forumscount']) { ?>
<div class="mainbox list">
<span class="headactions">
<? if($cat['moderators']) { ?>分区版主: <?=$cat['moderators']?><? } ?>
<img id="category_<?=$cat['fid']?>_img" src="<?=IMGDIR?>/<?=$cat['collapseimg']?>" title="收起/展开" alt="收起/展开" onclick="toggle_collapse('category_<?=$cat['fid']?>');" />
</span>
<h3><a href="<?=$indexname?>?gid=<?=$cat['fid']?>" style="<? if($cat['extra']['namecolor']) { ?>color: <?=$cat['extra']['namecolor']?>;<? } ?>"><?=$cat['name']?></a></h3>
<table id="category_<?=$cat['fid']?>" summary="category<?=$cat['fid']?>" cellspacing="0" cellpadding="0" style="<?=$collapse['category_'.$cat['fid']]?>">
<? if(!$cat['forumcolumns']) { if(is_array($cat['forums'])) { foreach($cat['forums'] as $forumid) { $forum=$forumlist[$forumid]; ?><tbody id="forum<?=$forum['fid']?>">
<tr>
<th<?=$forum['folder']?>>
<?=$forum['icon']?>
<div class="left">
<h2><a href="forumdisplay.php?fid=<?=$forum['fid']?>" <? if($forum['redirect']) { ?>target="_blank"<? } ?> style="<? if($forum['extra']['namecolor']) { ?>color: <?=$forum['extra']['namecolor']?>;<? } ?>"><?=$forum['name']?></a><? if($forum['todayposts'] && !$forum['redirect']) { ?><em> (今日: <strong><?=$forum['todayposts']?></strong>)</em><? } ?></h2>
<? if($forum['description']) { ?><p><?=$forum['description']?></p><? } if($forum['subforums']) { ?><p>子版块: <?=$forum['subforums']?></p><? } if($forum['moderators']) { if($moddisplay == 'flat') { ?><p>版主: <?=$forum['moderators']?></p><? } else { ?><span class="dropmenu" id="mod<?=$forum['fid']?>" onmouseover="showMenu({'ctrlid':this.id})">版主</span><ul class="popupmenu_popup headermenu_popup" id="mod<?=$forum['fid']?>_menu" style="display: none"><?=$forum['moderators']?></ul><? } } ?>
</div>
</th>
<td class="forumnums">
<? if($forum['redirect']) { ?>N/A<? } else { ?><em><?=$forum['threads']?></em> / <?=$forum['posts']?><? } ?>
</td>
<td class="forumlast">
<? if($forum['permission'] == 1) { ?>
私密版块
<? } else { if($forum['redirect']) { ?>
<a href="forumdisplay.php?fid=<?=$forum['fid']?>">链接到外部地址</a>
<? } elseif(is_array($forum['lastpost'])) { ?>
<p><a href="redirect.php?tid=<?=$forum['lastpost']['tid']?>&amp;goto=lastpost#lastpost"><? echo cutstr($forum['lastpost']['subject'], 30); ?></a></p>
<cite><? if($forum['lastpost']['author']) { ?><?=$forum['lastpost']['author']?><? } else { ?>匿名<? } ?> - <?=$forum['lastpost']['dateline']?></cite>
<? } else { ?>
从未
<? } } ?>
</td>
</tr>
</tbody><? } } } else { ?>
<tr class="narrowlist"><? if(is_array($cat['forums'])) { foreach($cat['forums'] as $forumid) { $forum=$forumlist[$forumid]; if($forum['orderid'] && ($forum['orderid'] % $cat['forumcolumns'] == 0)) { ?>
</tr></tbody>
<? if($forum['orderid'] < $cat['forumscount']) { ?>
<tbody><tr>
<? } } ?>
<th width="<?=$cat['forumcolwidth']?>"<?=$forum['folder']?>>
<h2><a href="forumdisplay.php?fid=<?=$forum['fid']?>" <? if($forum['redirect']) { ?>target="_blank"<? } ?> style="<? if($forum['extra']['namecolor']) { ?>color: <?=$forum['extra']['namecolor']?>;<? } ?>"><?=$forum['name']?></a><? if($forum['todayposts']) { ?><em> (今日: <strong><?=$forum['todayposts']?></strong>)</em><? } ?></h2>
<? if(!$forum['redirect']) { ?>
<p>主题: <?=$forum['threads']?>, 帖数: <?=$forum['posts']?></p>
<? if($forum['permission'] == 1) { ?>
<p>私密版块
<? } else { ?>
<p>最后发表:
<? if(is_array($forum['lastpost'])) { ?>
<a href="redirect.php?tid=<?=$forum['lastpost']['tid']?>&amp;goto=lastpost#lastpost" title="<? echo cutstr($forum['lastpost']['subject'], 30); ?> by <? if($forum['lastpost']['author']) { ?><?=$forum['lastpost']['authorusername']?><? } else { ?>匿名<? } ?>  "><?=$forum['lastpost']['dateline']?></a>
<? } else { ?>
从未
<? } ?>
</p>
<? } } else { ?>
<p>链接到外部地址</p>
<? } ?>
</th><? } } ?><?=$cat['endrows']?>
<? } ?>
</table>
</div>
<? if($admode && !empty($advlist['intercat']) && ($advlist['intercat'][$key] = array_merge(($advlist['intercat']['0'] ? $advlist['intercat']['0'] : array()), ($advlist['intercat'][$key] ? $advlist['intercat'][$key] : array())))) { ?><div class="ad_column" id="ad_intercat_<?=$key?>"><? echo $advitems[$advlist['intercat'][$key][array_rand($advlist['intercat'][$key])]]; ?></div><? } else { ?><div id="ad_intercat_<?=$key?>"></div><? } } } } ?><?=$pluginhooks['index_middle']?>

<? if($_DCACHE['forumlinks']['0'] || $_DCACHE['forumlinks']['1'] || $_DCACHE['forumlinks']['2']) { ?>
<div class="mainbox list">
<span class="headactions"><img id="forumlinks_img" src="<?=IMGDIR?>/<?=$collapseimg['forumlinks']?>.gif" alt="" onclick="toggle_collapse('forumlinks');" /></span>
<h3>友情链接</h3>
<div id="forumlinks" style="<?=$collapse['forumlinks']?>">
<? if($_DCACHE['forumlinks']['0']) { ?>
<div class="forumlinks">
<ul class="s_clear"><?=$_DCACHE['forumlinks']['0']?></ul>
</div>
<? } if($_DCACHE['forumlinks']['1']) { ?>
<div class="forumimglink">
<?=$_DCACHE['forumlinks']['1']?>
</div>
<? } if($_DCACHE['forumlinks']['2']) { ?>
<div class="forumtxtlink">
<ul class="s_clear">
<?=$_DCACHE['forumlinks']['2']?>
</ul>
</div>
<? } ?>
</div>
</div>
<? } if(empty($gid) && $maxbdays &&$_DCACHE['birthdays_index']['todaysbdays']) { ?>
<div class="mainbox list" id="bdays">
<h3 id="bdayslist">
<a href="member.php?action=list&amp;type=birthdays">生日快乐</a>: <?=$_DCACHE['birthdays_index']['todaysbdays']?>
</h3>
</div>
<? } if(empty($gid) && $whosonlinestatus) { ?>
<div class="mainbox list" id="online">
<? if($whosonlinestatus) { if($detailstatus) { ?>
<span class="headactions"><a href="<?=$indexname?>?showoldetails=no#online" title="关闭"><img src="<?=IMGDIR?>/collapsed_no.gif" alt="关闭" /></a></span>
<h3>
<strong><a href="member.php?action=online">在线会员</a></strong>
- <em><?=$onlinenum?></em> 人在线
- <em><?=$membercount?></em> 会员(<em><?=$invisiblecount?></em> 隐身),
<em><?=$guestcount?></em> 位游客
- 最高记录是 <em><?=$onlineinfo['0']?></em> 于 <em><?=$onlineinfo['1']?></em>.
</h3>
<? } else { ?>
<span class="headactions"><a href="<?=$indexname?>?showoldetails=yes#online" class="nobdr"><img src="<?=IMGDIR?>/collapsed_yes.gif" alt="" /></a></span>
<h3>
<strong><a href="member.php?action=online">在线会员</a></strong>
- 总计 <em><?=$onlinenum?></em> 人在线
- 最高记录是 <em><?=$onlineinfo['0']?></em> 于 <em><?=$onlineinfo['1']?></em>.
</h3>
<? } } else { ?>
<h4><strong><a href="member.php?action=online">在线会员</a></strong></h4>
<? } if($whosonlinestatus && $detailstatus) { ?>
<dl id="onlinelist">
<dt><?=$_DCACHE['onlinelist']['legend']?></dt>
<? if($detailstatus) { ?>
<dd>
<ul class="s_clear">
<? if($whosonline) { if(is_array($whosonline)) { foreach($whosonline as $key => $online) { ?><li title="时间: <?=$online['lastactivity']?><?="\n"?>操作: <?=$online['action']?> <? if($online['fid']) { ?><?="\n"?>版块: <?=$online['fid']?><? } ?>">
<img src="images/common/<?=$online['icon']?>" alt="" />
<? if($online['uid']) { ?>
<a href="space.php?uid=<?=$online['uid']?>"><?=$online['username']?></a>
<? } else { ?>
<?=$online['username']?>
<? } ?>
</li><? } } } else { ?>
<li style="width: auto">当前只有游客或隐身会员在线</li>
<? } ?>
</ul>
</dd>
<? } ?>
</dl>
<? } ?>
</div>
<? } ?>

<?=$pluginhooks['index_bottom']?>
</div></div>

<? if($infosidestatus['allow'] == 2) { ?>
<div id="sidebar" class="side" style="<?=$collapse['sidebar']?>">
<? if(!empty($qihoo['status']) && ($qihoo['searchbox'] & 1)) { ?>
<div id="qihoosearch" class="sidebox">
<? if(!empty($qihoo['status']) && ($qihoo['searchbox'] & 1)) { ?>
<form method="post" action="search.php?srchtype=qihoo" onSubmit="this.target='_blank';">
<input type="hidden" name="searchsubmit" value="yes" />
<input type="text" class="txt" name="srchtxt" value="<?=$qihoo_searchboxtxt?>" size="20" />
<select name="stype">
<option value="" selected="selected">全文</option>
<option value="1">标题</option>
<option value="2">作者</option>
</select>
&nbsp;<button name="searchsubmit" type="submit" value="true">搜索</button>
</form>

<? if(!empty($qihoo['links']['keywords'])) { ?>
<strong>热门搜索</strong><? if(is_array($qihoo['links']['keywords'])) { foreach($qihoo['links']['keywords'] as $link) { ?><?=$link?>&nbsp;<? } } } if($customtopics) { ?>
<strong>用户专题</strong>&nbsp;&nbsp;<?=$customtopics?> [<a href="javascript:;" onclick="showWindow('customtopics', 'misc.php?action=customtopics')">编辑</a>]<br />
<? } if(!empty($qihoo['links']['topics'])) { ?>
<strong>论坛专题</strong>&nbsp;<? if(is_array($qihoo['links']['topics'])) { foreach($qihoo['links']['topics'] as $url) { ?><?=$url?> &nbsp;<? } } } } ?>
</div>
<? } if($infosidestatus['2']) { if(!empty($qihoo['status']) && ($qihoo['searchbox'] & 1)) { ?>
<hr class="shadowline"/>
<? } ?>
<div id="infoside">
<? if(empty($gid)) { request($infosidestatus, 0, 2); } else { request($infosidestatus, 1, 2); } ?>
</div>
<? } ?>
</div>
<? } ?>
</div><? if(!empty($plugins['jsmenu'])) { ?>
<ul class="popupmenu_popup headermenu_popup" id="plugin_menu" style="display: none"><? if(is_array($plugins['jsmenu'])) { foreach($plugins['jsmenu'] as $module) { ?>     <? if(!$module['adminid'] || ($module['adminid'] && $adminid > 0 && $module['adminid'] >= $adminid)) { ?>
     <li><?=$module['url']?></li>
     <? } } } ?></ul>
<? } if(is_array($subnavs)) { foreach($subnavs as $subnav) { ?><?=$subnav?><? } } if($prompts['newbietask'] && $newbietasks) { include template('task_newbie_js', '0', ''); } if($admode && !empty($advlist)) { ?>
<div class="ad_footerbanner" id="ad_footerbanner1"><?=$advlist['footerbanner1']?></div><? if($advlist['footerbanner2']) { ?><div class="ad_footerbanner" id="ad_footerbanner2"><?=$advlist['footerbanner2']?></div><? } if($advlist['footerbanner3']) { ?><div class="ad_footerbanner" id="ad_footerbanner3"><?=$advlist['footerbanner3']?></div><? } } else { ?>
<div id="ad_footerbanner1"></div><div id="ad_footerbanner2"></div><div id="ad_footerbanner3"></div>
<? } ?>

<?=$pluginhooks['global_footer']?>
<div id="footer">
<div class="wrap s_clear">
<div id="footlink">
<p>
<strong><a href="<?=$siteurl?>" target="_blank"><?=$sitename?></a></strong>
<? if($icp) { ?>( <a href="http://www.miibeian.gov.cn/" target="_blank"><?=$icp?></a>)<? } ?>
<span class="pipe">|</span><a href="mailto:<?=$adminemail?>">联系我们</a>
<? if($allowviewstats) { ?><span class="pipe">|</span><a href="stats.php">论坛统计</a><? } if($archiverstatus) { ?><span class="pipe">|</span><a href="archiver/" target="_blank">Archiver</a><? } if($wapstatus) { ?><span class="pipe">|</span><a href="wap/" target="_blank">WAP</a><? } if($statcode) { ?><span class="pipe">| <?=$statcode?></span><? } ?>
<?=$pluginhooks['global_footerlink']?>
</p>
<p class="smalltext">
GMT<?=$timenow['offset']?>, <?=$timenow['time']?>
<? if(debuginfo()) { ?>, <span id="debuginfo">Processed in <?=$debuginfo['time']?> second(s), <?=$debuginfo['queries']?> queries<? if($gzipcompress) { ?>, Gzip enabled<? } ?></span><? } ?>.
</p>
</div>
<div id="rightinfo">
<p>Powered by <strong><a href="http://www.discuz.net" target="_blank">Discuz!</a></strong> <em><?=$version?></em><? if(!empty($boardlicensed)) { ?> <a href="http://license.comsenz.com/?pid=1&amp;host=<?=$_SERVER['HTTP_HOST']?>" target="_blank">Licensed</a><? } ?></p>
<p class="smalltext">&copy; 2001-2009 <a href="http://www.comsenz.com" target="_blank">Comsenz Inc.</a></p>
</div><? updatesession(); ?></div>
</div>
<? if($_DCACHE['settings']['frameon'] && in_array(CURSCRIPT, array('index', 'forumdisplay', 'viewthread')) && $_DCOOKIE['frameon'] == 'yes') { ?>
<script src="<?=$jspath?>iframe.js?<?=VERHASH?>" type="text/javascript"></script>
<? } output(); ?></body>
</html>