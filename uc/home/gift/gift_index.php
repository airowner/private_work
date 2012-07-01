<?php
if(!defined('IN_UCHOME')) {
	exit('Access Denied');
}

if($_GET['inajax'])
{
	$uid = $_GET['uid'];
	$query = $_SGLOBAL['db']->query("SELECT username FROM ".tname('space')." WHERE uid=$uid");
	$value = $_SGLOBAL['db']->fetch_array($query);
	$friend = $value['username'];
}
else
{
$friends = array();
//取所有好友用户名
$query = $_SGLOBAL['db']->query("SELECT fusername FROM ".tname('friend')." WHERE uid=$_SGLOBAL[supe_uid] AND status='1'");
while ($value = $_SGLOBAL['db']->fetch_array($query)) {
	$value['fusername'] = saddslashes($value['fusername']);
	$friends[] = $value['fusername'];
}
$friendstr = implode(',', $friends);

//获取回赠信息
$touid = (int)$_GET['uid'];
if(!empty($touid)){
	$toInfo = @getspace($touid);
	if(!empty($toInfo['username'])){
		$fusername = $toInfo['username'];
	}
}
}
$giftlist = getGiftList('gbk');
	
include_once ( template('gift/view/index') );

?>
