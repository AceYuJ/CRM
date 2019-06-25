import request from '@/utils/request'

export function login(username, password) {
  return request({
    url: 'admin/base/login',
    method: 'post',
    data: {
      username,
      password
    },
    headers:{
      "Type":"login",
      "Dbname":username
    }
  })
}

export function register(phone, validcode, newpwd, socialnums, contactperson, company) {
  return request({
    url: 'admin/base/register',
    method: 'post',
    data: {
      realname: contactperson,
      phone_code: validcode,
      username: phone,
      password: newpwd,
      company_code: socialnums,
      company_name: company
    },
    headers:{
      "Type":"register"
    }
  })
}

export function getInfo(token) {
  return request({
    url: '/user/info',
    method: 'get',
    params: { token }
  })
}

export function logout() {
  return request({
    url: 'admin/base/logout',
    method: 'post'
  })
}
