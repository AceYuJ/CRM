/** 客户管理路由 */
import Layout from '@/views/layout/customerLayout'

const customerRouter = {
  path: '/crm',
  component: Layout,
  redirect: '/crm/workbench',
  name: 'crm',
  hidden: true,
  meta: {
    requiresAuth: true,
    title: '客户管理',
    index: 0,
    type: 'crm'
  },
  children: [{
      path: 'workbench', // 工作台
      component: () => import('@/views/customermanagement/workbench/workbench'),
      meta: {
        requiresAuth: false,
        title: '仪表盘',
        icon: 'yibiaopan'
      }
    },
    {
      path: 'message', // 待办事项
      component: () => import('@/views/customermanagement/message/Message'),
      meta: {
        requiresAuth: false,
        title: '待办事项',
        icon: 'BAI-lingdang',
        num: 0
      }
    },
    {
      path: 'clue', // 线索列表
      component: () => import('@/views/customermanagement/clue/ClueIndex'),
      meta: {
        requiresAuth: true,
        title: '线索',
        icon: 'hailiangxiansuo',
        index: 1,
        type: 'crm',
        subType: 'leads'
      }
    },
    {
      path: 'customer', // 客户列表
      component: () => import('@/views/customermanagement/customer/CustomerIndex'),
      meta: {
        requiresAuth: true,
        title: '客户',
        icon: 'kehu1',
        index: 1,
        type: 'crm',
        subType: 'customer'
      }
    },
    {
      path: 'contacts', // 联系人列表
      component: () => import('@/views/customermanagement/contacts/ContactsIndex'),
      meta: {
        requiresAuth: true,
        title: '联系人',
        icon: 'lianxirenqunzu',
        index: 1,
        type: 'crm',
        subType: 'contacts'
      }
    },
    {
      path: 'seas', // 公海列表
      component: () => import('@/views/customermanagement/seas/SeasIndex'),
      meta: {
        requiresAuth: true,
        title: '学员池',
        icon: 'gonghaiguanli',
        index: 2,
        type: 'crm',
        subType: ['customer', 'pool']
      }
    },
    {
      path: 'business', // 商机列表
      name: 'business',
      component: () => import('@/views/customermanagement/business/BusinessIndex'),
      meta: {
        requiresAuth: true,
        title: '课程表',
        icon: 'shangji',
        index: 1,
        type: 'crm',
        subType: 'business'
      }
    },
    {
      path: 'contract', // 合同列表
      component: () => import('@/views/customermanagement/contract/ContractIndex'),
      meta: {
        requiresAuth: true,
        title: '合同',
        icon: 'hetongxinxi',
        index: 1,
        type: 'crm',
        subType: 'contract'
      }
    },
    {
      path: 'money', // 回款列表
      component: () => import('@/views/customermanagement/money/MoneyIndex'),
      meta: {
        requiresAuth: true,
        title: '回款',
        icon: 'huikuantixing',
        index: 1,
        type: 'crm',
        subType: 'receivables'
      }
    },
    {
      path: 'product', // 产品列表
      component: () => import('@/views/customermanagement/product/ProductIndex'),
      meta: {
        requiresAuth: true,
        title: '产品',
        icon: 'product',
        index: 1,
        type: 'crm',
        subType: 'product'
      }
    }
  ]
}

export default customerRouter
