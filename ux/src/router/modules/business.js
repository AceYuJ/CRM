/** 项目管理路由 */
import Layout from '@/views/layout/businessLayout'

// 员工客户分析
const customerAuth = {
  index: 1,
  type: 'bi',
  subType: 'customer'
}

const customerRouter = {
  path: 'customer',
  meta: {
    icon: 'yuangongguanli-',
    title: '员工客户分析',
    ...customerAuth
  },
  hidden: false,
  children: [{
    path: 'customerTotal', // 客户总量分析
    component: () => import('@/views/businessIntelligence/customer/CustomerTotalStatistics'),
    meta: {
      requiresAuth: true,
      title: '客户总量分析',
      ...customerAuth
    }
  }, {
    path: 'customerRecord', // 客户跟进次数分析
    component: () => import('@/views/businessIntelligence/customer/CustomerRecordStatistics'),
    meta: {
      requiresAuth: true,
      title: '客户跟进次数分析',
      ...customerAuth
    }
  }, {
    path: 'customerRecordmode', // 客户跟进方式分析
    component: () => import('@/views/businessIntelligence/customer/CustomerRecordModeStatistics'),
    meta: {
      requiresAuth: true,
      title: '客户跟进方式分析',
      ...customerAuth
    }
  }, {
    path: 'customerConversion', // 客户转化率分析
    component: () => import('@/views/businessIntelligence/customer/CustomerConversionStatistics'),
    meta: {
      requiresAuth: true,
      title: '客户转化率分析',
      ...customerAuth
    }
  }, {
    path: 'customerPool', // 公海客户分析
    component: () => import('@/views/businessIntelligence/customer/CustomerPoolStatistics'),
    meta: {
      requiresAuth: true,
      title: '公海客户分析',
      ...customerAuth
    }
  }, {
    path: 'customerCycle', // 成交周期分析
    component: () => import('@/views/businessIntelligence/customer/CustomerCycleStatistics'),
    meta: {
      requiresAuth: true,
      title: '成交周期分析',
      ...customerAuth
    }
  }]
}

// 销售漏斗分析
const businessAuth = {
  index: 1,
  type: 'bi',
  subType: 'business'
}

const businessRouter = {
  path: 'business',
  meta: {
    icon: 'iconset0160',
    title: '销售漏斗分析',
    ...businessAuth
  },
  hidden: false,
  children: [{
    path: 'funnelstatistics', // 销售漏斗
    component: () => import('@/views/businessIntelligence/business/FunnelStatistics'),
    meta: {
      requiresAuth: true,
      title: '销售漏斗',
      ...businessAuth
    }
  }, {
    path: 'businessTrend', // 新增商机分析
    component: () => import('@/views/businessIntelligence/business/BusinessTrendStatistics'),
    meta: {
      requiresAuth: true,
      title: '新增商机分析',
      ...businessAuth
    }
  }, {
    path: 'businessWin', // 商机转化率分析
    component: () => import('@/views/businessIntelligence/business/BusinessWinStatistics'),
    meta: {
      requiresAuth: true,
      title: '商机转化率分析',
      ...businessAuth
    }
  }]
}

// 员工业绩分析
const achievementAuth = {
  index: 1,
  type: 'bi',
  subType: 'contract'
}

const achievementRouter = {
  path: 'achievement',
  meta: {
    icon: 'yejiweijihuo-',
    title: '员工业绩分析',
    ...achievementAuth
  },
  hidden: false,
  children: [{
    path: 'achievementCount', // 合同数量分析
    component: () => import('@/views/businessIntelligence/achievement/AchievementCountStatistics'),
    meta: {
      requiresAuth: true,
      title: '合同数量分析',
      ...achievementAuth
    }
  }, {
    path: 'achievementMoney', // 合同金额分析
    component: () => import('@/views/businessIntelligence/achievement/AchievementMoneyStatistics'),
    meta: {
      requiresAuth: true,
      title: '合同金额分析',
      ...achievementAuth
    }
  }, {
    path: 'achievementBack', // 回款金额分析
    component: () => import('@/views/businessIntelligence/achievement/AchievementBackStatistics'),
    meta: {
      requiresAuth: true,
      title: '回款金额分析',
      ...achievementAuth
    }
  }, {
    path: 'achievementSummary', // 合同汇总表
    component: () => import('@/views/businessIntelligence/achievement/AchievementSummaryStatistics'),
    meta: {
      requiresAuth: true,
      title: '合同汇总表',
      ...achievementAuth
    }
  }]
}

// 客户画像分析
const portraitAuth = {
  index: 1,
  type: 'bi',
  subType: 'portrait'
}

const portrayalRouter = {
  path: 'portrayal',
  meta: {
    icon: 'kehu',
    title: '客户画像分析',
    ...portraitAuth
  },
  hidden: false,
  children: [{
    path: 'portrayalAddress', // 城市分布分析
    component: () => import('@/views/businessIntelligence/customerPortrayal/CustomerAddressStatistics'),
    meta: {
      requiresAuth: true,
      title: '城市分布分析',
      ...portraitAuth
    }
  }, {
    path: 'portrayalIndustry/:type', // 客户行业分析
    component: () => import('@/views/businessIntelligence/customerPortrayal/CustomerPortrayalStatistics'),
    meta: {
      requiresAuth: true,
      title: '客户画像分析',
      ...portraitAuth
    }
  }]
}

const portrayalRouterMenu = {
  path: 'portrayal',
  meta: {
    icon: 'kehu',
    title: '客户画像分析',
    ...portraitAuth
  },
  hidden: false,
  children: [{
    path: 'portrayalAddress', // 城市分布分析
    component: () => import('@/views/businessIntelligence/customerPortrayal/CustomerAddressStatistics'),
    meta: {
      requiresAuth: true,
      title: '城市分布分析',
      ...portraitAuth
    }
  }, {
    path: 'portrayalIndustry/industry', // 客户行业分析
    component: () => import('@/views/businessIntelligence/customerPortrayal/CustomerPortrayalStatistics'),
    meta: {
      requiresAuth: true,
      title: '客户行业分析',
      ...portraitAuth
    }
  }, {
    path: 'portrayalIndustry/level', // 客户级别分析
    component: () => import('@/views/businessIntelligence/customerPortrayal/CustomerPortrayalStatistics'),
    meta: {
      requiresAuth: true,
      title: '客户级别分析',
      ...portraitAuth
    }
  }, {
    path: 'portrayalIndustry/source', // 客户来源分析
    component: () => import('@/views/businessIntelligence/customerPortrayal/CustomerPortrayalStatistics'),
    meta: {
      requiresAuth: true,
      title: '客户来源分析',
      ...portraitAuth
    }
  }]
}

// 产品分析
const productAuth = {
  index: 1,
  type: 'bi',
  subType: 'product'
}

const productRouter = {
  path: 'product',
  meta: {
    icon: 'product',
    title: '产品分析',
    ...productAuth
  },
  hidden: false,
  children: [{
    path: 'productstatistics', // 产品销售情况统计
    component: () => import('@/views/businessIntelligence/product/ProductStatistics'),
    meta: {
      requiresAuth: true,
      title: '产品销售情况统计',
      icon: 'productstatistics',
      ...productAuth
    }
  }, {
    path: 'productCategory', // 产品分类销量分析
    component: () => import('@/views/businessIntelligence/product/ProductCategoryStatistics'),
    meta: {
      requiresAuth: true,
      title: '产品分类销量分析',
      icon: 'productstatistics',
      ...productAuth
    }
  }]
}

// 排行榜
const rankingAuth = {
  index: 1,
  type: 'bi',
  subType: 'ranking'
}

const rankingRouter = {
  path: 'ranking',
  meta: {
    icon: 'paihangbang',
    title: '排行榜',
    ...rankingAuth
  },
  hidden: false,
  children: [{
    path: 'rankingContract', // 合同金额排行
    component: () => import('@/views/businessIntelligence/ranking/RankingContractStatistics'),
    meta: {
      requiresAuth: true,
      title: '合同金额排行',
      icon: 'productstatistics',
      ...rankingAuth
    }
  }, {
    path: 'rankingReceivables', // 回款金额排行
    component: () => import('@/views/businessIntelligence/ranking/RankingReceivablesStatistics'),
    meta: {
      requiresAuth: true,
      title: '回款金额排行',
      icon: 'productstatistics',
      ...rankingAuth
    }
  }, {
    path: 'rankingSigning', // 签约合同排行
    component: () => import('@/views/businessIntelligence/ranking/RankingSigningStatistics'),
    meta: {
      requiresAuth: true,
      title: '签约合同排行',
      icon: 'productstatistics',
      ...rankingAuth
    }
  }, {
    path: 'rankingProduct', // 产品销量排行
    component: () => import('@/views/businessIntelligence/ranking/RankingProductStatistics'),
    meta: {
      requiresAuth: true,
      title: '产品销量排行',
      icon: 'productstatistics',
      ...rankingAuth
    }
  }, {
    path: 'rankingAddCustomer', // 新增客户数排行
    component: () => import('@/views/businessIntelligence/ranking/RankingAddCustomerStatistics'),
    meta: {
      requiresAuth: true,
      title: '新增客户数排行',
      icon: 'productstatistics',
      ...rankingAuth
    }
  }, {
    path: 'rankingAddContacts', // 新增联系人数排行
    component: () => import('@/views/businessIntelligence/ranking/RankingAddContactsStatistics'),
    meta: {
      requiresAuth: true,
      title: '新增联系人数排行',
      icon: 'productstatistics',
      ...rankingAuth
    }
  }, {
    path: 'rankingRecordNun', // 跟进次数排行
    component: () => import('@/views/businessIntelligence/ranking/RankingRecordNunStatistics'),
    meta: {
      requiresAuth: true,
      title: '跟进次数排行',
      icon: 'productstatistics',
      ...rankingAuth
    }
  }, {
    path: 'rankingRecordCustomer', // 跟进客户数排行
    component: () => import('@/views/businessIntelligence/ranking/RankingRecordCustomerStatistics'),
    meta: {
      requiresAuth: true,
      title: '跟进客户数排行',
      icon: 'productstatistics',
      ...rankingAuth
    }
  }, {
    path: 'rankingExamine', // 出差次数排行
    component: () => import('@/views/businessIntelligence/ranking/RankingExamineStatistics'),
    meta: {
      requiresAuth: true,
      title: '出差次数排行',
      icon: 'productstatistics',
      ...rankingAuth
    }
  }]
}



const taskCompleteRouteItem = {
  path: 'taskCompletestatistics', // 业绩目标完成情况
  component: () => import('@/views/businessIntelligence/TaskCompleteStatistics'),
  meta: {
    requiresAuth: true,
    title: '业绩目标完成情况',
    icon: 'mubiao',
    index: 1,
    type: 'bi',
    subType: 'achievement'
  }
}


export const biRouter = {
  path: '/bi',
  component: Layout,
  redirect: '/bi/customerTotal',
  name: 'bi',
  hidden: true,
  meta: {
    requiresAuth: true,
    title: '数据分析',
    index: 0,
    type: 'bi'
  },
  children: [
    ...customerRouter.children,
    ...businessRouter.children,
    ...achievementRouter.children,
    ...portrayalRouter.children,
    ...productRouter.children,
    ...rankingRouter.children,
    taskCompleteRouteItem
  ]
}

export const biRouterMenu = [
  customerRouter,
  businessRouter,
  achievementRouter,
  portrayalRouterMenu,
  productRouter,
  rankingRouter,
  taskCompleteRouteItem
]
