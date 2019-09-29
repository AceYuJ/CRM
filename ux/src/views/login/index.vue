<template>
  <div class="wrapper">
    <div class="wrapper__container">
        <div class="wrapper__container__left">
           <div class="wrapper__container__left__logo"><div class="wrapper__container__left__logo__img"></div></div>
           <div class="wrapper__container__left__img"></div>
        </div>
        <div class="wrapper__container__right">
              <h2>用户登录</h2>
              <el-form ref="loginForm"
                :model="loginForm"
                :rules="loginRules"
                class="login-form"
                auto-complete="on"
                label-position="left"
                status-icon>
                <el-form-item prop="username">
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
    return {
      loginForm: {
        username: '',
        password: ''
      },
      loginRules: {
        username: [{ required: true, trigger: 'blur', validator: validateUsername }],
        password: [{ required: true, trigger: 'blur', validator: validatePass }]
      },
      loading: false,
      redirect: undefined,
      remember: false,
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
  methods: {
    handleLogin() {
      const _this = this
      Lockr.set('isLogin',1)
      this.$refs.loginForm.validate(valid => {
        if (this.isError() && valid) {
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
    min-width: 60%;
    max-width: 80%;
    height: 550px;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    display: flex;
    padding: 30px;
    text-align: center; /**/
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
      flex: 3;
      text-indent: 8rem;
      min-width: 332px;
      .wrapper__container__left__logo{
        width: 100%;
        .wrapper__container__left__logo__img {
          background: url(./../.././assets/img/loginLogo.jpg) no-repeat;
          background-size: 100% 100%;
          width: 50%;
          height: 6.5rem;
          margin: 0 auto;
          @media screen and (max-width:1200px){
            height: 6rem;
          }
        }
      }
      .wrapper__container__left__img{
        background: url(./../.././assets/img/loginImg1.png) no-repeat;
        background-size: 100% 100%;
        width: 100%;
        height: 80%;
        transform: scale(0.9);
      }
    }

    .wrapper__container__right{
      flex: 2;
      min-width: 273px;
      padding-top: 3rem;
      margin-right: 4rem; /**/
      h2{
        margin-bottom: 3rem;
      }
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
