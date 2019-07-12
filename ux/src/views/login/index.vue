<template>
  <div class="wrapper">
    <div class="left">
      <div class="left-pic" />
    </div>
    <div class="right"> 
        <div class="title">{{ name == "悟空软件" ? "蓝云科技" : name }}</div>
        <el-tabs tab-position="bottom" stretch style="width:90%">
          <el-tab-pane label="用户登陆">
            <el-form ref="loginForm"
               :model="loginForm"
               :rules="loginRules"
               class="login-form"
               auto-complete="on"
               label-position="left"
               status-icon>
               <el-form-item prop="username">
                 <el-select v-model="loginForm.value" filterable placeholder="请选择公司" @change="setDbCache">
                  <el-option
                    v-for="item in options"
                    :key="item.value"
                    :label="item.company_name"
                    :value="item.db_name">
                  </el-option>
                </el-select>
                <el-input ref="name"
                          v-model="loginForm.username"
                          name="username"
                          type="number"
                          auto-complete="on"
                          placeholder="请输入用户名"
                          @keyup.enter.native="handleLogin" />
              </el-form-item>
              <el-form-item prop="password">
                <el-input type="password"
                          v-model="loginForm.password"
                          name="password"
                          auto-complete="on"
                          placeholder="请输入密码"
                          @keyup.enter.native="handleLogin" />
              </el-form-item>
              <el-form-item>
                <el-button :loading="loading"
                          @click.native.prevent="handleLogin"
                          class="submit-btn">
                  登录
                </el-button>
              </el-form-item>
            </el-form>
          </el-tab-pane>
          <el-tab-pane label="用户注册">
            <el-form ref="registerForm"
               :model="registerForm"
               :rules="registerRules"
               class="login-form"
               auto-complete="on"
               label-position="left"
               status-icon>
              <el-form-item prop="phone">
                <el-input ref="tel"
                          v-model="registerForm.phone"
                          autofocus="autofocus"
                          name="phone"
                          type="number"
                          auto-complete="on"
                          placeholder="请输入手机号"
                          @keyup.enter.native="handleRegister" />
              </el-form-item>
              <el-form-item prop="validcode">
                <el-input type="number"
                          v-model="registerForm.validcode"
                          name="validcode"
                          auto-complete="on"
                          placeholder="请输入短信验证码"
                          @keyup.enter.native="handleRegister" >
                  <template slot="append"><el-button class="code-btn" slot="append" size="medium" @click.stop="handleSend">{{ codeMsg }}</el-button></template>
                </el-input>
              </el-form-item>
              <el-form-item prop="newpwd">
                <el-input type="password"
                          v-model="registerForm.newpwd"
                          name="newpwd"
                          auto-complete="on"
                          placeholder="请输入密码"
                          @keyup.enter.native="handleRegister" />
              </el-form-item>
              <el-form-item prop="socialnums">
                <el-input type="text"
                          v-model="registerForm.socialnums"
                          name="socialnums"
                          auto-complete="on"
                          placeholder="请输入社会统一编号"
                          @keyup.enter.native="handleRegister" />
              </el-form-item>
              <el-form-item prop="contactperson">
                <el-input type="text"
                          v-model="registerForm.contactperson"
                          name="contactperson"
                          auto-complete="on"
                          placeholder="请输入联系人"
                          @keyup.enter.native="handleRegister" />
              </el-form-item>
              <el-form-item prop="company">
                <el-input type="text"
                          v-model="registerForm.company"
                          name="company"
                          auto-complete="on"
                          placeholder="请输入公司名称"
                          @keyup.enter.native="handleRegister" />
              </el-form-item>
              <el-form-item>
                <el-button :loading="loading"
                          @click.native.prevent="handleRegister"
                          class="submit-btn">
                  注册
                </el-button>
              </el-form-item>
            </el-form>
          </el-tab-pane>
        </el-tabs>
      <div class="copyright">
        蓝云CRM受国家计算机软件著作权保护，未经授权不得进行商业行为，违者必究。<br>
        <a target="_blank"
           href="http://www.zhlanyun.com/">©2019 蓝云科技</a>
      </div>
    </div>

    <img class="logo"
         :src="logo" />
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import Lockr from 'lockr'
import { Loading, Message } from 'element-ui'
import { setInterval, clearInterval } from 'timers'
import { isNull } from 'util';

export default {
  name: 'Login',
  data() {
    const validateUsername = (rule, value, callback) => {
      if (!/^(1[3456789]\d{9})$/.test(value)) {
        this.is_error = false
        callback(new Error('请输入正确格式的用户名'))
      } else {
        this.is_error = true
        callback()
      }
    }
    const validatePass = (rule, value, callback) => {
      if (value.length < 5) {
        this.is_error = false
        callback(new Error('密码不能小于5位'))
      } else {
        this.is_error = true
        callback()
      }
    }
    const validateNewUser = (rule, value, callback) => {
      if (!/^1[3456789]\d{9}$/.test(value)) {
        this.is_error = false
        callback(new Error('请输入正确格式的手机号'))
      } else {
        this.is_error = true
        callback()
      }
    }
    const validateSocialnums = (rule, value, callback) => {
      this.registerForm.socialnums = value.trim()
      if (!/^[^_IOZSVa-z\W]{2}\d{6}[^_IOZSVa-z\W]{10}$/g.test(this.registerForm.socialnums)) {
        this.is_error = false
        callback(new Error('请输入正确格式的社会统一编号'))
      } else {
        this.is_error = true
        callback()
      }
    }
    return {
      loginForm: {
        username: '',
        password: '',
        value: ''
      },
      registerForm:{
        phone: '',
        validcode: '',
        newpwd: '',
        socialnums: '',
        contactperson: '',
        company: ''
      },
      loginRules: {
        username: [{ required: true, trigger: 'blur', validator: validateUsername }],
        password: [{ required: true, trigger: 'blur', validator: validatePass }]
      },
      registerRules: {
        phone: [{ required: true, trigger: 'blur', validator: validateNewUser }],
        newpwd: [{ required: true, trigger: 'blur', validator: validatePass }],
        socialnums: [{ required: true, trigger: 'blur', validator: validateSocialnums }]
      },
      loading: false,
      redirect: undefined,
      remember: false,
      codeMsg:"发送验证码",
      time: 60,
      options:[],
      retry:4,
      is_error:false
    }
  },
  watch: {
    $route: {
      handler: function(route) {
        this.redirect = route.query && route.query.redirect
      },
      immediate: true
    }
  },
  computed: {
    ...mapGetters(['logo', 'name'])
  },
  mounted() {
     this.$store.dispatch('getCompanyList')
    .then(res => {
      // console.log(res)
      let optionsArray = []
      for(let index in res){
        if(Number(index)>2){
          optionsArray.push(res[index])
        }
      }
      console.log(optionsArray)
      this.options = optionsArray
    })
    .catch(() => {})
  },
  methods: {
    handleLogin() {
      const _this = this
      Lockr.set('isLogin',1)
      this.$refs.loginForm.validate(valid => {
        if (this.isCompanyExsit() && this.isError() && valid) {
          this.loading = true
          this.$store
            .dispatch('Login', this.loginForm)
            .then(res => {
              this.loading = false
              this.$store.dispatch('SystemLogoAndName')
              Lockr.rm('isLogin')
              this.$router.push({ path: this.redirect || '/workbench/index' })
            })
            .catch((error) => {
              console.log(error)
              this.loading = false
              this.retry--
              if(error.code != 400){
                if(this.retry < 4 && this.retry > -1){
                  this.handleLogin()
                }else{
                  this.retry = 4
                  Lockr.rm('isLogin')
                  _this.$message({
                    message: 'request网络请求失败，请稍候再试',
                    type: 'error'
                  })
                }
              }
            })
        } else {
          return false
        }
      })
    },
    handleRegister() {
      const _this = this
      this.$refs.registerForm.validate(valid => {
        if (valid) {
          this.loading = true
          this.$store
            .dispatch('Register', this.registerForm)
            .then(res => {
              this.loading = false
              _this.$message({
                message: '用户注册成功',
                type: 'success'
              })
            })
            .catch(() => {
              this.loading = false
            })
        } else {
          return false
        }
      })
    },
    handleSend(){
      let tid = setInterval(() => {
        if( this.time > 0 ){
            this.time -= 1 
            this.codeMsg = `${this.time}s后重新发送`
        }else{
          this.time = 60
          this.codeMsg = "发送验证码"
          clearInterval(tid)
        }
      },1000)
      this.time -= 1 
      this.codeMsg = `${this.time}s后重新发送`
    },
    setDbCache() {
      console.log("Dbname:",this.loginForm.value)
      Lockr.set('Dbname',this.loginForm.value)
    },
    isCompanyExsit() {
      let _this = this
      if(!this.loginForm.value){
        if(/^(18888888888)|(18666666666)$/.test(this.loginForm.username)){
          return true
        }else{
          _this.$message({message: '请先选择公司',type: 'error'})
        }
        return false
      }else{
        return true
      }
    },
    isError(){
      let _this = this
      console.log(_this.is_error)
      if(!_this.is_error){
        _this.$message({message: '请按正确要求填写信息',type: 'error'})
        return false
      }else{
        return true
      }
    }
  }
}
</script>

<style lang="scss" scoped>
$dark_gray: #ccc;
$light_gray: #333;
$login_theme: #00aaee;

/deep/ input {
  border: 0 none;
  background-color: white;
  -webkit-appearance: none;
  &:-webkit-autofill {
    background-image: none;
    -webkit-box-shadow: 0 0 0 1000px white inset !important;
    -webkit-text-fill-color: $light_gray !important;
  }
  /*Chrome 下去除type ==  "number"  时 的右侧图标*/
  &::-webkit-outer-spin-button,
  &::-webkit-inner-spin-button{
      -webkit-appearance: none !important;
      margin: 0;
  }
  /*火狐 下去除type ==  "number"  时 的右侧图标*/
  &[type="number"]{-moz-appearance:textfield;}

  /*IE下去除 右边的×*/
  &::-ms-clear{display:none;}
}
/deep/ .el-select{
  width:100%;
  margin-bottom: 22px;
}
/deep/ .el-input__inner {
  height: 40px;
  padding: 0 12px;
  background-color: white;
  border: 0 none;
  border-bottom: 1px solid #e6e6e6 !important;
}
/deep/ .el-form-item__error {
  left: 12px;
}
/deep/ .el-input-group__append{
  background-color: #00aaee!important;
  span{
     color:#fff!important;
     opacity: 0.9;
       &:hover{
          opacity: 1;
       }
  }
}
.wrapper {
  position: relative;
  width: 100%;
  min-width: 1300px;
  display: flex;
  .left {
    width: 68%;
    .left-pic {
      width: 100%;
      height: 100%;
      background: url('../../assets/img/login/login_new.png') no-repeat center;
      background-size: cover;
    }
  }
  .right {
    position: relative;
    width: 32%;
    background-color: #fff;
    display: flex;
    align-items: center;
    flex-direction: column;
    padding-top: 6%;
    .title {
      font-size: 26px;
      color: $light_gray;
      margin: 0 auto 50px;
      text-align: center;
    }
    .el-form {
      width: 80%;
      margin: 0 auto;
      .submit-btn {
        width: 100%;
        line-height: 2;
        font-size: 16px;
        color: white;
        border-radius: 3px;
        background-color: $login_theme;
        display: block;
      }
      .el-button {
        border: 0 none;
      }
      .action-control {
        color: #999;
        /deep/ .el-checkbox {
          .el-checkbox__label {
            color: #999;
          }
          .el-checkbox__input.is-checked .el-checkbox__inner {
            background-color: $login_theme;
            border-color: $login_theme;
          }
        }

        .forget {
          cursor: pointer;
          float: right;
        }
      }
    }

    .register {
      width: 70%;
      padding-top: 30px;
      color: $light_gray;
      border-top: 1px solid #e6e6e6;
      text-align: center;
      margin-top: 28px;
      .register-btn {
        color: $login_theme;
        cursor: pointer;
      }
    }

    .copyright {
      width: 92%;
      position: absolute;
      bottom: 2%;
      color: #999;
      font-size: 12px;
      text-align: center;
      line-height: 1.5;
    }
  }

  .logo {
    position: absolute;
    left: 60px;
    top: 50px;
    width: 180px;
    height: 48px;
    z-index: 200;
  }
}
</style>
