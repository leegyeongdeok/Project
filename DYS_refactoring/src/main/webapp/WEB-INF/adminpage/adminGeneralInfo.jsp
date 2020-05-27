<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html >
<head>
<title>내 정보관리</title>

<style>
*{
margin: 0;
padding: 0;
}
div {
   margin: 0;
   padding: 0;
   display: block;
}

ul, li {
   list-style: none;
}

/* 첫번쨰 div */


#mypage {
   width: 850px;
   height: 900px;

}

/* 타이틀 */
.mypage_tit {
   overflow: hidden;
   width: 850px;
   height: 60px;
   padding-top: 50px;
   border-bottom: 2px solid #000;
   text-align: left;
}

.mypage_tit {
   overflow: hidden;
   width: 850px;
   height: 60px;
   padding-top: 50px;
   border-bottom: 2px solid #000;
   text-align: left;
}

.ptitle {
   width: 190px;
   height: 45px;
   background-position: 0 0;
   font-size: 34px;
}

/* 마이페이지 body */
#mypagemain {

   width: 850px;

}

/* 마이페이지 사이드 메뉴바 */
#myside {
   float: left;
   width: 250px;
   border: 0 none;
   background: 0;
   margin-top: 5%;
   margin-left: 0%;
   position: fixed;
}

.mysidemenu {
   overflow: hidden;
   width: 250px;
   padding-top: 4%;
   text-align: left;
}

.mysidemenu .info_tit {
   display: block;
   height: 41px;
   font-size: 17px;
   color: #000;
   line-height: 28px;
   padding-bottom: 0px;
   padding-left: 17%;
   padding-top: 10px;
   margin-top: -14%;
   margin-bottom: 5%;
   width: 207px;
}

.sidemenu_link {
    padding-left: 1%;
}

.mysidemenu .myinfo {
   padding: 6px 0 37px;
}

.mysidemenu .myinfo li {
   overflow: hidden;
   font-size: 13px;
   line-height: 24px;
}

/* 링크 색 */
.myinfo .link_myinfo {
   float: left;
   color: #252525;
   text-decoration: none;
}

.mysidemenu .myinfo .on .link_myinfo {
   color: #ef4323;
}

/* 정보 보여주기 시작 */

.info_title{
   overflow: hidden;
    width: 800px;
    padding: 27px 0 29px;
    font-size: 15px;
    line-height: 18px;
}

.mypagebox #mybody {
   width: 800px;
   overflow: hidden;
   margin: 0 auto;
}

.mypagebox .mybody_cont {
   overflow: hidden;
    width: 800px;
    background-color: #fff;
    letter-spacing: 0;
}

.cont_personal {
   overflow: hidden;
    text-align: left;
}

.cont_personal .tit_personal {
   height: 22px;
   margin:20px 0;
    padding: 20px 0;
    font-size: 35px;
    color: #000;
    line-height: 0px;
    text-align: center;
    font-weight: 100;
}

.cont_personal #title_p {
   text-align: center;
   padding-bottom: 4%;
}

.tit_personal .changeinfo {
   margin-left: 75%;
}

.cont_personal .basic_info {
    border: 1px solid #e6e6e6;
    border-radius: 8px;
}

/* .cont_personal .basic_info .id_basic{
   border-top: 1px solid #eee;
} */

.cont_personal .basic_info .area_basic {
   overflow: hidden;
    width: 795px;
    padding: 27px 0 29px;
    font-size: 15px;
    line-height: 18px;
    border-bottom: 1px solid #eee;
}

.cont_personal .basic_info .tit_basic {
    float: left;
    width: 134px;
    padding: 0 37px;
    letter-spacing: -1px;
}

.cont_personal .basic_info .box_basic {
    float: left;
    width: 450px;
    padding-left: 40px;
}

/* 마우스 올려놓을때 */


#second_info{
   padding-top: 5%;
}

#third_info {
   padding-top: 5%;
}

.myinfo_explan{
   padding-top: 20px;
    padding-bottom: 20px;
    padding-left: 25px;
    float: left;
}

#explan_image {
   padding-left: 15%;
    width: 270px;
    height: 135px;
}


/* 글씨 사이즈 */
.tit_basic {
   font-size: 12px;
   color: #00000073;
}

.box_basic {
   font-size: 17px;
   font-weight: 100;
}

.pro_title {
   font-size: 22px;
   font-weight: 100;
}

.title_font {
   font-size: 17px;
   color: #000000a3;
}

/* 사이드 이미지 */

.myinfo_image {
   width: 20px;
    height: 20px;
    float: left;
    padding-right: 6%;
    padding-left: 10%;
    margin-top: 1%;
}
.btn_area {
margin-top:5px;
  margin-bottom:20px;
    text-align: right;
}
.cancel, .delete {

    width: 50px;
    height: 30px;
    border: none;
    border-radius: 0;
    background-color: orange;
    cursor: pointer;
    text-align: center;
    color: #fff;
    font-size: 15px;

}


</style>



</head>
<body >
<%--    <%@ include file="../include/loginHeader.jsp"%> --%>
   <div id="mypageback">
      <!-- mypage start -->
        
      <div id="mypage" class="mypagebox">
         <div id="mypagemain">
            
            <!-- 내정보 칸 -->
            <div id="mybody">
               <div class="mybody_cont">
                  <div class="cont_personal">
                     <h3 class="tit_personal">개인 정보</h3>
   
                     <!-- 정보 시작 -->
                     <div class="basic_info" style="display: block">
                        <div class="info_title" style="padding-left: 4%;">
                           <h3 class="pro_title">프로필</h3><br>
                  
                        </div>
                        
                   <div class="area_basic id_basic">
                           <strong class="tit_basic">아이디</strong>
                           <div class="box_basic">${generalUser.account}</div>
                        </div>
                        
                   <div class="area_basic nickname_basic">
                           <strong class="tit_basic">비밀번호</strong>
                           <div class="box_basic">${generalUser.password}</div>
                        </div>
                        
                        <div class="area_basic nickname_basic">
                           <strong class="tit_basic">닉네임</strong>
                           <div class="box_basic">${generalUser.nickname}</div>
                        </div>
                        
                      <div class="area_basic name_basic">
                           <strong class="tit_basic">이름</strong>
                           <div class="box_basic">홍길동</div>
                        </div>
                        
                       <div class="area_basic jumin_basic">
                           <strong class="tit_basic">생년월일</strong>
                           <div class="box_basic">${generalUser.birth}</div>
                        </div>
                  </div>
                  <div id="second_info" >
                     <div class="basic_info second">
                     <div class="info_title" style="padding-left: 4%;">
                           <h3 class="pro_title">연락처 정보</h3>
                        </div>
                        
                 <div class="area_basic email_basic">
                           <strong class="tit_basic">이메일</strong>
                           <div class="box_basic">${generalUser.email}</div>
                        </div>
                        <div class="area_basic phone_basic">
                           <strong class="tit_basic">번호</strong>
                           <div class="box_basic">${generalUser.phoneNum}</div>
                        </div>
                  
                     </div>
                  </div>
        
                 
                                      <div class="btn_area">
		    <input type="button" class="delete" value="삭제" id="adminNoticeModifyDelete" onclick="" />
		    <input type="button" class="cancel" value="취소" id="adminNoticeWritingCancel" onclick="window.close()">		        		    
		    
		    </div>
                  
               </div>
            
            </div>
            
            
            </div>
         </div>
      </div>
   <!-- //mypage end -->


   </div>


</body>
</html>