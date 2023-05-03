<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&family=Sunflower&display=swap" rel="stylesheet">
<style type="text/css">
	.cover{
			width: 100%;
			height: 300px;
			border-radius: 10px 10px;
			background-color: red;
		}
		
		.profile{
			width: 100%;
			height: 120px;
			background-color: green;
		}
		
		.menu{
			width: 100%;
			height: 50px;
			background-color: yellow;
		}
		
		.mypage-main{
			margin: 0 auto;
		}
		
		.intro{
			width: 98%;
			height: 320px;
			background-color: green;
			border-radius: 10px 10px;
			margin: 10px;
			
		}
		
		.galary{
			width: 98%;
			height: 380px;
			background-color: green;
			border-radius: 10px 10px;
			margin: 10px;
			
		}
		
		.friend{
			width: 98%;
			height: 500px;
			background-color: green;
			border-radius: 10px 10px;
			margin: 10px;
		
		}
		
		 .write{
			width:96%;
			height: 100px;
			background-color: green;
			border-radius: 10px 10px;
			margin: 10px;
		
		}
		
		.content{
			width:96%;
			height: 200px;
			background-color: green;
			border-radius: 10px 10px;
			margin: 10px;
		}
		
		.left{
			width: 50%;
			float: left;
		}
		
		.right{
			width:50%;
			float: right;
		}
		
		.photo{
			position: relative;
			bottom: 20px;
			left: 20px;
			width: 120px;
			height: 120px;
			border-radius: 60px;
			background-color: pink;
		}
		
		.cover-label{
			cursor: pointer;
			color: white;
			background-color: black;
			padding: 6px 16px;
			border-radius: 5px;
		}
		
		.btnprofile{
			position: relative;
    		bottom: 30%;
    		left: 86%;
		}
		
		.btncover{
			position: relative;
    		top: 60%;
    		left: 85%;
		}
		
		.modal-photo{
			width: 100px;
			height: 100px;
			border-radius: 50px;
			border: 1px solid gray;
			margin: 20px auto;
		}
		
		.modal-cover{
			width: 400px;
			height: 150px;
			background-color: gray;
			border-radius: 10px;
			margin: 20px auto;
		}
		
		#btnupdate{
			width:570px;
			background-color: lightblue;
			color: blue;
			font-weight: 700;
		}
		
</style>
</head>
<body>

<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title" style="font-weight: 600; text-align: center;">프로필 수정</h4>
        </div>
        
        <div class="modal-body">
          <div class="title-photo">
          	<span style="font-weight: 700; margin-right: 450px; font-size: 12pt;">프로필 사진</span> 
          	<span style="color:lightblue">수정</span>

          	<div class="modal-photo">
          		
          	</div>
          </div>
          
          <div class="title-cover">
          	<span style="font-weight: 700; margin-right: 465px; font-size: 12pt;">커버 사진</span> 
          	<span style="color:lightblue">수정</span>
          	
          	<div class="modal-cover">
          		
          	</div>
          </div>
          
          <div class="modal-intro">
          	<span style="font-weight: 700; margin-right: 264px; font-size: 12pt;">회원님을 소개할 항목을 구성해주세요</span> 
          	<span style="color:lightblue">수정</span>
          </div>
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="btnupdate">정보 수정</button>
        </div>
      </div>
      
    </div>
  </div>
</div>

<div class="mypage">
	<div class="cover">
		<div class="cover-top" style="width: 100%; height: 67%;">
		
		</div>
		
		<div class="cover-bottom" style="width: 100%; height: 33%">
			<div class="btncover">
				<label for="cover-photo" class="cover-label">커버 사진 추가</label>
				<input type="file" style="display: none;" id="cover-photo" class="cover-photo">
			</div>
		</div>
	</div>
	
	<div class="profile">	
		<div class="photo">
				프로필 사진
		</div>
		
		<button type="button" class="btnprofile" data-toggle="modal" data-target="#myModal">프로필 편집</button>
		
	</div>
	
	<div class="menu">
		메뉴
	</div>
	
	<div class="mypage-main">
		<div class="left">
			<div class="intro">
				프로필 소개
			</div>
			
			<div class="galary">
				사진
			</div>
			
			<div class="friend">
				친구
			</div>
			
		</div>
		
		<div class="right">
			<div class="write">
				게시글 작성
			</div>
				
			<div class="content">
				게시글
			</div>
		</div>
	</div>
	
</div>
</body>
</html>