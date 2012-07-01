<?php
if(!defined('IN_UCHOME')) {
	exit('Access Denied');
}

if(!submitcheck("giftsubmit")){
	exit;
}

	$gid = (int)$_POST['giftitem'];
	$fusername = saddslashes(trim($_POST['username_gift']));
	$toInfo = @getspace($fusername,'username');
	$type = (int)$_POST['gifttype'];
	$message = saddslashes(trim($_POST['message']));
	if(empty($toInfo['uid'])){
		showmessage("没有此用户",$_SGLOBAL['refer']);
	}
	if($toInfo['uid'] == $_SGLOBAL['supe_uid']){
		showmessage("礼物不能送给自己",$_SGLOBAL['refer']);
	}
	if(empty($gid)){
		showmessage("您未选择赠送的礼物",$_SGLOBAL['refer']);
	}
	if(!in_array($type,array("0","1","2"))){
		showmessage("没有这种赠送方式",$_SGLOBAL['refer']);
	}
	if(strlen($message) > 210){
		showmessage("您填写的赠言过长",$_SGLOBAL['refer']);
	}
	
	$myGift = getGiftListById($gid);
	if(!$myGift){
		showmessage("没有这个礼物",$_SGLOBAL['refer']);
	}
	if($space['credit'] < $myGift['cost']){
		showmessage("您没有足够的积分赠送这件礼物",$_SGLOBAL['refer']);
	}
	
	$data = array(
		'uid' => $_SGLOBAL['supe_uid'],
		'username' => $_SGLOBAL['supe_username'],
		'touid' => $toInfo['uid'],
		'tousername' => $toInfo['username'],
		'gift' => $myGift['src'],
		'dateline' => date("U"),
		'type' => $type
	 );
	if(!empty($message)){
		$data['message'] = $message;
	}
	if($type == "2"){
		$data['uid'] = '0';
		$data['username'] = '0';
	}
	
	inserttable('app_tw_gift', $data);
	$_SGLOBAL['db']->query("UPDATE ".tname('space')." SET credit=credit-".$myGift['cost']." WHERE uid='$_SGLOBAL[supe_uid]'");
	//$_SGLOBAL['db']->query("UPDATE ".tname('session')." SET credit=credit-".$myGift['cost']." WHERE uid='$_SGLOBAL[supe_uid]'");
	include_once(S_ROOT.'./source/function_cp.php');
	//feed
	if($type == "0"){
		$fs = array();
		$fs['icon'] = 'share';
		$fs['title_template'] = "{actor} 送给 <a href=\"/space/uid/{$toInfo['uid']}\">".$toInfo['username']."</a> 一份<a href=\"/gift\">礼物</a><br><a href=\"/space/uid/{$toInfo['uid']}/do/gift\"><img src=\"/gift/gift_model/image/{$myGift['src']}\" onmouseover=\"promptdiv(this);\" onmouseout=\"hiddenprompt(this);\" onmousemove=\"moveel(event);\" ><input type=\"hidden\" value=\"{$myGift['name']}\" name=\"name\" /><input type=\"hidden\" value=\"{$myGift['summary']}\" name=\"summary\" /></a>";
		$fs['title_data'] = array();
		$fs['body_template'] = '';
		$fs['body_data'] = array();
		feed_add($fs['icon'], $fs['title_template'], $fs['title_data'], $fs['body_template'], $fs['body_data'], $fs['body_general'],$fs['images'], $fs['image_links'], $fs['target_ids'], 0);
	}
	//通知
	if($type == "2"){
		$message = "某人悄悄的送给您<a href=\"/gift/do/view\">礼物</a><br><img src=\"/gift/gift_model/image/{$myGift['src']}\" onmouseover=\"promptdiv(this);\" onmouseout=\"hiddenprompt(this);\" onmousemove=\"moveel(event);\" ><input type=\"hidden\" value=\"{$myGift['name']}\" name=\"name\" /><input type=\"hidden\" value=\"{$myGift['summary']}\" name=\"summary\" />";
	}else{
		$message = "送给您<a href=\"/gift/do/view\">礼物</a><br><img src=\"/gift/gift_model/image/{$myGift['src']}\" onmouseover=\"promptdiv(this);\" onmouseout=\"hiddenprompt(this);\" onmousemove=\"moveel(event);\" ><input type=\"hidden\" value=\"{$myGift['name']}\" name=\"name\" /><input type=\"hidden\" value=\"{$myGift['summary']}\" name=\"summary\" />";
	}
	if($data['message']){$message .="<br>附言 : ".$data['message'];}
	if($type != "2"){
		$message .= "<br><a href=\"/gift/uid/{$_SGLOBAL['supe_uid']}\">回赠礼物</a>";
		notification_add($toInfo['uid'], "app", $message );
	}else{
		$sql = "INSERT INTO ".tname("notification")." (uid,type,new,authorid,author,note,dateline) VALUES('{$toInfo['uid']}','app','1','','','{$message}','{$data['dateline']}')";
		$_SGLOBAL['db']->query($sql);
	}
	
	
	showmessage("礼物已经送出","/gift");

?>
