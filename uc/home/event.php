<?php
/*
    [UCenter Home] (C) 2007-2008 Comsenz Inc.
    $Id: event.php 10661 2008-12-12 02:39:36Z zhengqingpeng $
*/


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

//活动达人
$query = $_SGLOBAL['db']->query("SELECT count(*), uid FROM ".tname("userevent")." WHERE uid != 1 GROUP BY uid ORDER BY dateline DESC LIMIT 1");
$daren = $_SGLOBAL['db']->fetch_array($query);
$daren = getspace($daren['uid']);
realname_set($daren['uid'], $daren['username']);

if($_SGLOBAL['supe_uid']) {
    // 获取好友参加的活动
    $eventslist = array();
    $query = $_SGLOBAL['db']->query("SELECT ue.*, e.*, ue.uid as fuid, ue.username as fusername FROM ".tname("userevent")." ue LEFT JOIN ".tname("event")." e ON ue.eventid=e.eventid WHERE ue.uid IN ($space[feedfriend]) AND ue.status >= 2 ORDER BY ue.dateline DESC LIMIT 6");
    while($value = $_SGLOBAL['db']->fetch_array($query)){
        if(isset($eventslist[$value['eventid']])){
            $eventslist[$value['eventid']]['friends'][] = $value['fuid'];
        } else {
            $eventslist[$value['eventid']] = $value;
            $eventslist[$value['eventid']]['friends'] = array($value['fuid']);
            realname_set($value['fuid'], $value['fusername']);
        }
    }
}else{
    //推荐活动
    $eventslist = array();
    $query = $_SGLOBAL['db']->query("SELECT * FROM ".tname("event")." WHERE grade = 2 ORDER BY recommendtime DESC LIMIT 6");
    while($value = $_SGLOBAL['db']->fetch_array($query)){
        if($value['deadline'] > $_SGLOBAL['timestamp']){
            if($value['poster']){
                $value['pic'] = pic_get($value['poster'], $value['thumb'], $value['remote']);
            } else {
                $value['pic'] = $_SGLOBAL['eventclass'][$value['classid']]['poster'];
            }
            $eventslist[] = $value;
        }
    }
}

$events = array();
if ($view == 'open'){
    $query = $_SGLOBAL['db']->query("SELECT * FROM ".tname("event")." WHERE endtime > '$_SGLOBAL[timestamp]' AND uid=1 ORDER BY updatetime DESC LIMIT 1");
}else if($view == 'close'){
    $query = $_SGLOBAL['db']->query("SELECT * FROM ".tname("event")." WHERE endtime <= '$_SGLOBAL[timestamp]' AND uid=1 ORDER BY endtime DESC LIMIT 1");
}else{
    $query = $_SGLOBAL['db']->query("SELECT ue.*, e.* FROM ".tname("userevent")." ue LEFT JOIN ".tname("event")." e ON ue.eventid=e.eventid WHERE ue.uid = '$_SGLOBAL[supe_uid]' AND ue.status = 1 ORDER BY ue.dateline LIMIT 1");
}

$events = $_SGLOBAL['db']->fetch_array($query);
if($events['eventid']){
    $query = $_SGLOBAL['db']->query("SELECT detail FROM ".tname("eventfield")." WHERE eventid={$events['eventid']}");
    $events['detail'] = $_SGLOBAL['db']->result($query);
}
realname_set($events['uid'], $events['username']);

include template("event_list");

?>
