<?php
// +----------------------------------------------------------------------
// | Description: 基础类，无需验证权限。
// +----------------------------------------------------------------------
// | Author:  
// +----------------------------------------------------------------------

namespace app\admin\controller;

use app\admin\model\User;
use app\CheckCompany;
use com\verify\HonrayVerify;
use app\common\controller\Common;
use think\Config;
use think\Request;
use think\Session;

class Base extends Common
{
    public function getCompany()
    {
        $data = User::getc_ompany();
        return resultArray(['data' => $data]);
    }
    public function login()
    {
        $userModel = model('User');
        $param = $this->param;
        $username = $param['username'];
        $password = $param['password'];
        $verifyCode = !empty($param['verifyCode'])? $param['verifyCode']: '';
        $isRemember = !empty($param['isRemember'])? $param['isRemember']: '';
        $is_mobile = $param['is_mobile'] ? : '';
        
        $data = $userModel->login($username, $password, $verifyCode, $isRemember, $type, $authKey, $is_mobile);
        //获取已经注册的所以公司
        Session::set('user_id', $data['userInfo']['id']);
        if (!$data) {
            return resultArray(['error' => $userModel->getError()]);
        }
        return resultArray(['data' => $data]);
    }
    //check_mobile
    public function sendMessages(){
        if(request()->isPost()){
            $param = $this->param;
            $header = Request::instance()->header();
            if($header['type']=='register'){
                //验证手机是否为空
                if($param['mobile'] == '')return resultArray(['error' =>'手机不能为空']);

                //验证是否是正确的手机号
                if(!check_mobile($param['mobile'])) return resultArray(['error' =>'请输入正确的手机号']);

                $code = rand(100000,999999);//生成随机验证码
                //发送短信
               if(aliSmsSend($param['mobile'], $code, '蓝云科技','SMS_171105265')== true){
                   $data =['code'=>200 ,'res'=>$code,'msg'=>'发送成功'];
                   session('sendMessages', $code);
                   return resultArray(['data' => $data]);
               }else{
                   return resultArray(['error' =>'发送失败']);
               }
            }
        }else{
            return resultArray(['error' =>'非法提交']);
        }


    }


    /*
     * 公司注册
     */
    public function register()
    {
        if(request()->isPost()) {
            $param = $this->param;
            $res = User::verifyRegister($param);
            if ($res) {
                return json(array('status' => 1, 'msg' => $res));
            }
            $msgCode = Session::get('sendMessages');
            if($param['phone_code'] != $msgCode){
                return resultArray(['error' =>'验证码不正确']);
            }
            $userModel = model('User');
            $data = $userModel->increase($param);
            if($data){
                return json(array('status'=>0,'msg'=>'注册成功','data'=>$data));
            }else{
                return resultArray(['error' => $userModel->getError()]);
            }
         }

    }

    //退出登录
    public function logout()
    {
        $param = $this->param;
        $header = Request::instance()->header();
        if ($param['mobile'] == 1) {
            cache('Auth_'.$header['authkey'].'mobile', null);
        } else {
            cache('Auth_'.$header['authkey'], null);
        }
        session('null', 'admin');
        session('admin','null');
        session('user_id','null');
        return resultArray(['data'=>'退出成功']);
    }

    //获取图片验证码
    public function getVerify()
    {
        $captcha = new HonrayVerify(config('captcha'));
        return $captcha->entry();
    }

	//网站信息
    public function index()
    {   
        $systemModel = model('System');
        $data = $systemModel->getDataList();
        return  resultArray(['data' => $data]);
    }    
	
    // miss 路由：处理没有匹配到的路由规则
    public function miss()
    {

        if (Request::instance()->isOptions()) {
            return ;
        } else {
            echo '蓝云科技';
        }
    }
}
 