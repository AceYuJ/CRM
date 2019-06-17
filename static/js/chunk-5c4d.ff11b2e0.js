(window.webpackJsonp=window.webpackJsonp||[]).push([["chunk-5c4d"],{"149C":function(e,t,a){"use strict";var s=a("vLdV");a.n(s).a},C2qb:function(e,t,a){"use strict";var s=a("zgx2");a.n(s).a},HPoD:function(e,t,a){"use strict";var s=a("q3oD");a.n(s).a},MSIx:function(e,t,a){"use strict";a.r(t);var s=a("oj9+"),i=a("MT78"),n=a.n(i),o=a("oU2a"),l={name:"cycle-view",components:{},computed:{title:function(){return{customer:"员工客户成交周期（根据合同下单时间和客户创建时间计算）",address:"地区成交周期（根据合同下单时间和客户创建时间计算）",product:"产品成交周期（根据合同下单时间和客户创建时间计算）"}[this.type]}},data:function(){return{loading:!1,axisOption:null,axisChart:null,postParams:{},list:[],fieldList:[],initView:!1}},watch:{show:function(e){var t=this;e&&!this.initView&&(this.initView=!0,this.$nextTick(function(){t.initAxis(),t.getDataList(t.postParams)}))}},mixins:[s.a],props:{type:{required:!0,type:String},show:{required:!0,type:Boolean}},mounted:function(){this.fieldList=this.getFieldList(),this.show&&(this.initView=!0,this.initAxis())},methods:{getDataList:function(e){var t=this;(this.postParams=e,this.show)&&(this.loading=!0,(0,{customer:o.l,product:o.f,address:o.a}[this.type])(e).then(function(e){t.loading=!1,t.list="customer"==t.type?e.data.users:e.data;for(var a="customer"==t.type?e.data.items:e.data,s=[],i=[],n=[],o=0;o<a.length;o++){var l=a[o];s.push(l.cycle),i.push(l.customer_num),"customer"==t.type?n.push(l.type):"address"==t.type?n.push(l.address):"product"==t.type&&n.push(l.product_name)}t.axisOption.xAxis[0].data=n,t.axisOption.series[0].data=s,t.axisOption.series[1].data=i,t.axisChart.setOption(t.axisOption,!0)}).catch(function(){t.loading=!1}))},initAxis:function(){var e=n.a.init(document.getElementById("axismain"+this.type)),t={color:["#6ca2ff","#ff7474"],tooltip:{trigger:"axis",axisPointer:{type:"shadow"}},legend:{data:["成交周期","成交客户数"],bottom:"0px",itemWidth:14},grid:{top:"40px",left:"30px",right:"30px",bottom:"40px",containLabel:!0,borderColor:"#fff"},xAxis:[{type:"category",data:[],axisTick:{alignWithLabel:!0,lineStyle:{width:0}},axisLabel:{color:"#BDBDBD"},axisLine:{lineStyle:{color:"#BDBDBD"}},splitLine:{show:!1}}],yAxis:[{type:"value",name:"成交周期",axisTick:{alignWithLabel:!0,lineStyle:{width:0}},axisLabel:{color:"#BDBDBD",formatter:"{value}天"},axisLine:{lineStyle:{color:"#BDBDBD"}},splitLine:{show:!1}},{type:"value",name:"成交客户数",axisTick:{alignWithLabel:!0,lineStyle:{width:0}},axisLabel:{color:"#BDBDBD",formatter:"{value}个"},axisLine:{lineStyle:{color:"#BDBDBD"}},splitLine:{show:!1}}],series:[{name:"成交周期",type:"bar",yAxisIndex:0,barWidth:15,data:[]},{name:"成交客户数",type:"bar",yAxisIndex:1,barWidth:15,data:[]}]};e.setOption(t,!0),this.axisOption=t,this.axisChart=e},getFieldList:function(){return{customer:[{field:"realname",name:"姓名"},{field:"cycle",name:"成交周期（天）"},{field:"customer_num",name:"成交客户数"}],product:[{field:"product_name",name:"产品名称"},{field:"cycle",name:"成交周期（天）"},{field:"customer_num",name:"成交客户数"}],address:[{field:"address",name:"地区"},{field:"cycle",name:"成交周期（天）"},{field:"customer_num",name:"成交客户数"}]}[this.type]}}},u=(a("HPoD"),a("KHd+")),r=Object(u.a)(l,function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{directives:[{name:"loading",rawName:"v-loading",value:e.loading,expression:"loading"}],staticClass:"cycle-content"},[a("filtrate-handle-view",{staticClass:"filtrate-bar",attrs:{moduleType:"customer"},on:{load:function(t){e.loading=!0},change:e.getDataList}}),e._v(" "),a("div",{staticClass:"content"},[a("div",{staticClass:"axis-content"},[a("div",{staticClass:"content-title"},[e._v(e._s(e.title))]),e._v(" "),a("div",{staticClass:"axismain",attrs:{id:"axismain"+e.type}})]),e._v(" "),a("div",{staticClass:"table-content"},[a("el-table",{attrs:{data:e.list,height:"400",stripe:"",border:"","highlight-current-row":""}},e._l(e.fieldList,function(e,t){return a("el-table-column",{key:t,attrs:{align:"center","header-align":"center","show-overflow-tooltip":"",prop:e.field,label:e.name}})}))],1)])],1)},[],!1,null,"c9b76016",null);r.options.__file="CycleView.vue";var c={name:"customer-cycle-statistics",components:{CycleView:r.exports},data:function(){return{tabActiveName:"customer",tabList:[{label:"员工客户成交周期",name:"customer"},{label:"地区成交周期",name:"address"},{label:"产品成交周期",name:"product"}]}},computed:{},mounted:function(){},methods:{}},d=(a("149C"),Object(u.a)(c,function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("el-tabs",{staticClass:"main-container",model:{value:e.tabActiveName,callback:function(t){e.tabActiveName=t},expression:"tabActiveName"}},e._l(e.tabList,function(t,s){return a("el-tab-pane",{key:s,attrs:{label:t.label,name:t.name}},[a("cycle-view",{attrs:{type:t.name,show:t.name==e.tabActiveName}})],1)}))},[],!1,null,"e881a76c",null));d.options.__file="CustomerCycleStatistics.vue";t.default=d.exports},O1t1:function(e,t,a){"use strict";var s=a("nkdU");a.n(s).a},"gXW+":function(e,t,a){"use strict";var s=a("KTTK"),i=a("UcQx"),n=a("conU"),o=a("uKQN"),l=a("wd/R"),u=a.n(l),r={name:"filtrate-handle-view",components:{timeTypeSelect:o.a},watch:{},data:function(){return{pickerOptions:{disabledDate:function(e){return e.getTime()>Date.now()}},yearValue:"",timeTypeValue:{},structuresProps:{children:"children",label:"label",value:"id"},deptList:[],structuresSelectValue:"",userOptions:[],userSelectValue:"",businessOptions:[],businessStatusValue:"",productValue:[],productOptions:[],customValue:""}},props:{moduleType:{required:!0,type:String},showYearSelect:{default:!1,type:Boolean},showBusinessSelect:{default:!1,type:Boolean},showUserSelect:{default:!0,type:Boolean},showCustomSelect:{default:!1,type:Boolean},customDefault:"",customOptions:{default:function(){return[]},type:Array},showProductSelect:{default:!1,type:Boolean}},mounted:function(){var e=this;this.showCustomSelect&&(this.customValue=this.customDefault),this.showYearSelect&&(this.yearValue=u()(new Date).year().toString()),this.$emit("load"),this.getDeptList(function(){e.showBusinessSelect?e.getBusinessStatusList(function(){e.postFiltrateValue()}):e.postFiltrateValue()}),this.showProductSelect&&this.getProductCategoryIndex()},methods:{customSelectChange:function(){this.$emit("typeChange",this.customValue)},timeTypeChange:function(e){this.timeTypeValue=e},getDeptList:function(e){var t=this;Object(s.b)({m:"bi",c:this.moduleType,a:"read"}).then(function(a){t.deptList=a.data,a.data.length>0?(t.structuresSelectValue=a.data[0].id,t.showUserSelect&&t.getUserList()):t.structuresSelectValue="",e(!0)}).catch(function(){t.$emit("error")})},structuresValueChange:function(e){this.showUserSelect&&(this.userSelectValue="",this.userOptions=[],this.getUserList())},getUserList:function(){var e=this,t={};t.structure_id=this.structuresSelectValue,Object(s.j)(t).then(function(t){e.userOptions=t.data}).catch(function(){e.$emit("error")})},getBusinessStatusList:function(e){var t=this;Object(i.g)().then(function(a){t.businessOptions=a.data,a.data.length>0&&(t.businessStatusValue=a.data[0].type_id),e(!0)}).catch(function(){t.$emit("error")})},getProductCategoryIndex:function(){var e=this;Object(n.o)({type:"tree"}).then(function(t){e.productOptions=t.data}).catch(function(){})},postFiltrateValue:function(){var e={structure_id:this.structuresSelectValue};this.showUserSelect&&(e.user_id=this.userSelectValue),this.showBusinessSelect&&(e.type_id=this.businessStatusValue),this.showProductSelect&&(e.category_id=this.productValue.length>0?this.productValue[this.productValue.length-1]:""),this.showYearSelect?e.year=this.yearValue:"custom"==this.timeTypeValue.type?(e.start_time=this.timeTypeValue.startTime,e.end_time=this.timeTypeValue.endTime):e.type=this.timeTypeValue.value,this.$emit("change",e)}},beforeDestroy:function(){}},c=(a("C2qb"),a("KHd+")),d=Object(c.a)(r,function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("div",{staticClass:"filtrate-content"},[e.showYearSelect?e._e():a("time-type-select",{on:{change:e.timeTypeChange}}),e._v(" "),e.showYearSelect?a("el-date-picker",{attrs:{type:"year",clearable:!1,"value-format":"yyyy","picker-options":e.pickerOptions,placeholder:"选择年"},model:{value:e.yearValue,callback:function(t){e.yearValue=t},expression:"yearValue"}}):e._e(),e._v(" "),a("el-select",{attrs:{placeholder:"选择部门"},on:{change:e.structuresValueChange},model:{value:e.structuresSelectValue,callback:function(t){e.structuresSelectValue=t},expression:"structuresSelectValue"}},e._l(e.deptList,function(e){return a("el-option",{key:e.id,attrs:{label:e.name,value:e.id}})})),e._v(" "),e.showUserSelect?a("el-select",{attrs:{clearable:!0,placeholder:"选择员工"},model:{value:e.userSelectValue,callback:function(t){e.userSelectValue=t},expression:"userSelectValue"}},e._l(e.userOptions,function(e){return a("el-option",{key:e.id,attrs:{label:e.realname,value:e.id}})})):e._e(),e._v(" "),e.showBusinessSelect?a("el-select",{attrs:{placeholder:"商机组"},model:{value:e.businessStatusValue,callback:function(t){e.businessStatusValue=t},expression:"businessStatusValue"}},e._l(e.businessOptions,function(e){return a("el-option",{key:e.type_id,attrs:{label:e.name,value:e.type_id}})})):e._e(),e._v(" "),e.showProductSelect?a("el-cascader",{staticStyle:{width:"100%"},attrs:{options:e.productOptions,"change-on-select":"","show-all-levels":!1,props:{children:"children",label:"label",value:"category_id"}},model:{value:e.productValue,callback:function(t){e.productValue=t},expression:"productValue"}}):e._e(),e._v(" "),e.showCustomSelect?a("el-select",{attrs:{placeholder:"图标类型"},on:{change:e.customSelectChange},model:{value:e.customValue,callback:function(t){e.customValue=t},expression:"customValue"}},e._l(e.customOptions,function(e){return a("el-option",{key:e.value,attrs:{label:e.name,value:e.value}})})):e._e(),e._v(" "),a("el-button",{attrs:{type:"primary"},nativeOn:{click:function(t){e.postFiltrateValue()}}},[e._v("搜索")])],1)},[],!1,null,"6c3275f8",null);d.options.__file="filtrateHandleView.vue";t.a=d.exports},nkdU:function(e,t,a){},oU2a:function(e,t,a){"use strict";a.d(t,"j",function(){return i}),a.d(t,"k",function(){return n}),a.d(t,"i",function(){return o}),a.d(t,"g",function(){return l}),a.d(t,"h",function(){return u}),a.d(t,"c",function(){return r}),a.d(t,"b",function(){return c}),a.d(t,"d",function(){return d}),a.d(t,"e",function(){return p}),a.d(t,"l",function(){return h}),a.d(t,"a",function(){return m}),a.d(t,"f",function(){return f});var s=a("t3Un");function i(e){return Object(s.a)({url:"bi/customer/total",method:"post",data:e})}function n(e){return Object(s.a)({url:"bi/customer/statistics",method:"post",data:e})}function o(e){return Object(s.a)({url:"bi/customer/recordTimes",method:"post",data:e})}function l(e){return Object(s.a)({url:"bi/customer/recordList",method:"post",data:e})}function u(e){return Object(s.a)({url:"bi/customer/recordMode",method:"post",data:e})}function r(e){return Object(s.a)({url:"bi/customer/conversionInfo",method:"post",data:e})}function c(e){return Object(s.a)({url:"bi/customer/conversion",method:"post",data:e})}function d(e){return Object(s.a)({url:"bi/customer/pool",method:"post",data:e})}function p(e){return Object(s.a)({url:"bi/customer/poolList",method:"post",data:e})}function h(e){return Object(s.a)({url:"bi/customer/userCycle",method:"post",data:e})}function m(e){return Object(s.a)({url:"bi/customer/addressCycle",method:"post",data:e})}function f(e){return Object(s.a)({url:"bi/customer/productCycle",method:"post",data:e})}},"oj9+":function(e,t,a){"use strict";var s=a("gXW+");t.a={data:function(){return{chartColors:["#6CA2FF","#6AC9D7","#72DCA2","#48E78D","#FECD51","#DBB375","#FF7474","#F59561","#A3AEBC","#4C84FF","#0DBEB4","#00DEDE","#FFAA00","#C7C116","#F7A57C","#F661AC","#8652EE"]}},components:{filtrateHandleView:s.a},props:{},computed:{},watch:{},mounted:function(){},methods:{},deactivated:function(){}}},q3oD:function(e,t,a){},uKQN:function(e,t,a){"use strict";var s={name:"time-type-select",computed:{iconClass:function(){return this.showTypePopover?"arrow-up":"arrow-down"},typeShowValue:function(){return this.sureCustomContent?this.startTime||this.endTime?(this.startTime||"")+"-"+(this.endTime||""):"":this.selectType.label}},data:function(){return{selectType:{label:"本年",value:"year"},showTypePopover:!1,showCustomContent:!1,sureCustomContent:!1,startTime:"",endTime:"",typeOptions:[{label:"今天",value:"today"},{label:"昨天",value:"yesterday"},{label:"本周",value:"week"},{label:"上周",value:"lastWeek"},{label:"本月",value:"month"},{label:"上月",value:"lastMonth"},{label:"本季度",value:"quarter"},{label:"上季度",value:"lastQuarter"},{label:"本年",value:"year"},{label:"去年",value:"lastYear"}]}},props:{defaultType:Object},mounted:function(){this.defaultType?this.selectType=this.defaultType:this.$emit("change",{type:"default",value:this.selectType.value})},methods:{typeSelectClick:function(e){this.showTypePopover=!1,this.sureCustomContent=!1,this.showCustomContent=!1,this.selectType=e,this.$emit("change",{type:"default",value:this.selectType.value})},customSureClick:function(){this.startTime&&this.endTime&&(this.sureCustomContent=!0,this.showTypePopover=!1,this.$emit("change",{type:"custom",startTime:this.startTime,endTime:this.endTime}))}}},i=(a("O1t1"),a("KHd+")),n=Object(i.a)(s,function(){var e=this,t=e.$createElement,a=e._self._c||t;return a("el-popover",{attrs:{placement:"bottom",width:"200","popper-class":"no-padding-popover",trigger:"click"},model:{value:e.showTypePopover,callback:function(t){e.showTypePopover=t},expression:"showTypePopover"}},[a("div",{staticClass:"type-popper"},[a("div",{staticClass:"type-content"},[e._l(e.typeOptions,function(t,s){return a("div",{key:s,staticClass:"type-content-item",class:{selected:e.selectType.value==t.value&&!e.showCustomContent},on:{click:function(a){e.typeSelectClick(t)}}},[a("div",{staticClass:"mark"}),e._v(e._s(t.label)+"\n      ")])}),e._v(" "),a("div",{staticClass:"type-content-item",class:{selected:e.showCustomContent},on:{click:function(t){e.showCustomContent=!0}}},[a("div",{staticClass:"mark"}),e._v("自定义\n      ")])],2),e._v(" "),e.showCustomContent?a("div",{staticClass:"type-content-custom"},[a("el-date-picker",{attrs:{type:"date","value-format":"yyyy-MM-dd",placeholder:"选择日期"},model:{value:e.startTime,callback:function(t){e.startTime=t},expression:"startTime"}}),e._v(" "),a("el-date-picker",{attrs:{type:"date","value-format":"yyyy-MM-dd",placeholder:"选择日期"},model:{value:e.endTime,callback:function(t){e.endTime=t},expression:"endTime"}}),e._v(" "),a("el-button",{on:{click:e.customSureClick}},[e._v("确定")])],1):e._e()]),e._v(" "),a("el-input",{staticClass:"type-select",attrs:{slot:"reference",placeholder:"请选择选择",readonly:!0},slot:"reference",model:{value:e.typeShowValue,callback:function(t){e.typeShowValue=t},expression:"typeShowValue"}},[a("i",{class:["el-input__icon","el-icon-"+e.iconClass],attrs:{slot:"suffix"},slot:"suffix"})])],1)},[],!1,null,"043e8b5b",null);n.options.__file="index.vue";t.a=n.exports},vLdV:function(e,t,a){},zgx2:function(e,t,a){}}]);