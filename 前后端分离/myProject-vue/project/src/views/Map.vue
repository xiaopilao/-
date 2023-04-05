<template>
  <div>
    <div id="container" style="width: 100%; height: calc(100vh - 100px)"></div>

    <div id="info"></div>
  </div>
</template>

<script>
var content = [
  "<div style='font-size: 14px; color: red; width: 200px; height: 50px'>这是信息窗口</div>"
];


export default {
  name: "Map",
  data() {
    return {}
  },
  created() {

  },
  mounted() {
    // 创建地图实例
    var map = new AMap.Map("container", {
      zoom: 12,
      //center: [30.480776, 114.309093],
      resizeEnable: true
    })

    var infoWindow = new AMap.InfoWindow({
      anchor: 'top-right',
      content: content.join("<br>")  //传入 dom 对象，或者 html 字符串
    });

    var clickHandler = function(e) {
      console.log('您在[ '+e.lnglat.getLng()+','+e.lnglat.getLat()+' ]的位置点击了地图！');

      infoWindow.open(map, [30.480776, 114.309093]);
    };

    // 绑定事件
    map.on('click', clickHandler);

    var marker = new AMap.Marker({
      position: new AMap.LngLat(30.480776, 114.309093),   // 经纬度对象，也可以是经纬度构成的一维数组[116.39, 39.9]
      title: '湖北工业大学',
      icon: '//vdata.amap.com/icons/b18/1/2.png',
      // content: '<div style="font-size: 12px; width: 100px">这是我自定义的内容</div>'
    })
    marker.on('click', clickHandler);


    // 将创建的点标记添加到已有的地图实例：
    map.add(marker);


    // path 是驾车导航的起、途径和终点，最多支持16个途经点
    var path = []

    path.push([30.480776, 114.309093])
    path.push([30.536286, 114.36444])
    path.push([30.51311, 114.418862])

    map.plugin('AMap.DragRoute', function () {
      var route = new AMap.DragRoute(map, path, AMap.DrivingPolicy.LEAST_FEE)
      // 查询导航路径并开启拖拽导航
      route.search()
    })

    var polyLine = new AMap.Polyline({
      path: path,
      strokeWeight: 5,
      borderWeight: 5, // 线条宽度，默认为 1
      strokeStyle: "solid",
      strokeColor: '#DC143C', // 线条颜色
      lineJoin: 'round' // 折线拐点连接处样式
    })
    map.add(polyLine)


    //实例化城市查询类
    map.plugin('AMap.Geolocation', function() {
      var geolocation = new AMap.Geolocation({
        // 是否使用高精度定位，默认：true
        enableHighAccuracy: true,
        // 设置定位超时时间，默认：无穷大
        timeout: 10000,
        // 定位按钮的停靠位置的偏移量
        offset: [10, 20],
        //  定位成功后调整地图视野范围使定位位置及精度范围视野内可见，默认：false
        zoomToAccuracy: true,
        //  定位按钮的排放位置,  RB表示右下
        position: 'RB'
      })

      geolocation.getCurrentPosition(function(status,result){
        if(status=='complete'){
          onComplete(result)
        }else{
          onError(result)
        }
      });

      function onComplete (data) {
        // data是具体的定位信息
        console.log(data)
      }

      function onError (data) {
        // 定位出错
        console.error(data)
      }
    })

  },
  methods: {
    initMap() {
      AMapLoader.load({
        key: 'ca01352bb66bc5d66bcc0accb9eb990f', // 申请好的Web端开发者Key，首次调用 load 时必填
        version: '2.0', // 指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
        plugins: ['AMap.Scale'] // 需要使用的的插件列表，如比例尺'AMap.Scale'等
      })
        .then(AMap => {
          this.map = new AMap.Map('container', {
            //设置地图容器id
            viewMode: '3D', //是否为3D地图模式
            zoom: 10, //初始化地图级别
            //center: [30.51311, 114.418862] //初始化地图中心点位置
          })
        })
        .catch(e => {
          console.log(e)
        })
    }
  }
}
</script>

<style>

</style>
