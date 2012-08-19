<?php
/*
    [UCenter Home] (C) 2007-2008 Comsenz Inc.
    $Id: index.php 13003 2009-08-05 06:46:06Z liguode $
*/
define('IN_UC', 1);
include_once('./common.php');
require_once(S_ROOT . '/uc_client/model/base.php');

if(is_numeric($_SERVER['QUERY_STRING'])) {
    showmessage('enter_the_space', usr_url("space", array("uid"=>$_SERVER[QUERY_STRING])), 0);
}

//二级域名
if(!isset($_GET['do']) && $_SCONFIG['allowdomain']) {
    $hostarr = explode('.', $_SERVER['HTTP_HOST']);
    $domainrootarr = explode('.', $_SCONFIG['domainroot']);
    if(count($hostarr) > 2 && count($hostarr) > count($domainrootarr) && $hostarr[0] != 'www' && !isholddomain($hostarr[0])) {
        showmessage('enter_the_space', usr_url("space", array("domain"=>$hostarr[0])), 0);
    }
}

if($_SGLOBAL['supe_uid']) {
    $space = getspace($_SGLOBAL['supe_uid'], 'uid');
}
$cachefile = S_ROOT.'./data/cache_index.txt';
$cachetime = @filemtime($cachefile);

$index = array();/*
if($_SGLOBAL['timestamp'] - $cachetime <= 900) {
    $index = unserialize(sreadfile($cachefile));;
    include template('index');
    exit;
}*/

$index['hotbloguser'] = array();
$hotbloguser = array_slice(explode(',', $_SCONFIG['spacehotblogusername']), 0, 5);
$hotbloglist = array();
if($_SCONFIG['spacehotblogusername']) {
    $query = $_SGLOBAL['db']->query("SELECT m.*, f.resideprovince, f.residecity FROM ".tname('space')." m LEFT JOIN ".tname('spacefield')." f ON m.uid=f.uid WHERE m.username IN (".simplode($hotbloguser).")");
    while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        realname_set($value['uid'], $value['username'], $value['name'], $value['namestatus']);
        $hotbloglist[$value['username']] = $value;
    }
}
foreach($hotbloguser as $user){
    $index['hotbloguser'][] = $hotbloglist[$user];
}

//推荐圈子
$mtags = explode(',', $_SCONFIG['mtagrecommend']);
$mtag = $mtags[0];
$index['mtagrecommend'] = array();
$query = $_SGLOBAL['db']->query("SELECT m.*, t.pic, t.tagname from ".tname('thread')." m, ".tname('mtag')." t where m.tagid=t.tagid and t.tagid='{$mtag}' order by dateline desc limit 3");
while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        $index['mtagrecommend'][] = $value;
}


$index['hotblog'] = array();
$query = $_SGLOBAL['db']->query("SELECT * from ".tname('blog')." where pic!='' order by dateline desc limit 1");
while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        $index['hotblog'][] = $value;
        $tmp = $value['blogid'];
}
if($tmp){
$query = $_SGLOBAL['db']->query("SELECT * from ".tname('blog')." where blogid!={$tmp} order by dateline desc limit 4");
}else{
$query = $_SGLOBAL['db']->query("SELECT * from ".tname('blog')." order by dateline desc limit 5");
}
while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        $index['hotblog'][] = $value;;
}

//居民秀
$index['user_show'] = array();
$query = $_SGLOBAL['db']->query("SELECT * FROM ".tname('space')." WHERE avatar=1 order by lastlogin desc limit 0, 12");
while ($value = $_SGLOBAL['db']->fetch_array($query)) {
    realname_set($value['uid'], $value['username']);
    $index['user_show'][] = $value;
}

//活动
$index['event'] = array();
include_once(S_ROOT.'./data/data_eventclass.php');
$cachefile = S_ROOT.'./data/cache_network_event.txt';

function check_network_cache($type) {
    global $_SGLOBAL;
    
    if($_SGLOBAL['network'][$type]['cache']) {
        $cachefile = S_ROOT.'./data/cache_network_'.$type.'.txt';
        $ftime = filemtime($cachefile);
        if($_SGLOBAL['timestamp'] - $ftime < $_SGLOBAL['network'][$type]['cache']) {
            return true;
        }
    }
    return false;
}

if(check_network_cache('event')) {
    $eventlist = unserialize(sreadfile($cachefile));
} else {
    $sqlarr = mk_network_sql('event',
        array('eventid', 'uid'),
        array('hot','membernum','follownum'),
        array('dateline'),
        array('dateline','membernum','follownum','hot')
    );
    extract($sqlarr);

    //显示数量
    $shownum = 4;
    
    $eventlist = array();
    $query = $_SGLOBAL['db']->query("SELECT main.*
        FROM ".tname('event')." main
        WHERE ".implode(' AND ', $wherearr)."
        ORDER BY main.{$order} $sc LIMIT 0,$shownum");
    while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        $value['title'] = getstr($value['title'], 45);
        if($value['poster']){
            $value['pic'] = pic_get($value['poster'], $value['thumb'], $value['remote']);
        } else {
            $value['pic'] = $_SGLOBAL['eventclass'][$value['classid']]['poster'];
        }
        $eventlist[] = $value;
    }
    if($_SGLOBAL['network']['event']['cache']) {
        swritefile($cachefile, serialize($eventlist));
    }
}

foreach($eventlist as $key => $value) {
    realname_set($value['uid'], $value['username']);
    $index['event'][] = $value;
}

//实名
realname_get();

swritefile($cachefile, serialize($index));

include template('index');

//获得SQL
function mk_network_sql($type, $ids, $crops, $days, $orders) {
    global $_SGLOBAL;
    
    $nt = $_SGLOBAL['network'][$type];
    
    $wherearr = array('1');
    //指定
    foreach ($ids as $value) {
        if($nt[$value]) {
            $wherearr[] = "main.{$value} IN (".$nt[$value].")";
        }
    } 
    
    //范围
    foreach ($crops as $value) {
        $value1 = $value.'1';
        $value2 = $value.'2';
        if($nt[$value1]) {
            $wherearr[] = "main.{$value} >= '".$nt[$value1]."'";
        }
        if($nt[$value2]) {
            $wherearr[] = "main.{$value} <= '".$nt[$value2]."'";
        }
    }
    //时间
    foreach ($days as $value) {
        if($nt[$value]) {
            $daytime = $_SGLOBAL['timestamp'] - $nt[$value]*3600*24;
            $wherearr[] = "main.{$value}>='$daytime'";
        }
    }
    //排序
    $order = in_array($nt['order'], $orders)?$nt['order']:array_shift($orders);
    $sc = in_array($nt['sc'], array('desc','asc'))?$nt['sc']:'desc';
    
    return array('wherearr'=>$wherearr, 'order'=>$order, 'sc'=>$sc);
}


exit;










if($_SGLOBAL['supe_uid']) {
    //已登录，直接跳转个人首页
    showmessage('enter_the_space', 'space.php?do=home', 0);
}

if(empty($_SCONFIG['networkpublic'])) {
    
    $cachefile = S_ROOT.'./data/cache_index.txt';
    $cachetime = @filemtime($cachefile);
    
    $spacelist = array();
    if($_SGLOBAL['timestamp'] - $cachetime > 900) {
        //20位热门用户
        $query = $_SGLOBAL['db']->query("SELECT s.*, sf.resideprovince, sf.residecity
            FROM ".tname('space')." s
            LEFT JOIN ".tname('spacefield')." sf ON sf.uid=s.uid
            ORDER BY s.friendnum DESC LIMIT 0,20");
        while ($value = $_SGLOBAL['db']->fetch_array($query)) {
            $spacelist[] = $value;
        }
        swritefile($cachefile, serialize($spacelist));
    } else {
        $spacelist = unserialize(sreadfile($cachefile));
    }
    
    //应用
    $myappcount = 0;
    $myapplist = array();
    if($_SCONFIG['my_status']) {
        $myappcount = $_SGLOBAL['db']->result($_SGLOBAL['db']->query("SELECT COUNT(*) FROM ".tname('myapp')." WHERE flag>='0'"), 0);
        if($myappcount) {
            $query = $_SGLOBAL['db']->query("SELECT appid,appname FROM ".tname('myapp')." WHERE flag>=0 ORDER BY flag DESC, displayorder LIMIT 0,7");
            while ($value = $_SGLOBAL['db']->fetch_array($query)) {
                $myapplist[] = $value;
            }
        }
    }

        
    //实名
    foreach ($spacelist as $key => $value) {
        realname_set($value['uid'], $value['username'], $value['name'], $value['namestatus']);
    }
    realname_get();
    
    $_TPL['css'] = 'network';
    include_once template("index");
} else {
    include_once(S_ROOT.'./source/network.php');
}

?>
