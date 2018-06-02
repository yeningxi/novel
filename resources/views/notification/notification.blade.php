@extends('layouts.header')
@section('content')
<script src="/js/vue.js"></script>
<body>
<div class="page-container">
	<p class="f-20 text-success">欢迎使用进入小说管理 <span class="f-14">v3.1</span>云后台！</p>
	<p>登录次数：18 </p>
	<p>上次登录IP：{{$login_info[1]->ip}} 上次登录时间：{{date('Y-m-d H:i',$login_info[1]->login_time)}}</p>
	{{--<table class="table table-border table-bordered table-bg">--}}
		{{--<thead>--}}
			{{--<tr>--}}
				{{--<th colspan="7" scope="col">信息统计</th>--}}
			{{--</tr>--}}
			{{--<tr class="text-c">--}}
				{{--<th>统计</th>--}}
				{{--<th>资讯库</th>--}}
				{{--<th>图片库</th>--}}
				{{--<th>产品库</th>--}}
				{{--<th>用户</th>--}}
				{{--<th>管理员</th>--}}
			{{--</tr>--}}
		{{--</thead>--}}
		{{--<tbody>--}}
			{{--<tr class="text-c">--}}
				{{--<td>总数</td>--}}
				{{--<td>92</td>--}}
				{{--<td>9</td>--}}
				{{--<td>0</td>--}}
				{{--<td>8</td>--}}
				{{--<td>20</td>--}}
			{{--</tr>--}}
			{{--<tr class="text-c">--}}
				{{--<td>今日</td>--}}
				{{--<td>0</td>--}}
				{{--<td>0</td>--}}
				{{--<td>0</td>--}}
				{{--<td>0</td>--}}
				{{--<td>0</td>--}}
			{{--</tr>--}}
			{{--<tr class="text-c">--}}
				{{--<td>昨日</td>--}}
				{{--<td>0</td>--}}
				{{--<td>0</td>--}}
				{{--<td>0</td>--}}
				{{--<td>0</td>--}}
				{{--<td>0</td>--}}
			{{--</tr>--}}
			{{--<tr class="text-c">--}}
				{{--<td>本周</td>--}}
				{{--<td>2</td>--}}
				{{--<td>0</td>--}}
				{{--<td>0</td>--}}
				{{--<td>0</td>--}}
				{{--<td>0</td>--}}
			{{--</tr>--}}
			{{--<tr class="text-c">--}}
				{{--<td>本月</td>--}}
				{{--<td>2</td>--}}
				{{--<td>0</td>--}}
				{{--<td>0</td>--}}
				{{--<td>0</td>--}}
				{{--<td>0</td>--}}
			{{--</tr>--}}
		{{--</tbody>--}}
	{{--</table>--}}
	<table class="table table-border table-bordered table-bg mt-20">
		<thead>
			<tr>
				<th colspan="2" scope="col">公告列表</th>
			</tr>
		</thead>
		<tbody>
		@foreach($notices as $notice)
			<tr>
				<th width="70%"><a href="/noticomment/{{$notice->id}}">{{$notice->title}}</a></th>
				<td>
					<span id="lbServerName">
						<a href="/noticomment/{{$notice->id}}" data-href="{{$notice->title}}" title="{{$notice->title}}">查看</a>
						<a href="/notification/{{$notice->id}}/edit">编辑</a>
						<a href="/notification/{{$notice->id}}/delete">删除</a>
					</span>
				</td>
			</tr>
		@endforeach

		</tbody>
	</table>
</div>
<footer class="footer mt-20">
	<div class="container">
		<p>感谢jQuery、layer、laypage、Validform、UEditor、My97DatePicker、iconfont、Datatables、WebUploaded、icheck、highcharts、bootstrap-Switch<br>
			Copyright &copy;2015-2017 H-ui.admin v3.1 All Rights Reserved.<br>
			本后台系统由<a href="http://www.h-ui.net/" target="_blank" title="H-ui前端框架">H-ui前端框架</a>提供前端技术支持</p>
	</div>
</footer>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<!--此乃百度统计代码，请自行删除-->
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<!--/此乃百度统计代码，请自行删除-->
</body>

@endsection