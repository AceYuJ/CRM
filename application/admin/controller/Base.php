<?php
// +----------------------------------------------------------------------
// | Description: 基础类，无需验证权限。
// +----------------------------------------------------------------------
// | Author:  
// +----------------------------------------------------------------------

namespace app\admin\controller;

use app\admin\model\Register;
use app\admin\model\User;
use app\CheckCompany;
use com\verify\HonrayVerify;
use app\common\controller\Common;
use think\Request;
use think\Session;

class Base extends Common
{
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

        Session::set('user_id', $data['userInfo']['id']);
        if (!$data) {
            return resultArray(['error' => $userModel->getError()]);
        }
        return resultArray(['data' => $data]);
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
            $userModel = model('User');
            $data = $userModel->increase($param);
            if($data){
//                return resultArray(['data' => $data]);
                return json(array('status'=>0,'msg'=>'注册成功','data'=>$data));
            }else{
                return resultArray(['error' => $userModel->getError()]);
//                return json(array('status'=>1,'msg'=>'注册失败'));
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
 