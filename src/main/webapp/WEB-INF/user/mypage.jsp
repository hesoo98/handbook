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
<script type="text/javascript">
	$(function(){
		
		//강제 호출
		$("#btnnewcover").click(function(){
			
			$("#newcover").trigger("click");
		});
		
		//커버 사진만 변경
		$("#newcover").change(function(){
			
			var num=$(this).attr("num");
	
			var form=new FormData();
			form.append("cover",$("#newcover")[0].files[0]); //선택한 1개 추가
			form.append("user_num",num);
			
			$.ajax({
				
				type: "post",
				dataType: "text",
				url: "coverupdate",
				processData: false,
				contentType: false,
				data: form,
				success: function(){
					
					location.reload();
				}
			})
		});
		
		//강제 호출
		$("#btnnewcover2").click(function(){
			
			$("#newcover2").trigger("click");
		});
		
		//프로필 편집 시 커버 미리보기하기
		$("#newcover2").change(function(){
			
			 if($(this)[0].files[0]){
			  var reader=new FileReader();
			  reader.onload=function(e){
			   $("#showcover").attr("src",e.target.result);
			  }
			  reader.readAsDataURL($(this)[0].files[0]);
			 }
		});
		
		//강제 호출
		$("#btnnewphoto").click(function(){
			
			$("#newphoto").trigger("click");
		});
		
		//프로필 사진만 변경
		$("#newphoto").change(function(){
			
			var num=$(this).attr("num");
			
			var form=new FormData();
			form.append("photo",$("#newphoto")[0].files[0]);
			form.append("user_num",num);
			
			$.ajax({
				
				type: "post",
				dataType: "text",
				url: "photoupdate",
				processData: false,
				contentType: false,
				data: form,
				success: function(){
					
					location.reload();
				}
			});
		})
		
		//강제 호출
		$("#btnnewphoto2").click(function(){
			
			$("#newphoto2").trigger("click");
		});
		
		//프로필 편집 시 사진 미리보기하기
		$("#newphoto2").change(function(){
			
			 if($(this)[0].files[0]){
			  var reader=new FileReader();
			  reader.onload=function(e){
			   $("#showphoto").attr("src",e.target.result);
			  }
			  reader.readAsDataURL($(this)[0].files[0]);
			 }
		});
		
		//프로필 편집 미리보기 후 수정
		$("#btnupdate").click(function(){
					
					var num=$(this).attr("num");
					var addr=$("#uaddr").val();
					var email=$("#uemail").val();
					var hp=$("#uhp").val();
					
					var data="user_num="+num+"&user_addr="+addr+"&user_email="+email+"&user_hp="+hp;
					var form=new FormData();
					form.append("photo",$("#newphoto2")[0].files[0]);
					form.append("cover",$("#newcover2")[0].files[0]);
					form.append("user_num",num);
					
					$.ajax({
						
						type: "post",
						dataType: "text",
						url: "photoupdate",
						processData: false,
						contentType: false,
						data: form,
						success: function(){
							
							location.reload();
						}
					});
					
					$.ajax({
						
						type: "post",
						dataType: "text",
						url: "coverupdate",
						processData: false,
						contentType: false,
						data: form,
						success: function(){
							
							location.reload();
						}
					});
					
					$.ajax({
						
						type: "post",
						dataType: "text",
						url: "updateinfo",
						data: data,
						success: function(){
							
							location.reload();
						}
						
					});
				})
		
		//강제 호출
		$("#btncontentphoto").click(function(){
			
			$("#contentphoto").trigger("click");
		});
		
		//게시글 작성 시 사진 미리보기하기
		$("#contentphoto").change(function(){
			
			 if($(this)[0].files[0]){
			  var reader=new FileReader();
			  reader.onload=function(e){
			   $("#showimg").attr("src",e.target.result);
			  }
			  reader.readAsDataURL($(this)[0].files[0]);
			 }
		});
		
		//게시글 작성
		$("#btnwrite").click(function() {

			var post_access = $("#post_access").val();
			var post_content = $("#post_content").val();
			var num=$(this).attr("num");
			
			var form = new FormData();
			form.append("photo", $("#contentphoto")[0].files[0]);
			form.append("post_access", post_access);
			form.append("post_content", post_content);
			form.append("user_num",num);

			$.ajax({

				type : "post",
				dataType : "text",
				processData : false,
				contentType : false,
				data : form,
				url : "insertpost",
				success : function() {
					
					location.reload();
				}
			});
		});
		
		//게시물 삭제
		$(".delpost").click(function(){
			
			var post_num=$(this).attr("post_num");
			
			$.ajax({
				
				type: "get",
				dataType: "text",
				data: {"post_num":post_num},
				url: "deletepost",
				success: function(){
					
					location.reload();
				}
			});
		})

	})
</script>

<style type="text/css">
	html{
		background-color: #F0F2F5;
	}

	.cover{
			width: 100%;
			height: 300px;
			border-radius: 10px 10px;
		}
		
		.profile{
			width: 100%;
			height: 120px;
			background-color: white;
		}
		
		.menu{
			width: 100%;
			height: 50px;
			background-color: white;
		}
		
		.mypage-main{
			margin: 0 auto;
		}
		
		.intro{
			width: 98%;
			height: 320px;
			background-color: white;
			border-radius: 10px 10px;
			margin: 10px;
			
		}
		
		.galary{
			width: 98%;
			height: 550px;
			background-color: white;
			border-radius: 10px 10px;
			margin: 10px;		
		}
		
		.friend{
			width: 98%;
			height: 700px;
			background-color: white;
			border-radius: 10px 10px;
			margin: 10px;
		
		}
		
		 .write{
			width:99%;
			height: 100px;
			background-color: white;
			border-radius: 10px 10px;
			margin: 10px;
		}
		
		.content{
			width:99%;
			height: 100%;
			background-color: white;
			border-radius: 10px 10px;
			margin: 10px;
		}
		
		.left{
			width: 38%;
			float: left;
			
		}
		
		.right{
			width:62%;
			float: right;
		}
		
		#btnnewcover{
			cursor: pointer;
			color: white;
			background-color: black;
			padding: 6px 16px;
			border-radius: 5px;
			position: relative;
			left: 85%;
			bottom:20%;
		}
		
		.btnprofile{
			position: relative;
    		bottom: 27%;
    		left: 87%;
    		font-weight: bold;
		}
		
		#btnupdate{
			width:570px;
			background-color: lightblue;
			color: blue;
			font-weight: 700;
		}
		
		#btnwrite{
			width: 570px;
			background-color: lightblue;
			color: white;
			font-weight: 700;
		}
		
		.top-user{
			display: flex; 
			align-items: center;		 
		}
		
		.top-writeday{
			display: flex;
			flex-direction: column;
		}
		
		.center-up{
			margin-left: 10px;
		}
		
		.bottom{
			margin: 2%;
		}
		
		.galary-photo{
			width: 160px;
			height: 160px;
			border-radius: 10px;
			border: 1px solid gray;
			margin: 1% 1% 0.25% 1%;
		}
		
		.galary-photoall{
			display: flex;
			flex-wrap: wrap;
		}
		
		.bottom-up{
			display: flex; 			
		}
		
		.like{
			width: 50%;
		}
		
		.comment{
			width: 50%;
		}
		
		.friend-photoall{
			display: flex;
			flex-wrap: wrap;
		}
		
		.friend-photo{
			width: 160px;
			height: 160px;
			border-radius: 10px;
			border: 1px solid gray;
		}
		
</style>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>"/>



	
	
		<div class="container">
		  <!-- Modal -->
		  <div class="modal fade" id="infoupdate" role="dialog">
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
		          	<span style="color:lightblue; cursor: pointer;"><a id="btnnewphoto2" >수정</a></span>
		          	<input type="file" id="newphoto2" name="newphoto2" style="display: none;">
		
		          	<div class="modal-photo">
		          		<c:if test="${sessionScope.loginok!=null &&  dto.user_photo!=null}">
		          			<img src="${root }/photo/${dto.user_photo}" id="showphoto" style="width: 180px; height: 180px; border-radius: 90px; margin: 3% 34%;
		          			border:3px solid gray;">
		          		</c:if>
		          		
		          		<c:if test="${sessionScope.loginok!=null &&  dto.user_photo==null}" >
		          			<img src="${root }/image/profile.png" id="showphoto"  style="width: 180px; height: 180px; border-radius: 90px; margin: 3% 34%;">
		          		</c:if>
		          		
		          	</div>
		          </div>
		          
		          <div class="title-cover">
		          	<span style="font-weight: 700; margin-right: 465px; font-size: 12pt;">커버 사진</span> 
		          	<span style="color:lightblue; cursor: pointer;"><a id="btnnewcover2">수정</a></span>
		          	<input type="file" id="newcover2" name="newcover2" style="display: none;">
		          	
		          	<div class="modal-cover">
		          		<c:if test="${sessionScope.loginok!=null &&  dto.user_cover!=null}">
		          			<img src="${root }/cover/${dto.user_cover}" id="showcover" style="width: 400px; height: 150px; border-radius: 10px; margin: 3% 16%;">
		          		</c:if>
		          		
		          		<c:if test="${sessionScope.loginok!=null &&  dto.user_cover==null}" >
		          			<img src="${root }/image/cover.png" id="showcover" style="width: 400px; height: 150px; border-radius: 10px; margin: 3% 16%;">
		          		</c:if>
		          	</div>
		          </div>
		          
		          <div class="title-intro">
		          	<span style="font-weight: 700; margin-right: 264px; font-size: 12pt;">회원님을 소개할 항목을 구성해주세요</span> 
			          	<div class="modal-intro">
			          		<input type="text" id="uaddr" class="form-control" value="${dto.user_addr }"><br>
			      			<input type="text" id="uemail" class="form-control" value="${dto.user_email }"><br>
			      			<input type="text" id="uhp" class="form-control" value="${dto.user_hp }">
			          	</div>
		          </div>
		        </div>
		        
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal" id="btnupdate"  num="${dto.user_num }">정보 수정</button>
		        </div>
		      </div>
		      
		    </div>
		  </div>
		</div>
		
		<div class="container">
		  <!-- Modal -->
		  <div class="modal fade" id="contentwrite" role="dialog" >
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		      
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title" style="font-weight: 700; text-align: center;">게시물 만들기</h4>
		        </div>
		        
		        <div class="modal-body">
		          <img alt="" src="${root }/photo/${dto.user_photo}" style="width: 40px; height: 40px; border-radius: 20px;">
		          <span>${dto.user_name }</span><br>
		          <select class="form-control" name="post_access" id="post_access" style="width: 25%;">
					<option value="all">전체공개</option>
					<option value="follower">팔로워 공개</option>
					<option value="onlyme">나만보기</option>
				</select>
		          <input type="text" id="post_content"  placeholder="무슨 생각을 하고 계신가요?" style="border: none; width: 100%; outline: none;"><br>
		          
				  <img id="showimg" style="width: 500px; height: 150px; border: 1px solid gray; border-radius: 10px;"><br>
				  <input type="file" multiple="multiple" id="contentphoto" name="contentphoto" style="display: none;">
				  <button type="button" id="btncontentphoto">사진 선택</button>

		        </div>
		        
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal" id="btnwrite" num="${dto.user_num }">게시</button>
		        </div>
		        
		      </div>
		      
		    </div>
		  </div>
		  
		</div>
		
		<div class="mypage" >
		
			<div class="cover">	
			
				<c:if test="${sessionScope.loginok!=null && dto.user_cover!=null }">
					<img src="${root }/cover/${dto.user_cover }"style="width: 100%; height: 100%; ">
				</c:if>
				
				<c:if test="${sessionScope.loginok!=null && dto.user_cover==null }">
					<img src="${root }/image/cover.png"style="width: 100%; height: 100%;">
				</c:if>
				
						<input type="file" id="newcover" style="display: none;" num="${dto.user_num }">
						
						<!-- 수정 시 호출 -->
						<c:if test="${sessionScope.user_num==dto.user_num }">
							<button type="button" id="btnnewcover" >
								<img style="width: 30px; height: 30px;" alt="" src="${root }/image/camera.png">커버 사진 추가
							</button>
						</c:if>
			</div>
			
			<div class="profile">                         
				<div class="dropdown" style="width: 0%; height: 82%; position: relative; left: 10%;">
				
					<input type="file" id="newphoto" style="display: none;" num="${dto.user_num }">
								
						    <ul class="dropdown-menu">
						      <li><a href="${root }/photo/${sessionScope.user_photo}">프로필 사진 보기</a></li>
						      <c:if test="${sessionScope.user_num==dto.user_num }">  
						      	<li><a href="#" id="btnnewphoto">프로필 사진 업데이트</a></li>
						       </c:if>
						    </ul>			    
					     
						<c:if test="${sessionScope.loginok!=null && dto.user_photo!=null }">
					    <img data-toggle="dropdown" alt="" src="${root }/photo/${dto.user_photo}" 
					    style="width: 180px; height: 180px; border:3px solid gray; cursor: pointer; border-radius: 90px; position: relative; bottom: 80%;">
					    </c:if>
					    
					    <c:if test="${sessionScope.loginok!=null && dto.user_photo==null }">
					    <img data-toggle="dropdown" alt="" src="${root }/image/profile.png" 
					    style="width: 180px; height: 180px; cursor: pointer; border-radius: 90px; position: relative; bottom: 80%;">
					    </c:if>
					    
					   <img alt="" src="${root }/image/camera.png" style="width: 50px; height: 50px; cursor: pointer;
					   position: relative; bottom:125%;">			
					  
				</div>
				
				<c:if test="${sessionScope.user_num==dto.user_num }">
					<button type="button" class="btnprofile" data-toggle="modal" data-target="#infoupdate" style="border-radius: 5px; border: none;">
						<img alt="" src="${root }/image/pencil.png" style="width: 30px; height: 30px;">프로필 편집
					</button>
				</c:if>
			</div>
			
			<div class="menu">
			<hr style="border: 1px solid lightgray; margin:0px;">
				<div style="font-weight: bold; font-size: 15pt;">
					<a href="/user/mypage" style="color: black;"><span>게시글</span></a>
					<a href="/user/info" style="color: black;"><span>정보</span></a>
					<a href="/user/friend" style="color: black;"><span>친구</span></a>
				</div>
			</div>
			
			<div class="mypage-main">
				<div class="left">
					<div class="intro">
						<span><b style="font-size: 16pt;">소개</b></span>
						<div class="intro-info">
							<span><img src="${root }/image/home.png">&nbsp;&nbsp;&nbsp;&nbsp;<b>${dto.user_addr }</b>&nbsp;&nbsp;거주</span><br>
							<span><img src="${root }/image/location.png">&nbsp;&nbsp;&nbsp;&nbsp;<b>${dto.user_addr.substring(0, 2)}</b>&nbsp;&nbsp;출신</span><br>
							<span><img src="${root }/image/follow.png">&nbsp;&nbsp;&nbsp;&nbsp;<b>${followercount }</b>&nbsp;&nbsp;명이 팔로우함</span><br>
							<span><img style="width:30px; height: 35px;" src="${root }/image/email.png">&nbsp;&nbsp;&nbsp;&nbsp;<b>${dto.user_email }</b>&nbsp;&nbsp;</span><br>
							<span><img style="width:30px; height: 35px;" src="${root }/image/hp.png">&nbsp;&nbsp;&nbsp;&nbsp;<b>${dto.user_hp }</b>&nbsp;&nbsp;</span>
						</div>
						
					</div>
					
					<div class="galary">
						<b style="font-size: 16pt;">사진</b>
							<div class="galary-photoall">
								<c:forEach var="pdto" items="${postlist }" varStatus="i">
									<c:if test="${i.count <= 9 && pdto.post_file!='no'}">
										<img  class="galary-photo" src="${root }/post_file/${pdto.post_file }">
									</c:if>
								</c:forEach>
							</div>
					</div>
					
					<div class="friend">
						<b style="font-size: 16pt;">친구</b><br>
						친구 ${followcount }명
							<div class="friend-photoall">
								<c:forEach var="fdto" items="${tflist }" varStatus="i">
									<div style="margin: 1% 1% 0.25% 1%;">
										<div>							
											<c:if test="${ fdto.user_photo!=null }">
												<img  class="friend-photo" src="${root }/photo/${fdto.user_photo}">
											</c:if>
											<c:if test="${fdto.user_photo==null }">
												<img  class="friend-photo" src="${root }/image/noprofile.png">
											</c:if>
											<div>
												<span><b>${fdto.user_name }</b></span><br>
												<span>함께 아는 친구 ${fdto.tf_count }명</span>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
					</div>
				</div>
				
				<div class="right">
					<div class="write">
						<div class = "searcharea">
							<div style = "width: 700px; display: inline-flex; align-items: center; margin: 3%;">
							
							<img alt="" src="${root }/photo/${dto.user_photo}" style="width: 40px; height: 40px; border-radius: 20px;">
							&nbsp;&nbsp;&nbsp;
							
							<c:if test="${sessionScope.user_num==dto.user_num }">  
								<div style="background-color: #F0F2F5; border-radius: 60px; padding-left: 2%">
									<input type = "button" data-toggle="modal" data-target="#contentwrite" name = "contentwirte" 
									style = "width:700px; border: none; text-align:left; background: none; outline: none; font-size: 15pt; padding: 10px;" value="무슨 생각을 하고 계신가요?">
								</div>
							</c:if>
							
							<c:if test="${sessionScope.user_num!=dto.user_num }">  
								<div style="background-color: #F0F2F5; border-radius: 60px; padding-left: 2%">
									<input type = "button" data-toggle="modal" data-target="#contentwrite" name = "contentwirte" 
									style = "width:700px; border: none; text-align:left; background: none; outline: none; font-size: 15pt; padding: 10px;" value="${dto.user_name } 님에게 글을 남겨보세요...">
								</div>
							</c:if>
							
							</div>	
						</div> 
					</div>
					
					<c:forEach var="pdto" items="${postlist }">
						<div class="content">
								<div class="divmain">
									<div class="top">
										<div class="top-user">
											<img alt="" src="${root }/photo/${dto.user_photo}" style="width:40px; height: 40px; border-radius: 20px; margin: 10px;">
												<div class="top-writeday">
													<span><b>${dto.user_name }${pdto.post_access }</b></span>
													<span>${pdto.post_writeday }</span>		
												</div>
												<c:if test="${sessionScope.user_num==dto.user_num }">
													<div class="dropdown" style="margin-left: 70%;">
														<img src="${root }/image/menu.png" data-toggle="dropdown" style="width:50px; height: 50px; cursor: pointer;">
														
														<ul class="dropdown-menu dropdown-menu-right">
													      <li><a href="#" class="delpost" post_num=${pdto.post_num }>게시글 삭제</a></li>
													    </ul>
													</div>
												</c:if>
										</div>
									</div>

									<div class="center">
										<div class="center-up">${pdto.post_content }</div>
											<c:if test="${pdto.post_file!='no' }">
												<div class="center-down" >
													<img src="/post_file/${pdto.post_file }" style="width: 100%;height: 500px;">
												</div>
											</c:if>
									</div>

									<div class="bottom">
									<hr style="border: 1px solid #ced0d4; margin-bottom: 1%;">
									
										<div class="bottom-up">
											<div class="like">
												<span><img src="${root }/image/like.png" style="width: 20px; height: 20px;">&nbsp;&nbsp;좋아요</span>
											</div>
											<div class="comment">
												<span><img src="${root }/image/comment.png" style="width: 20px; height: 20px;">&nbsp;&nbsp;댓글</span>
											</div>
										</div>
										
										<div class="bottom-down">
											<hr style="border: 1px solid #ced0d4; margin-bottom: 1%;">
												<div class="searcharea">
														<div style="width: 700px; display: inline-flex; align-items: center;">
															<div>
																<img alt="" src="${root }/photo/${dto.user_photo}" style="width:40px; height: 40px; border-radius: 20px; margin: 10px;">
															</div>
															<div style="background-color: #F0F2F5; border-radius: 60px; display: inline-flex; align-items: center; padding-left: 2%"> 
																	<input type="text" name="commentwrite" style="width: 700px; border: none; background: none; outline: none; font-size: 15pt; padding: 10px;"
																	placeholder="댓글을 입력하세요...">
																	<img alt="" src="${root }/image/submit.png" style="width: 30px; height: 30px; margin-right: 3%;">
															</div>
														</div>
												</div>
										</div>
									</div>
									
								</div>
							</div>
					</c:forEach>	
				</div>
			</div>
			
		</div>

</body>
</html>