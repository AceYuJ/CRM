import axios from 'axios'
import {
  Message,
  MessageBox
} from 'element-ui'
import {
  removeAuth
} from '@/utils/auth'
import qs from 'qs'
import Lockr from 'lockr'
var showLoginMessageBox = false
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8'
axios.defaults.headers.post['Type'] = 'login'
Lockr.get('Dbname') ? axios.defaults.headers.post['Dbname'] = Lockr.get('Dbname') : ""
// 创建axios实例
// let hrefs = []
// if (window.location.href.indexOf("index.html") != -1) {
//   hrefs = window.location.href.split('index.html')
// } else {
//   hrefs = window.location.href.split('#')
// }
// let baseURL = hrefs.length > 0 ? hrefs[0] : window.location.href
// baseURL + 'index.php/' 默认请求地址
// process.env.BASE_API 自定义请求地址

window.BASE_URL = process.env.BASE_API

const service = axios.create({
  baseURL: window.BASE_URL, // api 的 base_url
  timeout: 10000 // 请求超时时间
})

//在main.js设置全局的请求次数，请求的间隙
axios.defaults.retry = 4;
axios.defaults.retryDelay = 1000;

// request拦截器
service.interceptors.request.use(
  config => {
    if (!config.headers['Content-Type'] || config.headers['Content-Type'].indexOf('multipart/form-data') == -1) {
      config.data = qs.stringify(config.data)
    }
    return config
  }
)

// response 拦截器
service.interceptors.response.use(
  response => {
    /**
     * code为非200时抛错
     */
    const res = response.data
    if (response.status === 200 && response.config.responseType === 'blob') { // 文件类型特殊处理
      return response
    } else if (res.code !== 200) {
      // 101	登录已失效 102	没有权限 103	账号已被删除或禁用
      if (res.code === 101) {
        if (!showLoginMessageBox) {
          showLoginMessageBox = true
          MessageBox.confirm(
            '你已被登出，请重新登录',
            '确定登出', {
              showCancelButton: false,
              showClose: false,
              confirmButtonText: '重新登录',
              type: 'warning'
            }
          ).then(() => {
            showLoginMessageBox = false
            removeAuth().then(() => {
              location.reload() // 为了重新实例化vue-router对象 避免bug
            }).catch(() => {
              location.reload()
            })
          })
        }
      } else if (res.code === 402) {
        if (res.error && Object.prototype.toString.call(res.error) === '[object Array]') {
          res.error = res.error.reduce(function (prev, cur, index, array) {
            return prev + "\r\n" + cur
          })
        }
        Message({
          showClose: true,
          duration: 0,
          customClass: 'el-close-message',
          message: res.error,
          type: 'error'
        })
      } else {
        if (res.error) {
          Message({
            message: res.error,
            type: 'error'
          })
        }
      }
      return Promise.reject(res)
    } else {
      return res
    }
  },
  err => {
    if(!Lockr.get('isLogin')){
      Message({
        message: 'request网络请求失败，请稍候再试',
        type: 'error'
      })
    }
    let config = err.config;
    console.log(config)
    // // If config does not exist or the retry option is not set, reject
    // if(!config || !config.retry) return Promise.reject(err);
    
    // // Set the variable for keeping track of the retry count
    // config.__retryCount = config.__retryCount || 0;
    
    // // Check if we've maxed out the total number of retries
    // if(config.__retryCount >= config.retry) {
    //     // Reject with the error
    //     console.log(err)
    //     Message({
    //       message: 'request网络请求失败，请稍候再试',
    //       type: 'error'
    //     })
    //     return Promise.reject(error)
    // }
    
    // // Increase the retry count
    // config.__retryCount += 1;
    
    // // Create new promise to handle exponential backoff
    // let backoff = new Promise(function(resolve) {
    //     setTimeout(function() {
    //         resolve();
    //     }, config.retryDelay || 1);
    // });
    
    // // Return the promise in which recalls axios to retry the request
    // return backoff.then(function() {
    //     return axios(config);
    // });

  }
)

export default service
