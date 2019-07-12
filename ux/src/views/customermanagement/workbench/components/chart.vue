
<template>
  <div class="x-bar">
    <div :id="id" :option="option"></div>
  </div>
</template>
<script>
import Highcharts from 'highcharts'
export default {
  // 验证类型
  props: {
    id: {
      type: String
    },
    options: {
      type: Object
    }
  },
  watch: {
    option () {
        Highcharts.chart(this.id,this.options);
    }
},
  mounted() {
    Highcharts.chart(this.id,this.options)
  }
}
