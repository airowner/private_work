<?php
/*
    [UCenter Home] (C) 2007-2008 Comsenz Inc.
    $Id: event.php 10661 2008-12-12 02:39:36Z zhengqingpeng $
*/

@define('IN_UCHOME', TRUE);
@define('IN_UC', TRUE);
include_once('./common.php');
//是否关闭站点
checkclose();
//获取当前用户的空间信息
//echo $_SGLOBAL['supe_uid'];
$space = getspace($_SGLOBAL['supe_uid']);

//处理rewrite
if($_SCONFIG['allowrewrite'] && isset($_GET['rewrite'])) {
    $rws = explode('-', $_GET['rewrite']);
    if($rw_uid = intval($rws[0])) {
        $_GET['uid'] = $rw_uid;
    } else {
        $_GET['do'] = $rws[0];
    }
    if(isset($rws[1])) {
        $rw_count = count($rws);
        for ($rw_i=1; $rw_i<$rw_count; $rw_i=$rw_i+2) {
            $_GET[$rws[$rw_i]] = empty($rws[$rw_i+1])?'':$rws[$rw_i+1];
        }
    }
    unset($_GET['rewrite']);
}

//更新活动session
if($_SGLOBAL['supe_uid']) {
        getmember(); //获取当前用户信息
        updatetable('session', array('lastactivity' => $_SGLOBAL['timestamp']), array('uid'=>$_SGLOBAL['supe_uid']));
}

//获取变量
$views = array('open', 'close', 'me');
$view = (!empty($_GET['view']) && in_array($_GET['view'], $views))?$_GET['view']:'open';
$actives = array( $view => " class=\"active\"" );


//获取空间
if($view == 'me' && empty($_SGLOBAL['supe_uid'])) {
    ssetcookie('_refer', rawurlencode($_SERVER['REQUEST_URI']));
    showmessage('to_login', usr_url('do', array('ac'=>'login')), 0);
} else if($_SGLOBAL['supe_uid']) {
    $space = getspace($_SGLOBAL['supe_uid']);
}


//更新活动session
if($_SGLOBAL['supe_uid']) {
    updatetable('session', array('lastactivity' => $_SGLOBAL['timestamp']), array('uid'=>$_SGLOBAL['supe_uid']));
}

$theurl = "space.php?uid=$space[uid]&do=mtag";

//圈子分类
require_once(S_ROOT . '/uc_client/model/base.php');

$sql = "select * from " . tname("profield") . " order by displayorder asc";
$query = $_SGLOBAL['db']->query($sql);
$mtags = array();
while ($value = $_SGLOBAL['db']->fetch_array($query)) {
    $mtags[] = $value;
}
function getSubMtag($mtag){
    global $_SGLOBAL;
    $sql = "select * from " . tname("mtag") . " where close=0 and fieldid=" . $mtag['fieldid'] . " limit 6";
    $query = $_SGLOBAL['db']->query($sql);
    $sub_mtags = array();
    while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        $sub_mtags[] = $value;
    }
    return $sub_mtags;
}
$sub_mtags = array_map('getSubMtag', array_slice($mtags, 0, 5));
    

//公告announcement
//~ $sql = "select * from " . tname("mtag") . " where announcement!='' order by ";
//可能感兴趣
$interest = array();
$fs = array();
if($_SCONFIG['mtaginterest']){
    $query = $_SGLOBAL['db']->query("SELECT * FROM ".tname('mtag')." WHERE tagid IN (".$_SCONFIG['mtaginterest'].")");
    while ($v = $_SGLOBAL['db']->fetch_array($query)) {
        $fs[$v['tagid']] = $v;
    }
    foreach(explode(',', $_SCONFIG['mtaginterest']) as $tagid){
        $interest[$tagid] = $fs[$tagid];
    }
}
//推荐圈子
$jingxuan = array();
$fs = array();
$query = $_SGLOBAL['db']->query("SELECT * FROM ".tname('mtag')." WHERE tagid IN (".$_SCONFIG['mtagrecommend'].") limit 12");
while ($v = $_SGLOBAL['db']->fetch_array($query)) {
    $fs[$v['tagid']] = $v;
}
foreach(explode(',', $_SCONFIG['mtagrecommend']) as $tagid){
    $jingxuan[] = $fs[trim($tagid)];
}

//精选圈子排行
$jingxuanorder = array();
$fs = array();
$query = $_SGLOBAL['db']->query("SELECT * FROM ".tname('mtag')." WHERE tagid IN (".$_SCONFIG['mtagrecommendorder'].") limit 10");
while ($v = $_SGLOBAL['db']->fetch_array($query)) {
    $fs[$v['tagid']] = $v;
}
foreach(explode(',', $_SCONFIG['mtagrecommendorder']) as $tagid){
    $jingxuanorder[] = $fs[trim($tagid)];
}

//同城圈子
$tongcheng = array();
$fs = array();
$query = $_SGLOBAL['db']->query("SELECT * FROM ".tname('mtag')." WHERE tagid IN (".$_SCONFIG['mtagbeijing'].") limit 7");
while ($v = $_SGLOBAL['db']->fetch_array($query)) {
    $fs[$v['tagid']] = $v;
}
foreach(explode(',', $_SCONFIG['mtagbeijing']) as $tagid){
    $tongcheng[] = $fs[trim($tagid)];
}

//北京圈子排行榜
$beijingorder = array();
$fs = array();
$query = $_SGLOBAL['db']->query("SELECT * FROM ".tname('mtag')." WHERE tagid IN (".$_SCONFIG['mtagbeijing'].") limit 10");
while ($v = $_SGLOBAL['db']->fetch_array($query)) {
    $fs[$v['tagid']] = $v;
}
foreach(explode(',', $_SCONFIG['mtagbeijingorder']) as $tagid){
    $beijingorder[] = $fs[trim($tagid)];
}

//人气群主
$hotmtagowner = array();
$fs = array();
if($_SCONFIG['spacehotmtagownerusername']){
    $query = $_SGLOBAL['db']->query("SELECT * FROM ".tname('tagspace')." main LEFT JOIN ".tname('mtag'). " t ON (main.tagid =t.tagid) WHERE main.username IN (".simplode(explode(',', $_SCONFIG['spacehotmtagownerusername'])).") and main.grade=9 group by main.uid");
    while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        $fs[$value['username']] = $value;
        realname_set($value['uid'], $value['username']);
    }
    foreach(explode(',', $_SCONFIG['spacehotmtagownerusername']) as $username){
        if(!isset($fs[$username])) continue;
        $hotmtagowner[] = $fs[$username];
    }
}
//人气群成员
$hotmtaguser = array();
$fs = array();
if($_SCONFIG['spacehotmtaguserusername']){
    $query = $_SGLOBAL['db']->query("SELECT * FROM ".tname('tagspace')." WHERE username IN (".simplode(explode(',', $_SCONFIG['spacehotmtaguserusername'])).")");
    while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        $fs[$value['username']] = $value;
        realname_set($value['uid'], $value['username']);
    }
    foreach(explode(',', $_SCONFIG['spacehotmtaguserusername']) as $username){
        if(!isset($fs[$username])) continue;
        $hotmtaguser[] = $fs[$username];
    }
}
//广告



    //~ 
//~ if(empty($_GET['view'])) $_GET['view'] = 'me';
//~ if(!in_array($_GET['view'], array('me', 'hot', 'recommend', 'manage'))) $_GET['view'] = 'hot';
//~ 
//~ $theurl .= "&view=$_GET[view]";
//~ $actives = array($_GET['view'] => ' class="active"');       
//~ 
//~ $wherearr = array();

//排序
//~ if (!in_array($_GET['orderby'], array('threadnum', 'postnum', 'membernum'))) {
    //~ $_GET['orderby'] = 'threadnum';
//~ } else {
    //~ $theurl .= "&orderby=$_GET[orderby]";
//~ }
//~ $orderbyarr = array($_GET['orderby'] => ' class="active"');

//查询
//~ $_GET['fieldid'] = intval($_GET['fieldid']);
//~ if($_GET['fieldid']) {
    //~ $wherearr[] = "mt.fieldid='$_GET[fieldid]'";
    //~ $theurl .= "&fieldid=$_GET[fieldid]";
    //~ $pro_actives = array($_GET['fieldid'] => ' class="current"');
//~ } else {
    //~ $pro_actives = array('all' => ' class="current"');
//~ }

//~ $list = $rlist = array();
//~ $multi = '';
//~ $count = 0;
//~ 
//~ $perpage = 20;
//~ $page = intval($_GET['page']);
//~ if($page < 1) $page = 1;
//~ $start = ($page-1)*$perpage;
//~ 
//~ if($_GET['view'] == 'me' || $_GET['view'] == 'manage') {
    //~ $sqlplus = $_GET['view'] == 'manage'?' AND main.grade=\'9\'':'';
    //~ if($_GET['fieldid']) {
        //~ $countsql = "SELECT COUNT(*) FROM ".tname('tagspace')." main, ".tname('mtag')." mt
            //~ WHERE main.uid='$space[uid]' $sqlplus AND mt.tagid=main.tagid AND ".implode(' AND ', $wherearr);
        //~ $sql = "SELECT main.*,mt.* FROM ".tname('tagspace')." main, ".tname('mtag')." mt
            //~ WHERE main.uid='$space[uid]' $sqlplus AND mt.tagid=main.tagid AND ".implode(' AND ', $wherearr)." ORDER BY mt.{$_GET['orderby']} DESC LIMIT $start,$perpage";
    //~ } else {
        //~ $countsql = "SELECT COUNT(*) FROM ".tname('tagspace')." main
            //~ WHERE main.uid='$space[uid]' $sqlplus";
        //~ $sql = "SELECT main.*,mt.* FROM ".tname('tagspace')." main 
            //~ LEFT JOIN ".tname('mtag')." mt ON mt.tagid=main.tagid
            //~ WHERE main.uid='$space[uid]' $sqlplus ORDER BY mt.{$_GET['orderby']} DESC LIMIT $start,$perpage";
    //~ }
//~ } else {
    //~ if($_GET['view'] == 'recommend') {
        //~ $wherearr[] = "mt.recommend='1'";
    //~ }
    
    //搜索
    //~ if($searchkey = stripsearchkey($_GET['searchkey'])) {
        //~ $wherearr[] = "mt.tagname LIKE '%$searchkey%'";
        //~ $theurl .= "&searchkey=$_GET[searchkey]";
    //~ }
    //~ 
    //~ $countsql = "SELECT COUNT(*) FROM ".tname('mtag')." mt WHERE ".(empty($wherearr)?'1':implode(' AND ', $wherearr));
    //~ $sql = "SELECT mt.* FROM ".tname('mtag')." mt
        //~ WHERE ".(empty($wherearr)?'1':implode(' AND ', $wherearr))." ORDER BY mt.{$_GET['orderby']} DESC LIMIT $start,$perpage";
//~ }

//~ $tagids = $tagnames = array();
//~ $count = $_SGLOBAL['db']->result($_SGLOBAL['db']->query($countsql), 0);
//~ if($count) {
    //~ $query = $_SGLOBAL['db']->query($sql);
    //~ while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        //~ $value['title'] = $_SGLOBAL['profield'][$value['fieldid']]['title'];
        //~ if(empty($value['pic'])) $value['pic'] = 'image/nologo.jpg';
        //~ $tagids[] = $value['tagid'];
        //~ $tagnames[$value['tagid']] = $value['tagname'];
        //~ $list[] = $value;
    //~ }
    //~ 
    //~ $multi = multi($count, $perpage, $page, $theurl);
//~ }
//~ 
//~ $threadlist = array();
//~ if($tagids) {
    //~ $query = $_SGLOBAL['db']->query("SELECT * FROM ".tname('thread')." WHERE tagid IN (".simplode($tagids).") ORDER BY dateline DESC LIMIT 0,10");
    //~ while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        //~ realname_set($value['uid'], $value['username']);
        //~ realname_set($value['lastauthorid'], $value['lastauthor']);
        //~ $value['tagname'] = getstr($tagnames[$value['tagid']], 20);
        //~ $threadlist[] = $value;
    //~ }
//~ }

$_TPL['css'] = 'thread';
include_once template("mtag");

?>
