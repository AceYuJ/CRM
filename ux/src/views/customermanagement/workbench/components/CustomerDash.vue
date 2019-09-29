<template>
  <div style="margin-bottom:20px;min-width: 800px;" class="container">
    <flexbox class="mark-header"><span>销售简报</span></flexbox>
    <flexbox :gutter="0"
             wrap="wrap">
             <flexbox-item v-loading="jianbaoLoading"
                    :span="1"
                    style="padding-right:10px;padding-bottom:20px;">
              <div class="card jianbao">
                <flexbox :gutter="0"
                        wrap="wrap">
                  <flexbox-item :span="1/7"
                                class="jianbao-icon-container"
                                v-for="(item, index) in jianbaoItems"
                                :key="index">
                    <flexbox class="jianbao-icon-content">
                      <img class="jianbao-icon"
                          :src="item.icon" />
                      <div class="jianbao-div">
                        <div class="jianbao-value">{{item.value}}</div>
                        <div class="jianbao-title">{{item.title}}</div>
                      </div>
                    </flexbox>
                  </flexbox-item>
                </flexbox>

              </div>
            </flexbox-item>
    </flexbox>   

    <flexbox :gutter="0"
             wrap="wrap">   
      <flexbox-item v-loading="gaugeLoading"
                    :span="1/3"
                    style="padding-right:10px;padding-bottom:20px;">
        <div class="card mark">
          <div class="mark-target">
            <flexbox class="mark-header">业绩指标</flexbox>
            <div class="value">{{gaugeData.achievementMoney}}元</div>
          </div>
          <el-select style="width: 100px;position:absolute;right:20px;top:20px;z-index:1000"
                      v-model="gaugeSelectValue"
                      placeholder="请选择"
                      @change="getCrmIndexAchievementData">
            <el-option v-for="item in gaugeOptions"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
            </el-option>
          </el-select>
          <div class="mark-gauge"
               id="gaugemain"></div>
        </div>
        <flexbox :gutter="0"
             wrap="wrap">
          <flexbox-item v-loading="gaugeLoading"
                      :span="1/2"
                      style="padding-right:10px;">
            <div class="card contract" style="margin-top:20px;">
              <div class="card-top">
                <div class="card-left">
                  <div>本月合同金额</div>
                  <div>{{currentTrend.totlaContractMoney}}元</div>
                </div>
                <div class="card-right">
                  {{contractPercent}}
                </div>
              </div>
              <div class="card-bottom card-bar">
                <div class="mark-gauge-bar"
                  id="gaugeContract"></div>
              </div>
            </div>
          </flexbox-item>
          <flexbox-item v-loading="gaugeLoading"
                      :span="1/2"
                      style="padding-left:10px;">
            <div class="card receive" style="margin-top:20px;">
              <div class="card-top">
                <div class="card-left">
                  <div>本月回款金额</div>
                  <div>{{currentTrend.totlaReceivablesMoney}}元</div>
                </div>
                <div class="card-right">
                  {{receivePercent}}
                </div>
              </div>
              <div class="card-bottom">
                <div class="mark-gauge-line"
                  id="gaugeReceive"></div>
              </div>
            </div>
          </flexbox-item>
        </flexbox>
      </flexbox-item>
      <flexbox-item v-loading="trendLoading"
                    :span="2/3"
                    style="padding:0 10px;padding-bottom:20px;">
        <div class="card trend">
          <flexbox class="mark-header">销售趋势</flexbox>
          <div class="mark-gauge-main"
              id="gaugeTrend"></div>
        </div>
      </flexbox-item>
    </flexbox>
    <flexbox :gutter="0"
             wrap="wrap">
      <flexbox-item v-loading="funnelLoading"
                      :span="1/2"
                      style="padding-right:35px;padding-bottom:20px;">
          <div class="card funnel-container">
              <div class="funnel-left">
                <flexbox class="mark-header">成交概况</flexbox>
                <div class="funnel-left-bottom">
                  <div>
                    <div class="funnel-left-value">{{funnelData.sum_ying}}</div>
                    <div>赢 单</div>
                  </div>
                  <div>
                    <div class="funnel-left-value">{{funnelData.sum_shu}}</div>
                    <div>输 单</div>
                  </div>
                </div>
              </div>
              <div class="funnel-right">
                <flexbox class="mark-header funnel-mark">赢单率</flexbox>
                <div class="funnel-pie"
                  id="funnelGain"></div>
              </div>
          </div>
      </flexbox-item>
      <flexbox-item v-loading="funnelLoading"
                      :span="1/2"
                      style="padding:0 10px 20px 0;">
          <div class="card funnel-container loudou">
              <div class="funnel-left">
                <flexbox class="mark-header">销售漏斗</flexbox>
                <div class="funnel-left-bottom funnel-other">
                    <canvas class="funnel-canvas-validate" :width="width" :height="height" id="funnel_validate" style="margin-left:50px;"> </canvas>
                    <canvas class="funnel-canvas-need" width="120" height="150" id="funnel_need"> </canvas>
                    <canvas class="funnel-canvas-plan" width="120" height="150" id="funnel_plan"> </canvas>
                    <canvas class="funnel-canvas-negotiation" width="120" height="150" id="funnel_negotiation"> </canvas>
                </div>
              </div>
              <div class="funnel-right">
                <flexbox class="mark-header funnel-mark">商机</flexbox>
                <div class="funnel-pie-other"
                  id="funnelPie"></div>
                <div class="funnel-text">
                  <div>商机数量：{{negotiationNums}}</div>
                  <div>预测获利金额：{{profit}}</div>
                </div>
              </div>
          </div>
      </flexbox-item>
    </flexbox>
  </div>
</template>

<script>
import echarts from 'echarts'
import {
  crmIndexIndex,
  crmIndexAchievementData,
  crmIndexFunnel,
  crmIndexSaletrend
} from '@/api/customermanagement/workbench'
import { crmBusinessStatusList, crmBusinessIndex } from '@/api/customermanagement/business'
import { formatTimeToTimestamp, getCurrentMounthDaysArray, toPercent, angleToRadian } from '@/utils'
import moment from 'moment'

export default {
  /** 客户管理下的工作台-仪表盘 */
  name: 'customer-dash',
  data() {
    return {
      width:120,
      height:150,
      /** 销售简报 */
      jianbaoLoading: false,
      jianbaoItems: [
        {
          title: '新增客户',
          icon: require('@/assets/img/icon_user.png'),
          field: 'customerNum',
          value: 0
        },
        {
          title: '新增联系人',
          icon: require('@/assets/img/icon_liaison.png'),
          field: 'contactsNum',
          value: 0
        },
        {
          title: '新增商机',
          icon: require('@/assets/img/icon_business.png'),
          field: 'businessNum',
          value: 0
        },
        {
          title: '阶段变化的商机',
          icon: require('@/assets/img/icon_changing_business.png'),
          field: 'businessStatusNum',
          value: 0
        },
        {
          title: '新增合同',
          icon: require('@/assets/img/icon_contract.png'),
          field: 'contractNum',
          value: 0
        },
        {
          title: '新增跟进记录',
          icon: require('@/assets/img/icon_followup.png'),
          field: 'recordNum',
          value: 0
        },
        {
          title: '新增回款',
          icon: require('@/assets/img/icon_return.png'),
          field: 'receivablesNum',
          value: 0
        }
      ],
      /** 业绩指标 */
      gaugeLoading: false,
      gaugeSelectValue: 2,
      gaugeData: { contractMoney: 0, receivablesMoney: 0, achievementMoney: 0 },
      curtrendLoading: false,
      currentTrend: { totlaContractMoney: 0, totlaReceivablesMoney: 0 },
      currentAchievement: { contractAchievement: 0, receivablesAchievement: 0 },
      /** 销售漏斗 */
      /** 商机状态 */
      funnelLoading: false,
      businessOptions: [],
      businessStatusValue: '',
      funnelData: { sum_ying: 0, sum_shu: 0 },
      /** 销售趋势 */
      trendLoading: false,
      trendData: { totlaContractMoney: 0, totlaReceivablesMoney: 0 },
      gaugeChart: null, // 指标图
      gaugeOption: null,
      contractChart: null,  //本月合同柱状统计图
      contractOption: null, 
      receiveChart: null,  //本月回款折现统计图
      receiveOption: null, 
      gainLoading: false,
      gainChart: null, //赢单率指标图
      gainOption: null,
      pieChart: null,  //商机指标图
      pieOption: null,
      funnelChart: null, // 漏斗图
      funnelOption: null,
      axisChart: null, // 柱状图
      axisOption: null,
      negotiationNums: 0,
      profit: 0,
      // funnelDom: null
    }
  },
  watch: {
    data: function(val) {
      this.getCrmIndexIndex()
      this.getBusinessStatusList()
      this.getCrmIndexAchievementData()
      this.getCurrentMonthSaletrend()
      this.getCrmIndexSaletrend()
      this.getGainData()
    }
  },
  props: {
    // 获取数据的员工 部门条件
    data: Object
  },
  computed: {
    /** 简报信息 */
    gaugeOptions() {
      return [{ label: '回款金额', value: 2 }, { label: '合同金额', value: 1 }]
    },
    contractPercent(){
      return parseFloat(this.currentAchievement.contractAchievement) > 0 ? toPercent(parseFloat(this.currentTrend.totlaContractMoney) / parseFloat(this.currentAchievement.contractAchievement).toFixed(1)) : '100%'
    },
    receivePercent(){
      return parseFloat(this.currentAchievement.receivablesAchievement) > 0 ? toPercent(parseFloat(this.currentTrend.totlaReceivablesMoney) / parseFloat(this.currentAchievement.receivablesAchievement).toFixed(1)) : '100%'
    }
  },
  mounted() {
    this.initGauge()
    this.initFunnel()
    this.initAxis()
    this.initGain()
    const _this=this
    //todo：监视窗口变化，改变canvas值，重新绘画
    window.onresize=function(){
      var dom=document.getElementsByClassName('funnel-other')[0]
       _this.width=dom.scrollWidth
      console.log(_this.width)
      _this.height=dom.width
    }
    if (this.data.users.length > 0 || this.data.users.strucs > 0) {
      this.getCrmIndexIndex()
      this.getBusinessStatusList()
      this.getCrmIndexAchievementData()
      this.getCurrentMonthSaletrend()
      this.getCrmIndexSaletrend()
      this.getGainData()
    }
  },
  // beforeDestroy() {
  //   this.funnelDom.removeEventListener('mouseover')
  // },
  methods: {
    // 销售简报
    getCrmIndexIndex() {
      this.jianbaoLoading = true
      var params = this.getBaseParams()
      crmIndexIndex(params)
        .then(res => {
          for (let index = 0; index < this.jianbaoItems.length; index++) {
            const element = this.jianbaoItems[index]
            element.value = res.data[element.field]
              ? res.data[element.field]
              : 0
          }
          this.jianbaoLoading = false
        })
        .catch(() => {
          this.jianbaoLoading = false
        })
    },
    getBaseParams() {
      let params = {
        user_id: this.data.users.map(function(item, index, array) {
          return item.id
        }),
        structure_id: this.data.strucs.map(function(item, index, array) {
          return item.id
        })
      }

      if (this.data.timeTypeValue.type) {
        if (this.data.timeTypeValue.type == 'custom') {
          params.start_time = this.data.timeTypeValue.startTime
          params.end_time = this.data.timeTypeValue.endTime
        } else {
          params.type = this.data.timeTypeValue.value || ''
        }
      }
      return params
    },
    /** 指标、本月金额 */
    getCrmIndexAchievementData() {
      this.gaugeLoading = true
      var params = this.getBaseParams()
      params.status = this.gaugeSelectValue
      crmIndexAchievementData(params)
        .then(res => {
          this.gaugeData = res.data
          this.currentAchievement.receivablesAchievement !== 0 ? this.currentAchievement.receivablesAchievement = this.gaugeData.achievementMoney : ''
          this.gaugeOption.series[0].data[0].value = res.data.contractMoney
          this.gaugeOption.series[0].data[1].value = res.data.receivablesMoney
          if(this.gaugeSelectValue == 1){
            this.gaugeOption.title.text = parseFloat(this.gaugeData.achievementMoney) > 0 ? toPercent((parseFloat(this.gaugeData.contractMoney) / parseFloat(this.gaugeData.achievementMoney)).toFixed(1)) : '100.0%'
          }else{
            this.gaugeOption.title.text = parseFloat(this.gaugeData.achievementMoney) > 0 ? toPercent((parseFloat(this.gaugeData.receivablesMoney) / parseFloat(this.gaugeData.achievementMoney)).toFixed(1)) : '100.0%'
          }
          this.gaugeChart.setOption(this.gaugeOption, true)
          params.status = 1
          crmIndexAchievementData(params).then(res => {
            this.gaugeLoading = false
            this.currentAchievement.contractAchievement = res.data.achievementMoney
          }).catch(() => { this.gaugeLoading = false })
        })
        .catch(() => {
          this.gaugeLoading = false
        })
    },
    initGauge() {
      let gaugeChart = echarts.init(document.getElementById('gaugemain'))
      let gaugeContract = echarts.init(document.getElementById('gaugeContract'))
      let gaugeReceive = echarts.init(document.getElementById('gaugeReceive'))

      let optionMain = {
          title:{
              text:"" ,
              top: "44.5%",
              left: "39%"
          },
          tooltip: {
              trigger: 'item',
              formatter: "{a} <br/>{b}: {c} ({d}%)"
          },
          series: [
              {
                  name:'类型',
                  type:'pie',
                  radius: ['40%', '55%'],
                  color:['rgb(83,109,254)','rgb(255,88,88)'],
                  data:[
                      {value: 0, name:'本月合同金额'},
                      {value: 0, name:'本月回款金额'}
                  ],
                  // itemStyle: {
                  //   color: {
                  //       type: 'linear',
                  //       x: 0,
                  //       y: 0,
                  //       x2: 0,
                  //       y2: 1,
                  //       colorStops: [{
                  //           offset: 0, color: 'red' // 0% 处的颜色
                  //       }, {
                  //           offset: 1, color: 'blue' // 100% 处的颜色
                  //       }],
                  //       global: false // 缺省为 false
                  //   }
                  // }
              }
          ]
      };
      let optionContract = {
          color: ['#6ca2ff', '#ff7474'],
          tooltip : {
              trigger: 'axis',
              axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                  type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
              }
          },
          grid: {
            top: '5px',
            left: '20px',
            right: '20px',
            bottom: '20px',
            containLabel: true,
            borderColor: '#fff'
          },
          xAxis: [
            {
              type: 'category',
              data: getCurrentMounthDaysArray(),
              axisTick: {
                alignWithLabel: true,
                lineStyle: { width: 0 }
              },
              axisLabel: {
                show:false
              },
              /** 坐标轴轴线相关设置 */
              axisLine: {
                lineStyle: { 
                  width: 0
                }
              },
              splitLine: {
                show: false
              }
            }
          ],
          yAxis: [
            {
              type: 'value',
              show: false
            }
          ],
          series: [
            {
              name: '合同金额',
              type: 'bar',
              barWidth: 10,
              data: [100,200,300,400,500,600,700,800],
              itemStyle: {  
                  normal: {   //颜色渐变函数 前四个参数分别表示四个位置依次为左、下、右、上
                      color: new echarts.graphic.LinearGradient(0, 0, 0, 1,[{
                              offset: 0, color: 'rgba(83,109,254,0.6)' // 0% 处的颜色
                          }, {
                              offset: 0.5, color: 'rgb(83,109,254)' // 100% 处的颜色
                          },{
                              offset: 1, color: '#fff' // 100% 处的颜色
                          }]
                      ),  //背景渐变色 
                      lineStyle: {        // 系列级个性化折线样式  
                          width: 2,  
                          type: 'solid',  
                          color: "rgb(83,109,254)"
                      }
                  }
              }//线条样式  
            }
          ]
      }
      let optionReceive = {
          title: {
                text: '本月回款金额',
                show: false
            },
            tooltip : {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#6a7985'
                    }
                },
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : false,
                    data : getCurrentMounthDaysArray(),
                    show: false
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    show:false
                }
            ],
            series : [
                {
                    name:'回款金额',
                    type:'line',
                    stack: '总量',
                    areaStyle: {},
                    data:[],
                    // symbol: 'none',
                    smooth: true,
                    itemStyle: {  
                        normal: {   //颜色渐变函数 前四个参数分别表示四个位置依次为左、下、右、上
                            color: new echarts.graphic.LinearGradient(0, 0, 0, 1,[{
                                    offset: 0, color: 'rgb(255,88,88)' // 0% 处的颜色
                                }, {
                                    offset: 1, color: '#fff' // 100% 处的颜色
                                }]
                            ),  //背景渐变色 
                            lineStyle: {        // 系列级个性化折线样式  
                                width: 2,  
                                type: 'solid',  
                                color: "rgb(255,88,88)"
                            }
                        }
                    }//线条样式  
                }
            ]
      }
      
      gaugeChart.setOption(optionMain, true)
      
      this.gaugeOption = optionMain
      this.gaugeChart = gaugeChart
      window.onresize=()=>{ this.gaugeChart.resize();};

      gaugeContract.setOption(optionContract, true)
      this.contractOption = optionContract
      this.contractChart = gaugeContract
      window.onresize=()=>{ this.contractChart.resize();};

      gaugeReceive.setOption(optionReceive, true)
      this.receiveOption = optionReceive
      this.receiveChart = gaugeReceive
      window.onresize=()=>{ this.receiveChart.resize();};
    },
    getCurrentMonthSaletrend(){
      this.curtrendLoading = true
      var params = this.getBaseParams()
      params.type = "month"
      crmIndexSaletrend(params)
        .then(res => {
          this.currentTrend = res.data
          let list = res.data.list || []
          let contractList = []
          let receivablesList = []
          let xAxisData = []
          for (let index = 0; index < list.length; index++) {
            const element = list[index]
            contractList.push(element.contractMoney)
            receivablesList.push(element.receivablesMoney)
            xAxisData.push(element.type)
          }
          this.contractOption.series[0].data = contractList
          this.receiveOption.series[0].data = receivablesList
          this.contractChart.setOption(this.contractOption, true)
          this.receiveChart.setOption(this.receiveOption, true)
          this.curtrendLoading = false
        })
        .catch(() => {
          this.curtrendLoading = false
        })
    },
    /** 赢单指标图 */
    getGainData(){
      let params = {
        page: 1,
        limit: 15,
        search: ''
      }
      crmBusinessIndex(params)
        .then(res => {
          this.gainLoading = true
          const { list, dataCount } = res.data
          let winSheetArr = list.filter((val,index) => {
            return val.status_id_info == "赢单"
          })
          localStorage.dataCount = dataCount
          this.gainOption.series[0].data[0].value = dataCount > 0 ? ((winSheetArr.length / dataCount) * 100).toFixed(1) : 0
          this.gainOption.tooltip.formatter = `赢单数 ：${winSheetArr.length}<br />总单数 ：${dataCount}<br />赢单率 : {c}%`
          this.gainChart.setOption(this.gainOption, true)
          this.gainLoading = false
        })
        .catch(() => {
          this.gainLoading = false
        })
    },
    initGain(){
      let funnelGain = echarts.init(document.getElementById('funnelGain'))
      let optionGain = {
          tooltip: {
            formatter: '赢单率 : {c}%'
          },
          series: [
            {
              type: 'gauge',
              splitNumber: 4,
              detail: {
                formatter: '{value}%',
                fontSize: 20,
                padding:[60,0,0,10],
                color: '#666'
              },
              data: [{ value: 0, name: '' }],
              axisLine: {
                lineStyle: {
                  width: 6,
                  color: [[0.25, 'rgb(59,84,211)'], [0.5, 'rgb(100,68,188)'], [0.75, 'rgb(159,46,153)'], [1, 'rgb(241,15,106)']]
                }
              },
              splitLine: {
                length: 13,
                lineStyle: { width: 0 }
              },
              /** 刻度样式 */
              axisTick: { 
                show: true,
                splitNumber: 1,
                length: '20%',
                lineStyle: {
                  color: 'rgba(99,213,255,0.7)'
                }
              },
              /** 刻度标签 */
              axisLabel: { 
                fontSize: 9,
                formatter: ' '
              },
              /** 仪表盘指针 */
              pointer: {
                length: '70%',
                width: 3
              },
              /** 仪表盘指针颜色 */
              itemStyle: { color: 'rgb(59,84,211)' }
            }
          ]
      }
      funnelGain.setOption(optionGain, true)
      this.gainOption = optionGain
      this.gainChart = funnelGain
      window.onresize=()=>{ this.gainChart.resize();};
    },
    /** 销售漏斗 */
    getBusinessStatusList() {
      this.funnelLoading = true
      crmBusinessStatusList({})
        .then(res => {
          this.funnelLoading = false
          this.businessOptions = res.data
          if (res.data.length > 0) {
            this.businessStatusValue = res.data[0].type_id
            this.getBusinessStatustatistics()
          }
        })
        .catch(() => {
          this.funnelLoading = false
        })
    },
    getBusinessStatustatistics() {
      if (this.businessStatusValue) {
        this.funnelLoading = true
        var params = this.getBaseParams()
        params.type_id = this.businessStatusValue
        crmIndexFunnel(params)
          .then(res => {
            this.funnelLoading = false
            var data = []
            for (let index = 0; index < res.data.list.length; index++) {
              const element = res.data.list[index]
              data.push({
                name: element.status_name + '(' + element.count + ')',
                value: element.money
              })
            }
            this.funnelData = res.data
            const { list } = res.data
            this.pieOption.series[0].data[0].value = (list[0].count / parseInt(localStorage.dataCount) * 100).toFixed(1)
            this.pieChart.setOption(this.pieOption, true)
             /**  漏斗canvas hover事件委托  */
            let funnel = document.querySelector('.funnel-other')
            funnel.addEventListener('mouseover',(ev) => {
              let target = ev.target || ev.srcElement;
              console.log(target.id)
              if(target.nodeName.toLocaleLowerCase() == 'canvas'){
                  switch(target.id){
                      case 'funnel_validate' :
                          this.setFunnelPieVal(list[0])
                          break;
                      case 'funnel_need' :
                          this.setFunnelPieVal(list[1])
                          break;
                      case 'funnel_plan' :
                          this.setFunnelPieVal(list[2])
                          break;
                      case 'funnel_negotiation' :
                          this.setFunnelPieVal(list[3])
                          break;
                  }
              }
            },false)
            // this.funnelDom = funnel
          })
          .catch(() => {
            this.funnelLoading = false
          })
      } else {
        this.getBusinessStatusList()
      }
    },
    setFunnelPieVal(obj){
      this.pieOption.tooltip.formatter = `${obj.name}阶段<br />占总商机数比 : {c}%`
      this.pieOption.series[0].data[0].value = (obj.count / parseInt(localStorage.dataCount) * 100).toFixed(1)
      this.pieChart.setOption(this.pieOption, true)
      this.negotiationNums = obj.count
      this.profit = obj.money
    },
    initFunnel() {
      /*
        ** 漏斗绘图 **
      */
      let canvas_validate = document.querySelector(".funnel-canvas-validate")
      let ctx_validate = canvas_validate.getContext("2d")
      // 验证阶段
      ctx_validate.beginPath()
      ctx_validate.moveTo(0,0)            //moveTo()起始位置
      ctx_validate.lineTo(120,30)         //lineTo()路径位置
      ctx_validate.lineTo(120,120)
      ctx_validate.lineTo(0,150)
      ctx_validate.closePath()
      let bg = ctx_validate.createLinearGradient(0, 0, 0, 150)  //定义线性渐变，渐变的起点 (x1,y1) 与终点 (x2,y2)。
      bg.addColorStop(0, 'rgb(3,241,254)')  //定义好，之后开始上色
      bg.addColorStop(0.5, 'rgb(37,208,254)')
      bg.addColorStop(1, 'rgb(77,174,253)')
      ctx_validate.fillStyle = bg
      ctx_validate.fill()
      ctx_validate.fillStyle = '#fff'
      ctx_validate.font="14px Georgia"
      ctx_validate.fillText("验证客户",25,80)
      
      //需求阶段
      let canvas_need = document.querySelector(".funnel-canvas-need")
      let ctx_need = canvas_need.getContext("2d")

      ctx_need.beginPath()
      ctx_need.moveTo(0,30)            //moveTo()起始位置
      ctx_need.lineTo(120,50)         //lineTo()路径位置
      ctx_need.lineTo(120,100)
      ctx_need.lineTo(0,120)
      ctx_need.closePath()
      bg = ctx_need.createLinearGradient(0, 30, 0, 120)  //定义线性渐变，渐变的起点 (x1,y1) 与终点 (x2,y2)。
      bg.addColorStop(0, 'rgb(254,218,124)')  //定义好，之后开始上色
      bg.addColorStop(0.5, 'rgb(255,189,77)')
      bg.addColorStop(1, 'rgb(255,168,42)')
      ctx_need.fillStyle = bg
      ctx_need.fill()
      ctx_need.fillStyle = '#fff'
      ctx_need.font="14px Georgia"
      ctx_need.fillText("需求分析",30,80)

      // 方案阶段
      let canvas_plan = document.querySelector(".funnel-canvas-plan")
      let ctx_plan = canvas_plan.getContext("2d")

      ctx_plan.beginPath()
      ctx_plan.moveTo(0,50)            //moveTo()起始位置
      ctx_plan.lineTo(120,60)         //lineTo()路径位置
      ctx_plan.lineTo(120,90)
      ctx_plan.lineTo(0,100)
      ctx_plan.closePath()
      bg = ctx_plan.createLinearGradient(0, 50, 0, 100)  //定义线性渐变，渐变的起点 (x1,y1) 与终点 (x2,y2)。
      bg.addColorStop(0, 'rgb(174,173,239)')  //定义好，之后开始上色
      bg.addColorStop(0.5, 'rgb(150,143,239)')
      bg.addColorStop(1, 'rgb(134,114,239)')
      ctx_plan.fillStyle = bg
      ctx_plan.fill()
      ctx_plan.fillStyle = '#fff'
      ctx_plan.font="14px Georgia"
      ctx_plan.fillText("方案/报价",30,80)

      // 谈判阶段
      let canvas_negotiation = document.querySelector(".funnel-canvas-negotiation")
      let ctx_negotiation = canvas_negotiation.getContext("2d")
      
      //填充矩形（x, y是横纵坐标，原点在canvas的左上角）
      bg = ctx_negotiation.createLinearGradient(0, 60, 0, 120)  //定义线性渐变，渐变的起点 (x1,y1) 与终点 (x2,y2)。
      bg.addColorStop(0, 'rgb(255,154,131)')  //定义好，之后开始上色
      bg.addColorStop(0.5, 'rgb(255,127,98)')
      bg.addColorStop(1, 'rgb(254,100,66)')
      ctx_negotiation.fillStyle = bg
      ctx_negotiation.fillRect(0, 60, 100, 30)
      ctx_negotiation.fillStyle = '#fff'
      ctx_negotiation.font="14px Georgia"
      ctx_negotiation.fillText("谈判审核",25,80)

      /*
        ** 完成度绘图 **
      */
      let funnelPie = echarts.init(document.getElementById('funnelPie'))
      let optionPie = {
        tooltip: {
          formatter: '占总商机数比 : {c}%'
        },
        series: [
          {
            type: 'gauge',
            splitNumber: 4,
            detail: {
              formatter: '{value}%',
              fontSize: 16,
              padding:[20,0,0,0],
              color: '#666',
              // show: false
            },
            data: [{ value: 500, name: '' }],
            axisLine: {
              lineStyle: {
                width: 6,
                color: [[0.25, 'rgb(59,84,211)'], [0.5, 'rgb(100,68,188)'], [0.75, 'rgb(159,46,153)'], [1, 'rgb(241,15,106)']]
              }
            },
            splitLine: {
              length: 13,
              lineStyle: { width: 0 }
            },
            /** 刻度样式 */
            axisTick: { 
              show: true,
              splitNumber: 1,
              length: '20%',
              lineStyle: {
                color: 'rgba(99,213,255,0.7)'
              }
            },
            /** 刻度标签 */
            axisLabel: { 
              fontSize: 9,
              formatter: ' '
            },
            /** 仪表盘指针 */
            pointer: {
              length: '70%',
              width: 2
            },
            /** 仪表盘指针颜色 */
            itemStyle: { color: 'rgb(59,84,211)' }
          }
        ]
      }
      funnelPie.setOption(optionPie, true)
      this.pieOption = optionPie
      this.pieChart = funnelPie
    },
    /** 销售趋势 */
    getCrmIndexSaletrend() {
      this.trendLoading = true
      var params = this.getBaseParams()
      crmIndexSaletrend(params)
        .then(res => {
          this.trendData = res.data
          let list = res.data.list || []
          let contractList = []
          let receivablesList = []
          let xAxisData = []
          for (let index = 0; index < list.length; index++) {
            const element = list[index]
            contractList.push(element.contractMoney)
            receivablesList.push(element.receivablesMoney)
            xAxisData.push(element.type)
          }

          this.axisOption.xAxis[0].data = xAxisData
          this.axisOption.series[0].data = contractList
          this.axisOption.series[1].data = receivablesList

          this.axisChart.setOption(this.axisOption, true)
          window.onresize=()=>{ this.axisChart.resize();};
          this.trendLoading = false
        })
        .catch(() => {
          this.trendLoading = false
        })
    },
    initAxis() {
      let gaugeTrend = echarts.init(document.getElementById('gaugeTrend'))
      let optionTrend = {
          tooltip : {
              trigger: 'axis',
              axisPointer: {
                  type: 'cross',
                  label: {
                      backgroundColor: '#6a7985'
                  }
              }
          },
          legend: {
              data:['合同金额','回款金额']
          },
          grid: {
              left: '3%',
              right: '4%',
              bottom: '3%',
              containLabel: true
          },
          xAxis : [
              {
                  type : 'category',
                  boundaryGap : false,
                  data : [],
                  axisTick: {
                      show: false
                  },
                  axisLine:{
                      lineStyle:{
                          width: 0
                      }
                  }
              }
          ],
          yAxis : [
              {
                  type : 'value',
                  axisTick: {
                      show: false
                  },
                  axisLine:{
                      lineStyle:{
                          width: 0
                      }
                  },
                  axisLabel: {
                    formatter: '{value} 元'
                  },
              }
          ],
          series : [
              {
                  name:'合同金额',
                  type:'line',
                  areaStyle: {},
                  smooth: true,
                  data:[],
                  itemStyle: {  
                      normal: {   //颜色渐变函数 前四个参数分别表示四个位置依次为左、下、右、上
                          color: new echarts.graphic.LinearGradient(0, 0, 0, 1,[{
                                  offset: 0, color: 'rgb(83,109,254)' // 0% 处的颜色
                              }, {
                                  offset: 1, color: '#fff' // 100% 处的颜色
                              }]
                          ),  //背景渐变色 
                          lineStyle: {        // 系列级个性化折线样式  
                              width: 2,  
                              type: 'solid',  
                              color: "rgb(83,109,254)"
                          }
                      }
                  }//线条样式  
              },
              {
                  name:'回款金额',
                  type:'line',
                  areaStyle: {},
                  smooth: true,
                  data:[],
                  itemStyle: {  
                      normal: {   //颜色渐变函数 前四个参数分别表示四个位置依次为左、下、右、上
                          color: new echarts.graphic.LinearGradient(0, 0, 0, 1,[{
                                  offset: 0, color: 'rgb(255,88,88)' // 0% 处的颜色
                              }, {
                                  offset: 1, color: '#fff' // 100% 处的颜色
                              }]
                          ),  //背景渐变色 
                          lineStyle: {        // 系列级个性化折线样式  
                              width: 2,  
                              type: 'solid',  
                              color: "rgb(255,88,88)"
                          }
                      }
                  }//线条样式  
              }
          ]
      }   
      gaugeTrend.setOption(optionTrend, true)
      this.axisOption = optionTrend
      this.axisChart = gaugeTrend
    }
  }
}
</script>

<style lang="scss" scoped>
.container{
  box-sizing: border-box;
  font-size: 0.875rem;
}
.jianbao{
  height: 130px;
}
.contract{
    height: 200px;
}
.receive{
    height: 200px;
}
.trend{
  height: 440px;
}
.card {
  position: relative;
  border: 1px solid #e6e6e6;
  border-radius: 15px;
  padding: 15px 0px 20px 20px;
  background-color: white;
  box-shadow: 0 0px 8px #e6e6e6;
  
  .mark-gauge-main{
    width:100%;
    height:380px;
  }
  .card-top {
    margin-top: 10px;
    display: flex;

    .card-left {
      flex: 1;
      div:last-of-type {
        margin-top: 8px;
        color: rgb(255, 150, 150);
      }
    }

    .card-right {
      flex: 1;
      text-align: center;
      font-size: 28px;
      color: rgb(102, 102, 102);
    }

  }

  .card-bottom{
    width:100%;
    position: absolute;
    top: 12%;
    right: 10%;
    &.card-bar {
      top: 34%;
      right: 5%;
    }
  }

}

.img-mark {
  display: block;
  width: 15px;
  margin: 0 8px;
  text-indent: 6px;
}

.mark-header {
  // margin-bottom: 20px;
  margin-bottom: 1.25rem;
  font-size: 13px;
  &:first-of-type{
    span::before {
      content: "";
      display: inline-block;
      background: rgb(62,132,233);
      width: 3px;
      height: 15px;
      vertical-align: text-top;
      margin-right: 10px;
    }
  }
  &.funnel-mark{
    margin: 0;
  }
}

.mark{
  display: flex;
  height: 220px;
  // justify-content: space-around;
  .mark-target{
    margin-top: 15px;
    flex:1;
    position: relative;
    .value{
      color: rgb(255,88,88);
      font-size: 28px;
      font-weight: bold;
      font-family: serif;
    }
    &::after {
      content: "目标金额";
      display: inline-block;
      font-size: 12px;
      position: absolute;
      right:22%;
      margin-top: 12px;
    }
  }
}

/** 简报 */

.jianbao-icon-container {
  padding: 6px;
  &:last-child .jianbao-div{
    &::after{
      width: 0
    }
  }
}

.jianbao-icon-content {
  padding: 8px 8px;
  border-radius: 3px;
  // cursor: pointer;
  .jianbao-icon {
    display: block;
    width: 69px;
    margin-right: 10px;
  }

  .jianbao-div {
    display:flex;
    align-items:inherit;
    flex-direction:column;
    min-width:100px;
    position: relative;

    &::after{
      content: "";
      display: inline-block;
      background: #ccc;
      height: 100%;
      width:1px;
      position:absolute;
      right:-18px;
      // right: -1.130rem;
      top: 0;
    }

    .jianbao-title {
      color: #333;
      font-size: 13px;
      margin: 15px 0px 0 0;
    }
    .jianbao-value {
      color: #333;
      text-align: right;
      font-size: 16px;
      flex: 1;
    }

  }

}

.jianbaoSelect {
  position: absolute;
  top: 15px;
  right: 20px;
  width: 80px;
}

/** 指标 */
.mark-gauge {
  // margin: 0 auto;
  width: 330px;
  height: 220px;
}

.mark-gauge-line{
  width: 100%;
  height: 180px;
}

.mark-gauge-bar{
  // canvas {
  //   height:150px!important;
  // }
  width:100%;
  height:140px;
}

.target-items {
  position: absolute;
  left: 0;
  bottom: 0;
}

.target-item {
  padding: 20px 25px;
  min-width: 100px;
  .name {
    font-size: 12px;
    color: #666666;
  }
  .value {
    margin-top: 15px;
    font-size: 14px;
    color: #333;
  }
}

/** 销售漏斗 */
.funnelSelect {
  position: absolute;
  top: 15px;
  right: 20px;
  width: auto;
  .el-date-editor {
    padding: 0px 10px;
    width: 240px;
    margin-right: 15px;
  }
  .el-select {
    width: 120px;
  }
}

.funnel {
  position: absolute;
  top: 40px;
  left: 20px;
  width: 480px;
  height: 350px;
  margin: 0 auto;
  z-index: 0;
}

.funnel-pie{
  width:100%;
  height:180px;
}

.funnel-pie-other{
  width:100%;
  height:140px;
}

.loudou{
  height: 220px;
}

.funnel-container {
  display: flex;
  padding-top: 20px;
  height: 220px;
  .funnel-left {
    flex: 2;
    border-right: 1px solid #ccc;
    margin-right: 25px;
    .funnel-left-bottom {
      padding-right: 30px;
      margin-top: 50px;
      display: flex;
      text-align: center;
      justify-content: space-around;
      &.funnel-other {
        margin-top: 0;
        canvas {
          cursor: pointer;
          &:hover {
            opacity: 0.8;
          }
        }
      }
      .funnel-left-bottom-item {
        font-size:16px;
        & div:first-child {
          color: rgb(83,109,254);
          font-weight: bold;
        }
        & div:not(:first-child) {
          margin: 20px 0;
        }
        & div:last-child {
          margin-bottom: 0;
        }
      }
      .funnel-left-value {
        color: rgb(83,109,254);
        font-weight: bold;
        font-size: 28px;
        margin-bottom: 8px;
      } 
    }
  }
  .funnel-right {
    flex: 1;
    .funnel-text {
      position: absolute;
      bottom: 20px;
      right: 18px;
      line-height: 1.5;
      width: 180px;
      div {
        font-size: 16px;
        text-align: center;
        color: #666
      }
    }
  }
}

.funnel-label {
  position: absolute;
  top: 180px;
  left: 70px;
  font-size: 13px;
  div:nth-child(1) {
    color: #6ca2ff;
  }
  div:nth-child(2) {
    margin-top: 10px;
    color: #ff7474;
  }
}
/** 销售趋势 */
.trend-target-item {
  padding: 10px 25px 25px 25px;
  .name {
    font-size: 12px;
    color: #666666;
  }
  .value {
    margin-top: 10px;
    font-size: 18px;
    color: #333;
  }
}

.trend-label {
  position: absolute;
  z-index: 1;
  right: 30px;
  top: 80px;
  font-size: 12px;
  .label-item {
    .label-item-mark {
      width: 10px;
      height: 10px;
      margin-right: 10px;
    }
  }
}

.axismain-content {
  padding: 0 10px;
  #axismain {
    width: 100%;
    height: 250px;
  }
}

@media screen and (max-width: 1500px){
  .jianbao{
    height: 100px;
  }
  
  .jianbao-icon-content{
     padding: 4px 4px;
    .jianbao-icon{
      width: 48px;
    }
    .jianbao-div{
      min-width: 50px;
      .jianbao-title {
        font-size: 0.75rem;
        margin: 8px 0px 0 0;
      }
      .jianbao-value {
        font-size: 1.2rem;
        flex: 1;
      }
    }
  }
  .mark-gauge{
    width:320px;
    height: 180px;
    margin-top: 10px;
  }
  .mark-gauge-line{
    width: 100%;
    height: 140px;
  }
  .mark-gauge-bar{
    width:100%;
    height:120px;
  }
  .card{
    .mark-gauge-main{
      width:100%;
      height:330px;
    }
  }
  .mark{
    height: 180px;
    .mark-target{
      margin-top: 10px;
      .value{
        font-size: 1rem;
      }
    }
  }
  .mark-header{
    font-size: 0.75rem;
  }
  .contract{
    height: 170px;
    .card-top{
      font-size:0.75rem;
      .card-right{
        font-size: 1.30rem;
      }
    }
  }
  .receive{
    height: 170px;
    .card-top{
      font-size:0.75rem;
      .card-right{
        font-size: 1.30rem;
      }
    }
  }
  .trend{
    height: 370px;
  }
  .funnel-container{
    height: 210px;
    .funnel-left{
      margin-right: 20px;
      .funnel-left-bottom{
        padding-right: 25px;
        margin-top: 40px;
      }
    }
    .funnel-right{
      .funnel-pie{
        width: 100%;
        height: 140px;
      }
    }
  }
  .loudou{
    height: 210px;
  }
}
</style>

