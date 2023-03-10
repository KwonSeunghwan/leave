<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여행의 즐거움 :: 떠나!</title>
    <link rel="stylesheet" type="text/css" href="resources/css/common.css">
    <script src="resources/js/jquery-3.5.1.min.js"></script>
    <script src="resources/js/jquery-user.js"></script>
    <script scrc="resources/js/jquery-click2.js"></script>
</head>
<body>
    <div class="header-container">
        <div class="wrapper">
          <div class="header-content">
            <div class="head-menu-content">
              <div class="logo-content">
                <a href="index.html"><img class="logo-img" src="resources/images/logo.png"></a>
              </div>
              <!-- 로그인 상태의 headmenu -->
              <ul class="head-menu">
                <li><a href="myprofile.html">마이페이지</a></li>
                <li class="head-submenu">
                  <a class="profile-setting" href="#">
  
                    <div class="head-profile">
                      <img class="profile" src="resources/images/profile-img.jpeg">
                    </div>
                    <div class="profile-txt">
                      홍길동님
                    </div>
                  </a>
                  <ul class="submenu">
                    <li><a href="#">로그아웃</a></li>
                  </ul>
                </li>
              </ul>
            </div>
            <!--    로그아웃 상태의 headmenu -->
            <!--
                  <div class="head-menu-content">
                      <ul class="head-menu">
                      <li><a href="login.html">로그인</a></li>
                      <li><a href="regist.html">회원가입</a></li> 
                      </ul>   
                  </div>
                -->
  
          </div>
        </div>
      </div>

      <div class="main-container">
        <div class="wrapper">
          <div class="myProfile-content">
            <div class="user-info">
              <a href="myprofile.html">
                <div class="user-photo">
                  <img class="profile" src="resources/images/profile-img.jpeg">
                </div>
                <div class="user-profileInfo">
                  <div class="user-name">
                      Jsqoks
                  </div>
                  <div class="post-count">
                      <h4>2</h4> 게시물
                  </div> 
                </div>
              </a>
            </div>

            <div class="myProfile-main">
              <div class="myProfile-left-content">
                  <ul class = "number-line-alignment" >
                    <li><a class="myContent-choice" href="myprofile.html"> 나의 게시물 </a></li> 
                    <li><a href="memberInfo.html"> 회원정보 </a></li>
                  </ul>
              </div>
              <div class="myProfile-right-content">
                <div class="myProfile-tabmenu">
                  <ul class = "number-myProfile-alignment" >
                      <li class = "active"><a href="#"> 작성글 </a></li> <!--/board/list?catno="1"-->
                      <li><a href = "#"> 댓글단 글 </a></li> <!--/board/list?catno="2"-->
                      <li><a href = "#"> 좋아요 </a></li> <!--/board/list?catno="3"-->
                  </ul>
                </div>
                
                <div class="list-content">
                  <ul class="upload-content">
                      <li>
                        <a href="PC_DE_01.html">
                            <div class="list-box">
                                <div class="img-view-item">
                                    <img src="resources/images/test-img1.jpg" />
                                </div>
                                <div class="list-content-title">
                                    <p class="content-title">
                                        도심 속 아름다움을 찾아, 
                                        한옥의 정경을 느끼며 
                                    </p>
                                </div>  
                                <div class="list-content-hashtag">
                                    <p class="list-hashtag">
                                        <span class="hashtag-blue"> 국내여행 </span>                                     
                                    </p>
                                    <p class="list-hashtag">
                                        <span class="hashtag-blue"> 도시여행 </span>                                     
                                    </p>
                                    <p class="list-hashtag">
                                        <span class="hashtag-blue"> 데이트코스 </span>                                     
                                    </p>
                                </div>
                            </div>
                            <div class="list-user-profile">       
                                    <div class="head-profile">
                                        <img class="profile"src="resources/images/profile-img.jpeg">
                                    </div>
                                    <div class="profile-txt">                   
                                    Jsqoks
                                    </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="list-box">
                                <div class="img-view-item">
                                    <img src="resources/images/test-img12.jpg" />
                                </div>
                                <div class="list-content-title">
                                    <p class="content-title">
                                        타이완의 4대 온천<br/>
                                        관쯔린 온천
                                    </p>
                                </div>  
                                <div class="list-content-hashtag">
                                    <p class="list-hashtag">
                                        <span class="hashtag-blue"> 국외여행 </span>                                     
                                    </p>
                                </div>
                            </div>
                            <div class="list-user-profile">       
                                <div class="head-profile">
                                    <img class="profile"src="resources/images/profile-img.jpeg">
                                </div>
                                <div class="profile-txt">                   
                                Jsqoks
                                </div>
                        </div>
                        </a>
                      </li>
                
                        
                  </ul>
                </div>


                <div class="paging-content">
                  <ul class="pagination model">
                      <li><a href="#" class="first">처음 페이지</a></li>
                      <li><a href="#" class="arrow left"><</a></li>
                      <li><a href="#" class="active num">1</a></li>
                      <li><a href="#" class="num">2</a></li>
                      <li><a href="#" class="num">3</a></li>
                      <li><a href="#" class="num">4</a></li>
                      <li><a href="#" class="num">5</a></li>
                      <li><a href="#" class="num">6</a></li>
                      <li><a href="#" class="num">7</a></li>
                      <li><a href="#" class="num">8</a></li>
                      <li><a href="#" class="num">9</a></li>
                      <li><a href="#" class="arrow right">></a></li>
                      <li><a href="#" class="last">마지막 페이지</a></li>
                  </ul>
              </div>
              </div> <!--/right-content div -->
                
            </div>
          </div>  
           

          </div>
        </div>  
      </div>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>

<%@ include file="/WEB-INF/views/includes/sidebar.jsp"%>


<div id="top_btn">
	<a href="" onclick="goTop()"><img
		src="/resources/images/up-arrow.png"></a>
</div>
</body>
<script>
</script>
</html>