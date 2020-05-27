<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>post_detail</title>
<style>
* {
	margin: 0;
	padding: 0;
}

.post_detail_top {
	height: 380px;
	width: 1800px;
	margin: 0 auto;
}

.post_detail_bok {
	padding-top: 100px;
	text-align: center;
	width: 1800px;
	height: auto;
	margin: 0 auto;
}

.post_tit {
	font-size: 64px;
	font-weight: 600;
}

.post_desc {
	font-size: 20px;
	font-weight: 400;
	margin-top: 40px;
}

.post_content_block {
	margin: 0 auto;
	position: relative;
	width: 1800px;
	min-height: 600px;
}

.post_brd_title {
	position: relative;
	padding: 15px;
	font-size: 40px;
	border-top: 2px solid #222;
	border-bottom: 1px solid #222;
}

.post_detail_tbl_cell {
	width: 950px;
	height: 80px;
	display: table-cell;
	line-height: 1.4;
	vertical-align: middle;
}

.post_brd_date {
	position: absolute;
	top: 45px;
	right: 20px;
	font-size: 15px;
}

.post_editor_area {
	min-height: 300px;
	padding: 40px 20px;
	line-height: 25px;
	border-bottom: 1px solid #222;
}

.content {
	margin: 0 auto;
	width: 65%;
}

.titletext {
	font-size: 40px;
	width: 80%;
}

ul, li {
	list-style: none;
}

.textmenu {
	padding: 4px 0 4px 3px;
	border-bottom: 1px solid #b5b5b5;
	height: 25px;
}
/* 네이버 */
 .tool_bg2 {
 	width:100%;
    height: 33px;
   
    z-index: 100;
}
 table.wrap 
    border-top: none;
}
table {
    border-collapse: collapse;
}

</style>


</head>
<body>

	<div class="post_detail_top">


		<div class="post_detail_bok">

			<div class="post_tit overlay">게 시 판</div>
			<div class="post_desc overlay">여러분의 여행 이야기를 들려 주세요</div>
		</div>

	</div>
	<!--post_detail_top-->

	<div class="post_content_block">
		<div class="content" id="content">
			<h1 class="post_brd_title">
				제목 : <input class="titletext" type="text">
			</h1>
			<div class="post_brd_editor">

				<div class="textmenu">
					<table role="presentation" width="100%" cellspacing="0"
						cellpadding="0" class="wrap" id="toolbox" style="height: 500px;">
						<tbody>
							<tr>
								<td id="tool_bg" colspan="2" class="tool_bg2">
									<!-- 692~759px -->
									<table role="presentation" width="100%" cellspacing="0"
										cellpadding="0">
										<tbody>
											<tr valign="top">
												<td class="item _editorPlugin"><span class="family"><img
														src="https://cafe.pstatic.net/editor/btn_n_font.gif"
														alt="글꼴" width="47" height="21" title="글꼴"
														nhn:command="fontname" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;"></span> <span
													class="size">
													<img
														src="https://cafe.pstatic.net/editor/btn_n_size.gif"
														alt="글자크기" width="47" height="21" title="글자크기"
														nhn:command="fontsize" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;"></span> <span
													class="make01">
													<img
														src="https://cafe.pstatic.net/editor/btn_n_bold.gif"
														alt="굵게(Ctrl+B)" width="22" height="21" title="굵게(Ctrl+B)"
														nhn:command="bold" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_underline.gif"
														alt="밑줄(Ctrl+U)" width="21" height="21" title="밑줄(Ctrl+U)"
														nhn:command="underline" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_Italic.gif"
														alt="기울게(Ctrl+I)" width="21" height="21"
														title="기울게(Ctrl+I)" nhn:command="italic"
														nhn:argument="undefined" nhn:state="normal"
														style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_strike2.gif"
														alt="취소선" width="21" height="21" title="취소선"
														nhn:command="strikethrough" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_color2.gif"
														alt="글자색상" width="21" height="21" title="글자색상"
														nhn:command="fontcolor" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_bgcolor.gif"
														alt="배경색상" width="21" height="21" title="배경색상"
														nhn:command="fontbackgroundcolor" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;"></span> 
														<span
													class="make02">
													<img
														src="https://cafe.pstatic.net/editor/btn_n_alignleft.gif"
														alt="왼쪽 정렬" width="22" height="21" title="왼쪽 정렬"
														nhn:command="justifyleft" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_aligncenter.gif"
														alt="중간 정렬" width="21" height="21" title="중간 정렬"
														nhn:command="justifycenter" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_alignright.gif"
														alt="오른쪽 정렬" width="21" height="21" title="오른쪽 정렬"
														nhn:command="justifyright" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_alignjustify.gif"
														alt="양쪽 정렬" width="21" height="21" title="양쪽 정렬"
														nhn:command="justifyfull" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_numberset.gif"
														width="20" height="21" alt="숫자목록" title="숫자목록"
														nhn:command="insertorderedlist" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_markset.gif"
														width="20" height="21" alt="기호목록" title="기호목록"
														nhn:command="insertunorderedlist" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_outdent.gif"
														width="21" height="21" alt="내어쓰기" title="내어쓰기"
														nhn:command="outdent" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_indent.gif"
														width="21" height="21" alt="들여쓰기" title="들여쓰기"
														nhn:command="indent" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;"></span> 
														<span
													class="make03">
													<img
														src="https://cafe.pstatic.net/editor/btn_n_quotation.gif"
														alt="인용구 설정/해제" width="21" height="21" title="인용구 설정/해제"
														nhn:command="quote" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_lineheight.gif"
														alt="줄간격" width="20" height="21" title="줄간격"
														nhn:command="lineheight" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;"></span>
														 <span
													class="make03">
													<img
														src="https://cafe.pstatic.net/editor/btn_n_url.gif"
														alt="링크" width="28" height="21" title="링크"
														nhn:command="hyperlink" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_emoticon.gif"
														width="20" height="21" alt="이모티콘" title="이모티콘"
														nhn:command="emoticoninsertion" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_table.gif"
														width="22" height="21" alt="표 삽입" title="표 삽입"
														nhn:command="inserttable" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_sign.gif"
														width="20" height="21" alt="특수기호 삽입" title="특수기호 삽입"
														nhn:command="scharinsertion" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_enlarged.gif"
														width="19" height="21" alt="찾기/바꾸기" title="찾기/바꾸기"
														nhn:command="searchkeyword" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;">
														<img
														src="https://cafe.pstatic.net/editor/btn_n_spelling.gif"
														alt="맞춤법 검사" width="21" height="21" title="맞춤법 검사"
														nhn:command="spellcheck" nhn:argument="undefined"
														nhn:state="normal" style="cursor: pointer;"></span>
													</td>
												<!-- td width="58" class="tool_option3"></td-->
											</tr>
										</tbody>
									</table>

								</td>
							</tr>

							<tr>
								<td colspan="2" class="b_tool_bg"></td>
							</tr>
							<tr id="spellcheckModeRow" style="height: 25px; display: none;">
								<td>
									<div class="spelling_test">
										<span id="spellcheckModeText"></span><br>
										<p class="notice">
											<span>표시된 단어</span>를 클릭하셔서 맞춤법을 수정하실 수 있습니다.
										</p>
										<span class="btn"><a href="#"
											onclick="Editor.$('textbox').execCommand('spellcheck',this);Editor.$('textbox').execCommand('spellcheck',this);return false;"><img
												src="https://cafe.pstatic.net/cafe4/btn_respelling.gif"
												width="92" height="22" alt="맞춤법 재검사"></a> <a href="#"
											onclick="Editor.$('textbox').execCommand('spellcheck',this);return false;"><img
												src="https://cafe.pstatic.net/cafe4/btn_close2.gif"
												width="46" height="22" alt="닫기"></a></span>
									</div>
								</td>
							</tr>
							<tr valign="top">
								<td class="read"><textarea id="textbox"
										style="visibility: visible; display: none; height: 400px; border: 0px; width: 100%;"
										name="content" title="내용 입력" cols="93" rows="28">										
									</textarea></td>
							</tr>
							<tr>
								<td colspan="2" class="size_more">
									<div id="size_grip"></div>
								</td>
							</tr>
						</tbody>
					</table>

				</div>

			</div>


		</div>
	</div>
</body>
</html>