<?php
// +----------------------------------------------------------------------
// | Description: 加载动态配置
// +----------------------------------------------------------------------
namespace app\common\behavior;
class InitConfigBehavior
{
    public function run(&$content)
    {
        //读取数据库中的配置
        $system_config = []; 
        // config($system_config); //添加配置
    }
}