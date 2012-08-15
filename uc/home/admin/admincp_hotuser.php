<?php
/*
    [UCenter Home] (C) 2007-2008 Comsenz Inc.
    $Id: admincp_hotuser.php 12778 2009-07-20 08:03:03Z zhengqingpeng $
*/

if(!defined('IN_UCHOME') || !defined('IN_ADMINCP')) {
    exit('Access Denied');
}

//权限
$managehotuser = checkperm('managehotuser');
$managedefaultuser = checkperm('managedefaultuser');
$vars = array();
if($ac == 'hotuser') {
    if(!$managehotuser) {
        cpmessage('no_authority_management_operation');
    }
    $vars[] = 'spacebarusername';
}elseif(in_array($ac, array('mtaginterest', 'mtagrecommendorder', 'mtagrecommend', 'mtagbeijingorder', 'mtagbeijing'))){
    if(!$managehotuser) {
        cpmessage('no_authority_management_operation');
    }
    $vars[] = $ac;
}elseif(in_array($ac, array('hotblog', 'hotmtagowner', 'hotmtaguser'))) {
    if(!$managehotuser) {
        cpmessage('no_authority_management_operation');
    }
    $vars[] = 'space' . $ac . 'username';
} else {
    if(!$managedefaultuser) {
        cpmessage('no_authority_management_operation');
    }
    $vars[] = 'defaultfusername';
    $vars[] = 'defaultpoke';
}

if(submitcheck('thevaluesubmit')) {

    $setarr = array();
    if($ac == 'defaultuser') {
        //默认好友
        $fs = array();
        $_POST['config']['defaultfusername'] = trim(preg_replace("/(\s*(\r\n|\n\r|\n|\r)\s*)/", "\r\n", $_POST['config']['defaultfusername']));
        if($_POST['config']['defaultfusername']) {
            $query = $_SGLOBAL['db']->query("SELECT uid,username FROM ".tname('space')." WHERE username IN (".simplode(explode("\r\n", $_POST['config']['defaultfusername'])).")");
            while ($value = $_SGLOBAL['db']->fetch_array($query)) {
                $fs[$value['uid']] = saddslashes($value['username']);
            }
        }
        $_POST['config']['defaultfusername'] = empty($fs)?'':implode(',', $fs);
    } elseif(in_array($ac, array('mtaginterest', 'mtagrecommendorder', 'mtagrecommend', 'mtagbeijingorder', 'mtagbeijing'))) {
        $fs = array();
        $_fs = array();
        $_POST['config'][$ac] = trim(preg_replace("/(\s*(\r\n|\n\r|\n|\r)\s*)/", "\r\n", $_POST['config'][$ac]));
        if($_POST['config'][$ac]) {
            $query = $_SGLOBAL['db']->query("SELECT tagid, tagname FROM ".tname('mtag')." WHERE tagname IN (".simplode(explode("\r\n", $_POST['config'][$ac])).")");
            while ($value = $_SGLOBAL['db']->fetch_array($query)) {
                $fs[$value['tagname']] = $value['tagid'];
            }
            foreach(explode("\r\n", $_POST['config'][$ac]) as $tagname){
                if(isset($fs[$tagname])){
                    $_fs[] = $fs[$tagname];
                }
            }
        }
        $_POST['config'][$ac] = empty($_fs)?'':implode(',', $_fs);
    } elseif(in_array($ac, array('hotblog', 'hotmtagowner', 'hotmtaguser'))) {
        $fs = array();
        $_fs = array();
        $_POST['config']['space'. $ac . 'username'] = trim(preg_replace("/(\s*(\r\n|\n\r|\n|\r)\s*)/", "\r\n", $_POST['config']['space'. $ac . 'username']));
        if($_POST['config']['space'. $ac . 'username']) {
            $query = $_SGLOBAL['db']->query("SELECT uid,username FROM ".tname('space')." WHERE username IN (".simplode(explode("\r\n", $_POST['config']['space'. $ac . 'username'])).")");
            while ($value = $_SGLOBAL['db']->fetch_array($query)) {
                $fs[$value['username']] = saddslashes($value['username']);
            }
            foreach(explode("\r\n", $_POST['config']['space'. $ac . 'username']) as $username){
                if(isset($fs[$username])){
                    $_fs[] = $fs[$username];
                }
            }
        }
        $_POST['config']['space' . $ac . 'username'] = empty($_fs)?'':implode(',', $_fs);
    } else {
        //优秀用户
        $fs = array();
        $_fs = array();
        $_POST['config']['spacebarusername'] = trim(preg_replace("/(\s*(\r\n|\n\r|\n|\r)\s*)/", "\r\n", $_POST['config']['spacebarusername']));
        if($_POST['config']['spacebarusername']) {
            $query = $_SGLOBAL['db']->query("SELECT uid,username FROM ".tname('space')." WHERE username IN (".simplode(explode("\r\n", $_POST['config']['spacebarusername'])).")");
            while ($value = $_SGLOBAL['db']->fetch_array($query)) {
                $fs[$value['username']] = saddslashes($value['username']);
            }
            foreach(explode("\r\n", $_POST['config']['spacebarusername']) as $username){
                if(isset($fs[$username])){
                    $_fs[] = $fs[$username];
                }
            }
        }
        $_POST['config']['spacebarusername'] = empty($_fs)?'':implode(',', $_fs);
    }
    
    foreach ($_POST['config'] as $var => $value) {
        $value = trim($value);
        if(!isset($_SCONFIG[$var]) || $_SCONFIG[$var] != $value) {
            $setarr[] = "('$var', '$value')";
        }
    }
    if($setarr) {
        $_SGLOBAL['db']->query("REPLACE INTO ".tname('config')." (var, datavalue) VALUES ".implode(',', $setarr));
    }

    //更新缓存
    include_once(S_ROOT.'./source/function_cache.php');
    config_cache();

    cpmessage('do_success', 'admincp.php?ac='.$ac);
}

$query = $_SGLOBAL['db']->query("SELECT * FROM ".tname('config')." WHERE var IN (".simplode($vars).")");
while ($value = $_SGLOBAL['db']->fetch_array($query)) {
    $value['datavalue'] = shtmlspecialchars($value['datavalue']);
    if(in_array($value['var'], array('defaultfusername', 'spacebarusername', 'space' . $ac . 'username'))) {
        $value['datavalue'] = implode("\r\n", explode(',', $value['datavalue']));
    }
    if(in_array($value['var'], array('mtaginterest', 'mtagrecommend', 'mtagrecommendorder', 'mtagbeijingorder', 'mtagbeijing'))) {
        $fs = array();
        $dv = array();
        if($value['datavalue']){
            $query = $_SGLOBAL['db']->query("SELECT tagid, tagname FROM ".tname('mtag')." WHERE tagid IN (".$value['datavalue'].")");
            while ($v = $_SGLOBAL['db']->fetch_array($query)) {
                $fs[$v['tagid']] = $v['tagname'];
            }
            foreach(explode(',', $value['datavalue']) as $tagid){
                $dv[] = $fs[trim($tagid)];
            }
            $value['datavalue'] = implode("\r\n", $dv);
        }
    }
    $configs[$value['var']] = $value['datavalue'];
}

?>
