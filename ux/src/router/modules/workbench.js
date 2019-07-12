/** 项目管理路由 */
import Layout from '@/views/layout/workbenchLayout'

const workbenchRouter = {
  path: '/workbench',
  component: Layout,
  redirect: '/workbench/index',
  name: 'workbench',
  hidden: true,
  meta: {
    title: '工作台'
  },
  children: [{
      path: 'index',
      component: () => import('@/views/OAManagement/workbench/index'),
      meta: {
        title: '工作台',
        icon: 'webicon01'
      }
    },
    {
      path: 'schedule',
      component: () => import('@/views/OAManagement/schedule/index'),
      meta: {
        title: '日程',
        icon: 'richeng'
      }
    },
    {
      path: 'task',
      component: () => import('@/views/OAManagement/task/index'),
      meta: {
        title: '任务',
        icon: 'renwu'
      }
    },
    {
      path: 'notice',
      component: () => import('@/views/OAManagement/notice/index'),
      meta: {
        title: '公告',
        icon: 'gonggaoxianxing'
      }
    },
    {
      path: 'journal',
      component: () => import('@/views/OAManagement/journal/index'),
      meta: {
        title: '日志',
        icon: 'rizhi'
      }
    },
    {
      path: 'examine',
      component: () => import('@/views/OAManagement/examine/index'),
      meta: {
        title: '审批',
        icon: 'iconzhengli_shenpi'
      }
    },
    {
      path: 'notice-new',
      component: () => import('@/views/OAManagement/notice/newDialog'),
      hidden: true
    },
    {
      path: 'schedule-new',
      component: () => import('@/views/OAManagement/schedule/components/createSchedule'),
      hidden: true
    },
    // {
    //   path: 'journal-new',
    //   component: () => import('@/views/OAManagement/journal/newDialog')
    // },
    // 通讯录
    {
      path: 'address-book',
      component: () => import('@/views/OAManagement/addressBook/index'),
      meta: {
        title: '通讯录',
        icon: 'cedaohang-tongxunlu'
      }
    }
  ]
}

export default workbenchRouter
