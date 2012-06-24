<?php
function usr_url($ac, $params=array(), $jsparam=array()){
    if($jsparam){
        return "\"{$ac}.php" . usr_param($params, $jsparam);
    }else{
        return "{$ac}.php" . usr_param($params);
    }
}

function usr_getParam($url){
    $ret = array('name'=>null, 'query'=>array());
    $data = parse_url($url);
    $ret['name'] = basename($data['path'], '.php');
    $_query = $data['query'];
    if($_query){
        $_query = explode('&', $_query);
        foreach($_query as $_q){
            $_q = explode('=', $_q, 2);
            $ret['query'][$_q[0]] = count($_q)>1 ? $_q[1] : '';
        }
    }
    return $ret;
}

function usr_param($params='', $jsparams=array()){
    if(is_string($params))  return $params ? "?{$params}" : "";
    $p = array();
    foreach($params as $k => $v){
        if(is_numeric($k)){
            $p[] = $v;
        }else{
            $p[] = urlencode($k) . '=' . urlencode($v);
        }
    }
    $i=0;
    foreach($jsparams as $k => $v){
        $_p = urlencode("$k") . "=\"+". urlencode("$v");
        if(count($jsparams) != $i+1) $_p .= "+\"";
        $p[] = $_p;
        $i++;
    }
    return $p ? '?' . implode('&', $p) : '';
}

function match_url($url){
    parse_str($url);
}
