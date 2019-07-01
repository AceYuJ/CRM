import axios from 'axios'
import cache from './cache'
import Lockr from 'lockr'
import store from '@/store'

/** 移除授权信息 */
export function removeAuth() {
  return new Promise((resolve, reject) => {
    cache.rmAxiosCache()
    store.commit('SET_ALLAUTH', null)
    delete axios.defaults.headers['authKey']
    delete axios.defaults.headers['sessionId']
    resolve(true)
  })
}

/** 注入授权信息和数据库名称 */
export function addAuth(authKey, sessionId, dbname) {
  return new Promise((resolve, reject) => {
    axios.defaults.headers.authKey = authKey
    axios.defaults.headers.sessionId = sessionId
    axios.defaults.headers.Dbname = dbname
    resolve(true)
  })
}

/** 获取授权信息 */
export function getAuth() {
  /** 全局路由触发这个方法  如果有缓存暂时在这里交与 */
  if (Lockr.get('authKey') && !axios.defaults.headers.authKey) {
    cache.updateAxiosCache()
  }

  if (axios.defaults.headers.authKey || axios.defaults.headers.sessionId) {
    return true
  }
  return false
}
