<?php

$header = \think\Request::instance()->header();
//在所有的头里都带上用户名,主要用户名存在就加载对应的数据库
$param = \think\Request::instance()->param();
$userInfo = ['18888888888','18666666666'];
$arr2= [
    // 数据库类型
    'type'            => 'mysql',
    // 服务器地址
    'hostname'        => 'localhost',
    // 数据库名
    'database'        => 'lanyun_crm',
    // 用户名
    'username'        => 'root',
    // 密码
    'password'        => 'sWs#t7Ghfq@3fdMh',
    // 端口
    'hostport'        => '3306',
    // 连接dsn
    'dsn'             => '',
    // 数据库连接参数
    'params'          => [],
    // 数据库编码默认采用utf8
    'charset'         => 'utf8',
    // 数据库表前缀
    'prefix'          => 'lycrm_',
    // 数据库调试模式
    'debug'           => true,
    // 数据库部署方式:0 集中式(单一服务器),1 分布式(主从服务器)
    'deploy'          => 0,
    // 数据库读写是否分离 主从式有效
    'rw_separate'     => false,
    // 读写分离后 主服务器数量
    'master_num'      => 1,
    // 指定从服务器序号
    'slave_no'        => '',
    // 自动读取主库数据
    'read_master'     => false,
    // 是否严格检查字段是否存在
    'fields_strict'   => true,
    // 数据集返回类型
    'resultset_type'  => 'array',
];

    if($header['type']== 'login'&&$header['dbname']=='') return $arr2;

    if($header['type']== 'login' ){
        $dbname = $header['dbname'].'_crm';
        $arr =[// 数据库类型
            'type'            => 'mysql',
            // 服务器地址
            'hostname'        => 'localhost',
            // 数据库名
            'database'        => $dbname ,
            // 用户名
            'username'        => 'root',
            // 密码
            'password'        => 'sWs#t7Ghfq@3fdMh',
            // 端口
            'hostport'        => '3306',
            // 连接dsn
            'dsn'             => '',
            // 数据库连接参数
            'params'          => [],
            // 数据库编码默认采用utf8
            'charset'         => 'utf8',
            // 数据库表前缀
            'prefix'          => 'lycrm_',
            // 数据库调试模式
            'debug'           => true,
            // 数据库部署方式:0 集中式(单一服务器),1 分布式(主从服务器)
            'deploy'          => 0,
            // 数据库读写是否分离 主从式有效
            'rw_separate'     => false,
            // 读写分离后 主服务器数量
            'master_num'      => 1,
            // 指定从服务器序号
            'slave_no'        => '',
            // 自动读取主库数据
            'read_master'     => false,
            // 是否严格检查字段是否存在
            'fields_strict'   => true,
            // 数据集返回类型
            'resultset_type'  => 'array',];
        return $arr;
    }else{

        return $arr2;
}




