import {
  crmMessagNumAPI
} from '@/api/customermanagement/message'

/**
 * 消息记录
 */
const app = {
  state: {
    // 待办事项消息
    messageNum: {
      todayCustomer: 0,
      followLeads: 0,
      followCustomer: 0,
      checkContract: 0,
      checkReceivables: 0,
      remindReceivablesPlan: 0,
      endContract: 0,
      totalNum: 0
    },
    change:false,
    currentType:""
  },

  mutations: {
    /**
     * 更改待办事项
     */
    SET_MESSAGENUM: (state, messageNum) => {
      let totalNum = 0
      for (let key in messageNum) {
        if (key != 'totalNum') {
          totalNum += (messageNum[key] || 0)
        }
      }
      messageNum.totalNum = totalNum
      state.messageNum = messageNum
    },
    SET_CHANGE_TRUE(state){
      state.change=true
    },
    SET_CHANGE_FALSE(state){
      state.change=false
    },
    SET_TYPE(state,type){
      state.currentType=type
    }
  },

  actions: {
    // 登录
    GetMessageNum({
      state,
      commit
    }) {
      return new Promise((resolve, reject) => {
        crmMessagNumAPI()
          .then(response => {
            commit('SET_MESSAGENUM', response.data)
            commit('SET_CRMROUTERSNUM', state.messageNum.totalNum)
            resolve(response)
          })
          .catch(error => {
            reject(error)
          })
      })
    },
    setChangeTrue(context){
      context.commit("SET_CHANGE_TRUE")
    },
    setChangeFalse(context){
      context.commit("SET_CHANGE_FALSE")
    }

  }
}

export default app
