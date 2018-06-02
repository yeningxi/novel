@extends('layouts.header')

@section('content')
<meta name="csrf-token" content="{{ csrf_token() }}">
<body>
<article class="page-container">
	<form class="form form-horizontal" id="form-notices-add" method="post">
        {{csrf_field()}}
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="title" name="title">
			</div>
            <span style="color: red">{{isset($errors->all()->title) ? $errors->all()->title:''}}</span>
		</div>

		{{--<div class="row cl">--}}
			{{--<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分类栏目：</label>--}}
			{{--<div class="formControls col-xs-8 col-sm-9">--}}
				{{--<span class="select-box">--}}
				{{--<select name="articlecolumn" class="select">--}}
					{{--<option value="0">全部栏目</option>--}}
					{{--<option value="1">新闻资讯</option>--}}
					{{--<option value="11">├行业动态</option>--}}
					{{--<option value="12">├行业资讯</option>--}}
					{{--<option value="13">├行业新闻</option>--}}
				{{--</select>--}}
				{{--</span>--}}
			{{--</div>--}}
		{{--</div>--}}
		{{--<div class="row cl">--}}
			{{--<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>文章类型：</label>--}}
			{{--<div class="formControls col-xs-8 col-sm-9">--}}
				{{--<span class="select-box">--}}
				{{--<select name="articletype" class="select">--}}
					{{--<option value="0">全部类型</option>--}}
					{{--<option value="1">帮助说明</option>--}}
					{{--<option value="2">新闻资讯</option>--}}
				{{--</select>--}}
				{{--</span>--}}
			{{--</div>--}}
		{{--</div>--}}
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">排序值：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="0" placeholder="" id="sortnum" name="sortnum">
			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">文章摘要：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="intro" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,200)"></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
			</div>
            <span style="color: red">{{isset($errors->all()->intro)?$errors->all()->intro:''}}</span>
		</div>


		{{--<div class="row cl">--}}
			{{--<label class="form-label col-xs-4 col-sm-2">允许评论：</label>--}}
			{{--<div class="formControls col-xs-8 col-sm-9 skin-minimal">--}}
				{{--<div class="check-box">--}}
					{{--<input type="checkbox" id="allowcomments" name="allowcomments" value="">--}}
					{{--<label for="checkbox-pinglun">&nbsp;</label>--}}
				{{--</div>--}}
			{{--</div>--}}
		{{--</div>--}}
		{{--<div class="row cl">--}}
			{{--<label class="form-label col-xs-4 col-sm-2">评论开始日期：</label>--}}
			{{--<div class="formControls col-xs-8 col-sm-9">--}}
				{{--<input type="text" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'commentdatemax\')||\'%y-%M-%d\'}' })" id="commentdatemin" name="commentdatemin" class="input-text Wdate">--}}
			{{--</div>--}}
		{{--</div>--}}
		{{--<div class="row cl">--}}
			{{--<label class="form-label col-xs-4 col-sm-2">评论结束日期：</label>--}}
			{{--<div class="formControls col-xs-8 col-sm-9">--}}
				{{--<input type="text" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'commentdatemin\')}' })" id="commentdatemax" name="commentdatemax" class="input-text Wdate">--}}
			{{--</div>--}}
		{{--</div>--}}

		{{--<div class="row cl">--}}
			{{--<label class="form-label col-xs-4 col-sm-2">缩略图：</label>--}}
			{{--<div class="formControls col-xs-8 col-sm-9">--}}
				{{--<div class="uploader-thum-container">--}}
					{{--<div id="fileList" class="uploader-list"></div>--}}
					{{--<div id="filePicker" style="display: inline-block;width: 200px">选择图片</div>--}}
					{{--<button id="btn-star" class="btn btn-default btn-uploadstar radius ml-10">开始上传</button>--}}
				{{--</div>--}}
			{{--</div>--}}
		{{--</div>--}}
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">文章内容：</label>
            <div class="formControls col-xs-8 col-sm-9">
				<textarea id="editor" type="text/plain" style="width:100%;height:400px;" name="content"></textarea>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="article_save_submit();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 提交</button>
				<button onClick="article_save();" class="btn btn-secondary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存草稿</button>
				<button onClick="removeIframe();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
            <span style="color: red">{{isset($errors->all()->content)?$errors->all()->content:''}}</span>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.config.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	//表单验证
	$("#form-article-add").validate({
		rules:{
			articletitle:{
				required:true,
			},
			articletitle2:{
				required:true,
			},
			articlecolumn:{
				required:true,
			},
			articletype:{
				required:true,
			},
			articlesort:{
				required:true,
			},
			keywords:{
				required:true,
			},
			abstract:{
				required:true,
			},
			author:{
				required:true,
			},
			sources:{
				required:true,
			},
			allowcomments:{
				required:true,
			},
			commentdatemin:{
				required:true,
			},
			commentdatemax:{
				required:true,
			},

		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			//$(form).ajaxSubmit();
			var index = parent.layer.getFrameIndex(window.name);
			//parent.$('.btn-refresh').click();
			parent.layer.close(index);
		}
	});
	
	$list = $("#fileList"),
	$btn = $("#btn-star"),
	state = "pending",
	uploader;

	var uploader = WebUploader.create({
		auto: true,
		swf: 'lib/webuploader/0.1.5/Uploader.swf',
	
		// 文件接收服务端。
		server: 'http://localhost/novel/public/notifiimgupload',
	
		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick: '#filePicker',
	
		// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
		resize: false,
		// 只允许选择图片文件。
		accept: {
			title: 'Images',
			extensions: 'gif,jpg,jpeg,bmp,png',
			mimeTypes: 'image/*'
		}
	});
	uploader.on( 'fileQueued', function( file ) {
		var $li = $(
			'<div id="' + file.id + '" class="item">' +
				'<div class="pic-box"><img></div>'+
				'<div class="info">' + file.name + '</div>' +
				'<p class="state">等待上传...</p>'+
			'</div>'
		),
		$img = $li.find('img');
		$list.append( $li );
	
		// 创建缩略图
		// 如果为非图片文件，可以不用调用此方法。
		// thumbnailWidth x thumbnailHeight 为 100 x 100
		uploader.makeThumb( file, function( error, src ) {
			if ( error ) {
				$img.replaceWith('<span>不能预览</span>');
				return;
			}
	
			$img.attr( 'src', src );
		}, thumbnailWidth, thumbnailHeight );
	});
	// 文件上传过程中创建进度条实时显示。
	uploader.on( 'uploadProgress', function( file, percentage ) {
		var $li = $( '#'+file.id ),
			$percent = $li.find('.progress-box .sr-only');
	
		// 避免重复创建
		if ( !$percent.length ) {
			$percent = $('<div class="progress-box"><span class="progress-bar radius"><span class="sr-only" style="width:0%"></span></span></div>').appendTo( $li ).find('.sr-only');
		}
		$li.find(".state").text("上传中");
		$percent.css( 'width', percentage * 100 + '%' );
	});
	
	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on( 'uploadSuccess', function( file ) {
		$( '#'+file.id ).addClass('upload-state-success').find(".state").text("已上传");
	});
	
	// 文件上传失败，显示上传出错。
	uploader.on( 'uploadError', function( file ) {
		$( '#'+file.id ).addClass('upload-state-error').find(".state").text("上传出错");
	});
	
	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on( 'uploadComplete', function( file ) {
		$( '#'+file.id ).find('.progress-box').fadeOut();
	});
	uploader.on('all', function (type) {
        if (type === 'startUpload') {
            state = 'uploading';
        } else if (type === 'stopUpload') {
            state = 'paused';
        } else if (type === 'uploadFinished') {
            state = 'done';
        }

        if (state === 'uploading') {
            $btn.text('暂停上传');
        } else {
            $btn.text('开始上传');
        }
    });

    $btn.on('click', function () {
        if (state === 'uploading') {
            uploader.stop();
        } else {
            uploader.upload();
        }
    });
	
	var ue = UE.getEditor('editor');
	
});



function article_save_submit(){
    $('#form-notices-add').submit();
}


</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>

@endsection
