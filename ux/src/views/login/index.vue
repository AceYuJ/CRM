<template>
  <div class="wrapper">
    <div class="wrapper__container">
        <div class="wrapper__container__left">
           <div class="wrapper__container__left__logo"><div class="wrapper__container__left__logo__img"></div></div>
           <div class="wrapper__container__left__img"><div class="wrapper__container__left__img__pic"></div></div>
        </div>
        <div class="wrapper__container__right">
          <el-tabs tab-position="top" stretch>
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
                            placeholder="请输入用户名"
                            @keyup.enter.native="handleLogin" />
                </el-form-item>
                <el-form-item prop="password">
                  <el-input type="password"
                            v-model="loginForm.password"
                            name="password"
                            placeholder="请输入密码"
                            @keyup.enter.native="handleLogin" />
                </el-form-item>
                <el-form-item>
                  <el-button :loading="loading"
                            @click.native.prevent="handleLogin"
                            class="submit-btn login-btn">
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
                            placeholder="请输入手机号"
                            @keyup.enter.native="handleRegister" />
                </el-form-item>
                <el-form-item prop="validcode" class="item-msg">
                  <el-input type="number"
                            v-model="registerForm.validcode"
                            name="validcode"
                            placeholder="请输入短信验证码"
                            @keyup.enter.native="handleRegister" >
                  </el-input>
                  <el-button class="code-btn" size="medium" @click.stop="handleSend">{{ codeMsg }}</el-button>
                </el-form-item>
                <el-form-item prop="newpwd">
                  <el-input type="password"
                            v-model="registerForm.newpwd"
                            name="newpwd"
                            placeholder="请输入密码"
                            @keyup.enter.native="handleRegister" />
                </el-form-item>
                <el-form-item prop="socialnums">
                  <el-input type="text"
                            v-model="registerForm.socialnums"
                            name="socialnums"
                            placeholder="请输入社会统一编号"
                            @keyup.enter.native="handleRegister" />
                </el-form-item>
                <el-form-item prop="contactperson">
                  <el-input type="text"
                            v-model="registerForm.contactperson"
                            name="contactperson"
                            placeholder="请输入联系人"
                            @keyup.enter.native="handleRegister" />
                </el-form-item>
                <el-form-item prop="company">
                  <el-input type="text"
                            v-model="registerForm.company"
                            name="company"
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
        </div>
    </div>
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
      this.$refs.registerForm.validate(valid => {
        if (valid) {
          this.loading = true
          this.$store.dispatch('Register', this.registerForm).then(res => {
            this.loading = false
          }).catch(() => {
            this.loading = false
          })
        } else {
          return false
        }
      })
    },
    handleSend(){
      if(this.time == 60){
        if(!this.registerForm.phone){
          this.$message({
            message: '请先输入手机号',
            type: 'error'
          })
          return
        }
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
        this.loading = true
        this.$store.dispatch('ValidateCode', this.registerForm.phone)
        .then(res => {
          console.log(2)
          this.loading = false
          this.$message({
            message: '发送验证码成功',
            type: 'success'
          })
        })
        .catch(() => {
          this.loading = false
        })
      }else{
        this.$message({
          message: '请不要多次点击',
          type: 'error'
        })
      }
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

.wrapper{
  background: url(./../.././assets/img/loginBackground2.jpg) no-repeat center;
  background-size: 100% 100%; 
  width: 100%;
  position: fixed;
  top: 0;
  bottom: 0;
  left:0;
  right:0;

  .wrapper__container{
    background: url(./../.././assets/img/loginBgCard.png) no-repeat center;
    background-size: 100% 100%;
    min-width: 80%;
    max-width: 95%;
    height: 700px;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    display: flex;
    padding: 30px;
    @media screen and (max-height: 700px){
      min-width: 50%;
      height: 450px;
      padding-top: 15px;
    }
    @media screen and (max-width: 1200px){
      height: 450px;
    }
    @media screen and (max-width: 700px){
      min-width: 630px;
    }
    .wrapper__container__left{
      flex: 4;
      text-indent: 8rem;
      min-width: 332px;
      .wrapper__container__left__logo{
        width: 100%;
        .wrapper__container__left__logo__img {
          background: url(./../.././assets/img/loginLogo.jpg) no-repeat;
          background-size: 100% 100%;
          width: 38%;
          height: 6.5rem;
          margin: 0 auto;
          @media screen and (max-width:1200px){
            height: 6rem;
          }
        }
      }
      .wrapper__container__left__img{
          width: 100%;
          .wrapper__container__left__img__pic{
            background: url(./../.././assets/img/loginImg1.png) no-repeat;
            background-size: 100% 100%;
            width: 90%;
            height: 30rem;
            transform: scale(0.9);
            margin: 0 auto;
          }
      }
    }

    .wrapper__container__right{
      flex: 3;
      min-width: 273px;
      padding-top: 1rem;
      /deep/ .el-tabs{
        width:70%;
        .el-tabs__item:hover,.el-tabs__item.is-active,.el-tabs__item{
          color: #000;
          font-size: 1.3em;
          font-weight: bold;
        }
      }
      @media screen and (max-height: 700px){
        padding-top: 0;
        transform: scale(0.9);
      }
      @media screen and (max-width:1200px){
        padding-top: .5rem;
        transform: scale(0.92);
      }
    }

  }

}

/deep/ input {
  border: 0 none;
  border-radius: 5px; 
  background-color: rgb(238,242,244);
  text-indent: 1em;
  @media screen and (max-width: 1370px){
    text-indent: .5em;
  }
  -webkit-appearance: none;
  &:-webkit-autofill {
    background-image: none;
    -webkit-box-shadow: 0 0 0 1000px white inset !important;
    -webkit-text-fill-color: #ccc !important;
  }
  &::-webkit-input-placeholder{
    text-indent: 1em;
    @media screen and (max-width: 1370px){
      text-indent: .5em;
      font-size: 12px;
    }
    @media screen and (max-width: 1270px){
      text-indent: 0em;
    }
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
  margin: 22px 0;
}

/deep/ .el-button{
  width:100%;
  background: rgb(1,25,162);
  color:#fff;
  border-radius: 5px; 
  &.login-btn{
    margin-top: 22px;
  }
  &.code-btn{
    background: rgb(238,242,244);
    width:50%;
    margin-left: .5rem;
    height: 34px;
    margin-top: 2px;
    border-width: 0;
    color: #ccc;
  }
}

/deep/ .el-form-item__content {
  @media screen and (max-width:1200px){
    line-height: 32px;
  }
  @media screen and (max-height: 700px){
    line-height: 32px;
  }
}

/deep/ .item-msg > .el-form-item__content {
  display:flex
}

/deep/ .el-form-item__error {
  left: 12px;
}

</style>
