module.exports = {
  proxy: {
        '/apis': {    //将www.exaple.com印射为/apis
            target: 'http://47.107.241.101/lycrm1.0/#/crm',  // 接口域名 
            //target: 'http://47.107.241.101/crm/#/crm',  // 接口域名 
            secure: false,  // 如果是https接口，需要配置这个参数
            changeOrigin: true,  //是否跨域
            pathRewrite: {
                '^/apis': ''   //需要rewrite的,
            }              
        }
  }
}