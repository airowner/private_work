<?
/*
    [UCenter Home] (C) 2007-2008 Comsenz Inc.
    $Id: network_album.php 12078 2009-05-04 08:28:37Z zhengqingpeng $
*/
define('IN_UC', 1);
if(!defined('IN_UCHOME')) {
    exit('Access Denied');
}

//是否公开
if(empty($_SCONFIG['networkpublic'])) {
    checklogin();//需要登录
}

include_once(S_ROOT.'./data/data_network.php');

//日志
$cachefile = S_ROOT.'./data/cache_network_blog.txt';
if(check_network_cache('blog')) {
    $bloglist = unserialize(sreadfile($cachefile));
} else {
    $sqlarr = mk_network_sql('blog',
        array('blogid', 'uid'),
        array('hot','viewnum','replynum'),
        array('dateline'),
        array('dateline','viewnum','replynum','hot')
    );
    extract($sqlarr);

    //隐私
    $wherearr[] = "main.friend='0'";
    
    //显示数量
    $shownum = 8;
    
    $query = $_SGLOBAL['db']->query("SELECT main.*, field.* 
        FROM ".tname('blog')." main
        LEFT JOIN ".tname('blogfield')." field ON field.blogid=main.blogid
        WHERE ".implode(' AND ', $wherearr)."
        ORDER BY main.{$order} $sc LIMIT 0,$shownum");
    $bloglist = array();
    while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        $value['message'] = getstr($value['message'], 86, 0, 0, 0, 0, -1);
        $value['subject'] = getstr($value['subject'], 50, 0, 0, 0, 0, -1);
        $bloglist[$value['uid']] = $value;
    }
    if($_SGLOBAL['network']['blog']['cache']) {
        swritefile($cachefile, serialize($bloglist));
    }
}
$query = $_SGLOBAL['db']->query("SELECT * FROM ".tname('space')." WHERE uid IN (".simplode(array_keys($bloglist)).")");
while ($value = $_SGLOBAL['db']->fetch_array($query)) {
    realname_set($value['uid'], $value['username'], $value['name'], $value['namestatus']);
    $bloglist[$value['uid']] = $value + $bloglist[$value['uid']];
}

require_once(S_ROOT . '/uc_client/model/base.php');
//话题
$cachefile = S_ROOT.'./data/cache_network_thread.txt';
if(check_network_cache('thread')) {
    $threadlist = unserialize(sreadfile($cachefile));
} else {
    $sqlarr = mk_network_sql('thread',
        array('tid', 'uid'),
        array('hot','viewnum','replynum'),
        array('dateline','lastpost'),
        array('dateline','viewnum','replynum','hot')
    );
    extract($sqlarr);

    //显示数量
    $shownum = 7;
    $threadlist = array();
    $query = $_SGLOBAL['db']->query("SELECT main.*, m.tagname, p.message
        FROM ".tname('thread')." main
        LEFT JOIN (".tname('mtag')." m, ".tname("post")." p) ON (m.tagid=main.tagid and p.tagid=main.tagid and p.tid=main.tid and p.isthread=1)
        WHERE ".implode(' AND ', $wherearr)."
        ORDER BY main.{$order} $sc LIMIT 0,$shownum");

    while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        $value['tagname'] = getstr($value['tagname'], 20);
        $value['subject'] = getstr($value['subject'], 50);
        $threadlist[] = $value;
    }
    if($_SGLOBAL['network']['thread']['cache']) {
        swritefile($cachefile, serialize($threadlist));
    }
}
foreach($threadlist as $key => $value) {
    realname_set($value['uid'], $value['username']);
    $value['message'] = strip_tags($value['message']);
    $threadlist[$key] = $value;
}


//活动
include_once(S_ROOT.'./data/data_eventclass.php');
$cachefile = S_ROOT.'./data/cache_network_event.txt';
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
    $shownum = 7;
    
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
    $eventlist[$key] = $value;
}




//图片
/*
$cachefile = S_ROOT.'./data/cache_network_pic.txt';
if(check_network_cache('pic')) {
    $piclist = unserialize(sreadfile($cachefile));
} else {
    $sqlarr = mk_network_sql('pic',
        array('picid', 'uid'),
        array('hot'),
        array('dateline'),
        array('dateline','hot')
    );
    extract($sqlarr);

    //显示数量
    $shownum = 28;
    
    $piclist = array();
    $query = $_SGLOBAL['db']->query("SELECT album.albumname, album.friend, space.username, space.name, space.namestatus, main.* 
        FROM ".tname('pic')." main
        LEFT JOIN ".tname('album')." album ON album.albumid=main.albumid
        LEFT JOIN ".tname('space')." space ON space.uid=main.uid
        WHERE ".implode(' AND ', $wherearr)."
        ORDER BY main.{$order} $sc LIMIT 0,$shownum");
    while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        if(empty($value['friend'])) {
            $value['pic'] = pic_get($value['filepath'], $value['thumb'], $value['remote']);
            $piclist[] = $value;
        }
    }
    if($_SGLOBAL['network']['pic']['cache']) {
        swritefile($cachefile, serialize($piclist));
    }
}
foreach($piclist as $key => $value) {
    realname_set($value['uid'], $value['username'], $value['name'], $value['namestatus']);
    $piclist[$key] = $value;
}


//投票
$cachefile = S_ROOT.'./data/cache_network_poll.txt';
if(check_network_cache('poll')) {
    $polllist = unserialize(sreadfile($cachefile));
} else {
    $sqlarr = mk_network_sql('poll',
        array('pid', 'uid'),
        array('hot','voternum','replynum'),
        array('dateline'),
        array('dateline','voternum','replynum','hot')
    );
    extract($sqlarr);

    //显示数量
    $shownum = 9;
    
    $polllist = array();
    $query = $_SGLOBAL['db']->query("SELECT main.*
        FROM ".tname('poll')." main
        WHERE ".implode(' AND ', $wherearr)."
        ORDER BY main.{$order} $sc LIMIT 0,$shownum");
    while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        realname_set($value['uid'], $value['username']);
        $polllist[] = $value;
    }
    if($_SGLOBAL['network']['poll']['cache']) {
        swritefile($cachefile, serialize($polllist));
    }
}
foreach($polllist as $key => $value) {
    realname_set($value['uid'], $value['username']);
    $polllist[$key] = $value;
}

//记录
$dolist = array();
$query = $_SGLOBAL['db']->query("SELECT *
    FROM ".tname('doing')."
    ORDER BY dateline DESC LIMIT 0,5");
while ($value = $_SGLOBAL['db']->fetch_array($query)) {
    realname_set($value['uid'], $value['username']);
    $value['title'] = getstr($value['message'], 0, 0, 0, 0, 0, -1);
    $dolist[] = $value;
}
*/
//积分排名
$credit_user = array();
$query = $_SGLOBAL['db']->query("SELECT * FROM ".tname('space')." order by credit desc limit 0, 20");
while ($value = $_SGLOBAL['db']->fetch_array($query)) {
    realname_set($value['uid'], $value['username'], $value['name'], $value['namestatus']);
    $credit_user[] = $value;
}
//最新居民
$newest_user = array();
$query = $_SGLOBAL['db']->query("SELECT * FROM ".tname('spacefield')." order by uid desc limit 0, 11");
while ($value = $_SGLOBAL['db']->fetch_array($query)) {
    realname_set($value['uid'], $value['username']);
    $newest_user[] = $value;
}
//居民秀
$user_show = array();
$query = $_SGLOBAL['db']->query("SELECT * FROM ".tname('space')." WHERE avatar=1 order by lastlogin desc limit 0, 48");
while ($value = $_SGLOBAL['db']->fetch_array($query)) {
    realname_set($value['uid'], $value['username']);
    $user_show[] = $value;
}

//推荐博客
$hotblog = array();
$hotbloglist = array();
$hotbloguid = array();
if($_SCONFIG['spacehotblogusername']) {
    $query = $_SGLOBAL['db']->query("SELECT m.uid, m.username, m.name, m.namestatus, f.resideprovince, f.residecity FROM ".tname('space')." m LEFT JOIN ".tname('spacefield')." f ON m.uid=f.uid WHERE m.username IN (".simplode(explode(',', $_SCONFIG['spacehotblogusername'])).")");
    //~ echo "SELECT * FROM ".tname('space')." WHERE username IN (".simplode(explode(',', $_SCONFIG['spacehotblogusername'])).")";exit;
    while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        realname_set($value['uid'], $value['username'], $value['name'], $value['namestatus']);
        $hotbloglist[$value['uid']] = $value;
    }
}
if($hotbloglist) {
    $hotblog = sarray_rand($hotbloglist, 3);
    $query = $_SGLOBAL['db']->query("SELECT * FROM (SELECT uid, blogid, subject FROM ".tname('blog')." where uid in (" . simplode(array_keys($hotblog)) . ") order by dateline desc) t group by uid;");
    while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        $hotblog[$value['uid']] += $value;
    }
}
//~ var_dump($hotblog);exit;

//兴趣分类及内容
$mtags = array();
$mtagusers = array();
$fs = array();
if($_SCONFIG['mtaginterest']){
    $query = $_SGLOBAL['db']->query("SELECT tagid, tagname FROM ".tname('mtag')." WHERE tagid IN (".$_SCONFIG['mtaginterest'].")");
    while ($v = $_SGLOBAL['db']->fetch_array($query)) {
        $fs[$v['tagid']] = $v['tagname'];
    }
    foreach(explode(',', $_SCONFIG['mtaginterest']) as $tagid){
        $mtags[$tagid] = $fs[$tagid];
    }
    $query = $_SGLOBAL['db']->query("SELECT tagid, group_concat(uid) as uids FROM ".tname('tagspace')." WHERE tagid IN ( " . $_SCONFIG['mtaginterest'] .") group by tagid");
    while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        $mtagusers[$value['tagid']] = array();
        $i = 0;
        foreach(explode(',', $value['uids']) as $value_uid){
            if($i<40){
                realname_set($value_uid, '');
                $mtagusers[$value['tagid']][] = $value_uid;
            }
            $i++;
        }
    }
}
    
//站长推荐 左上角
$star = array();
$starlist = array();
if($_SCONFIG['spacebarusername']) {
    $query = $_SGLOBAL['db']->query("SELECT * FROM ".tname('space')." WHERE username IN (".simplode(explode(',', $_SCONFIG['spacebarusername'])).")");
    //~ echo "SELECT * FROM ".tname('space')." WHERE username IN (".simplode(explode(',', $_SCONFIG['spacebarusername'])).")";exit;
    while ($value = $_SGLOBAL['db']->fetch_array($query)) {
        realname_set($value['uid'], $value['username'], $value['name'], $value['namestatus']);
        $starlist[] = $value;
    }
}
if($starlist) {
    $star = sarray_rand($starlist, 6);
}

//竞价排名
$showlist = array();
$query = $_SGLOBAL['db']->query("SELECT sh.note, s.* FROM ".tname('show')." sh
    LEFT JOIN ".tname('space')." s ON s.uid=sh.uid
    ORDER BY sh.credit DESC LIMIT 0,23");
while ($value = $_SGLOBAL['db']->fetch_array($query)) {
    realname_set($value['uid'], $value['username'], $value['name'], $value['namestatus']);
    $value['note'] = addslashes(getstr($value['note'], 80, 0, 0, 0, 0, -1));
    $showlist[$value['uid']] = $value;
}
/*
if(empty($star) && $showlist) {
    $star = sarray_rand($showlist, 1);
}
*/

//在线用户
/*
$onlinelist = array();
$query = $_SGLOBAL['db']->query("SELECT s.*, sf.note FROM ".tname('session')." s
    LEFT JOIN ".tname('spacefield')." sf ON sf.uid=s.uid
    ORDER BY s.lastactivity DESC LIMIT 0,12");
while ($value = $_SGLOBAL['db']->fetch_array($query)) {
    if(!$value['magichidden']) {
        $value['note'] = shtmlspecialchars(strip_tags($value['note']));
        realname_set($value['uid'], $value['username']);
        $onlinelist[$value['uid']] = $value;
    }
}
if(empty($star) && $onlinelist) {
    $star = sarray_rand($onlinelist, 1);
}


//在线人数
$olcount = getcount('session', array());
*/

//应用
/*
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
}*/

//分享
$sharelist = array();
$query = $_SGLOBAL['db']->query("SELECT *
    FROM ".tname('share')."
    ORDER BY dateline DESC LIMIT 0,11");
while ($value = $_SGLOBAL['db']->fetch_array($query)) {
    realname_set($value['uid'], $value['username']);
    $sharelist[] = $value;
}

realname_get();

//最后登录名
$membername = empty($_SCOOKIE['loginuser'])?'':sstripslashes($_SCOOKIE['loginuser']);
$wheretime = $_SGLOBAL['timestamp']-3600*24*30;

$_TPL['css'] = 'network';
include_once template("network");

//检查缓存
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

    $sqlarr = mk_network_sql('blog',
        array('blogid', 'uid'),
        array('hot','viewnum','replynum'),
        array('dateline'),
        array('dateline','viewnum','replynum','hot')
    );
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

?>
