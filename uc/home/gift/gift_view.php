<?php
if(!defined('IN_UCHOME')) {
	exit('Access Denied');
}

//分页
$start = empty($_GET['start'])?0:intval($_GET['start']);
$theurl = "/gift/do/view";
//检查开始数
$_VPERPAGE=$_VPERPAGE-1;
ckstart($start, $_VPERPAGE);
$gift = getGiftList();
$giftadd = getGiftList('gbk', true);
$gift = array_merge_recursive($gift, $giftadd);
for($i=0;$i<count($gift['category']);$i++){
	for($j=0;$j<count($gift['gift'][$i]);$j++){
		$g = $gift['gift'][$i][$j];
		$glist[$g['src']] = array("name"=>$g['name'], "summary"=>$g['summary']);
	}
}
$sql = "SELECT * FROM ".tname("app_tw_gift")." WHERE touid = {$_SGLOBAL['supe_uid']} ORDER BY dateline DESC limit {$start},{$_VPERPAGE}";
$query = $_SGLOBAL['db']->query($sql);
if($_SGLOBAL['db']->num_rows($query) > 0){
	while ($value = $_SGLOBAL['db']->fetch_array($query)){
		//$value['message'] = mb_substr($value['message'], 0, 8);
		$value['message'] = $value['message'];
		$list[] = $value;
	}
	$count = count($list);
	//分页
	$multi = smulti($start, $_VPERPAGE, $count, $theurl);
	
}else{

}
include_once ( template('gift/view/view') );

?>
