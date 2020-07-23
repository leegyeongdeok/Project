<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		  content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<meta content="yes" name="apple-mobile-web-app-capable"/>
	<meta content="minimum-scale=1.0, width=device-width, maximum-scale=1, user-scalable=no" name="viewport"/>
	<link rel=" shortcut icon" href="/image/favicon_black.ico" style="user-select: auto;">
	<link rel="icon" href="/resources/image/favicon_black.ico">
	<style type="text/css">
		@-ms-viewport {
			width: device-width
		}

		@-o-viewport {
			width: device-width
		}

		@viewport {
			width: device-width
		}
	</style>

	<title>notice update</title>
	<link rel="stylesheet" href="/resources/css/adminPage/noticeCss.css">
</head>
<body>
<script type="text/javascript" src="/resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/editor/js/HuskyEZCreator.js"></script>
<script type="text/javascript" src="/resources/js/function/parameterController.js"></script>
<script type="text/javascript" src="/resources/js/adminPage/noticeJs.js"></script>

<div class="post_detail_top">
	<div class="post_tit overlay">공 지 사 항</div>
</div>

<!--post_detail_top-->
<div class="content">
	<h1 class="post_brd_title">
        <span class="post_detail_tbl_cell">
            제 목 :
            <input id="titleArea" class="post_writing_title" type="text" placeholder="제목을 입력하세요">
        </span>
	</h1>

	<div class="post_brd_editor">
		<form action="./insertBoard.do" method="post" id="insertQuestionFrm" enctype="multipart/form-data">
			<input name="title" id="title" class="post_writing_title" type="hidden">
			<textarea name="content" id="content_textArea"></textarea>
		</form>
	</div>

	<div class="btn_area">
		<input id="btn_create" type="button" class="registration" value="등록"/>
		<input type="button" class="cancel" value="취소" onclick="backPage()">

	</div>
</div>

</body>
</html>