<?php
if(!defined('IN_UCHOME')) exit('Access Denied');
$_SGLOBAL['network']=Array
	(
	'blog' => Array
		(
		'blogid' => '',
		'uid' => '',
		'hot1' => '',
		'hot2' => '',
		'viewnum1' => '',
		'viewnum2' => '',
		'replynum1' => '',
		'replynum2' => '',
		'dateline' => '',
		'order' => 'dateline',
		'sc' => 'desc',
		'cache' => 600
		),
	'pic' => Array
		(
		'picid' => '',
		'uid' => '',
		'hot1' => '',
		'hot2' => '',
		'dateline' => '',
		'order' => 'dateline',
		'sc' => 'desc',
		'cache' => 700
		),
	'thread' => Array
		(
		'tid' => '',
		'uid' => '',
		'hot1' => '',
		'hot2' => '',
		'viewnum1' => '',
		'viewnum2' => '',
		'replynum1' => '',
		'replynum2' => '',
		'dateline' => '',
		'lastpost' => '',
		'order' => 'dateline',
		'sc' => 'desc',
		'cache' => 800
		),
	'event' => Array
		(
		'eventid' => '',
		'uid' => '',
		'hot1' => '',
		'hot2' => '',
		'membernum1' => '',
		'membernum2' => '',
		'follownum1' => '',
		'follownum2' => '',
		'dateline' => '',
		'order' => 'dateline',
		'sc' => 'desc',
		'cache' => 900
		),
	'poll' => Array
		(
		'pid' => '',
		'uid' => '',
		'hot1' => '',
		'hot2' => '',
		'voternum1' => '',
		'voternum2' => '',
		'replynum1' => '',
		'replynum2' => '',
		'dateline' => '',
		'order' => 'dateline',
		'sc' => 'desc',
		'cache' => 500
		)
	)
?>