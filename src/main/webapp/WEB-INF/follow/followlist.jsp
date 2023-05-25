<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<script src="https://kit.fontawesome.com/d178b85e81.js" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&family=Sunflower&display=swap" rel="stylesheet">
<style type="text/css">
.addbtn img {
	width: 25px;
}

.userbox {
	width: 400px;
	height: 200px;
	border: 1px solid gray;
	border-radius: 5px;
	margin-right: 10px;
	margin-bottom: 10px;
	display: inline-flex;
	align-items: center;
	justify-content: center;
}

.up{
	border: none;
	border-radius: 100px;
	margin-left: 15px;
	margin-right: 10px;
	width: 80px;
	height: 80px;
	overflow: hidden;
	text-align: center;
}

.userphoto {
	border-radius: 100px;
	float: left;
	height: 80px;
	width: 80px;
}

.un {
	width: 200px;
	float: left;
	/* line-height:50px;
	display: inline-block; */
	display: flex;
	flex-direction: column;
	font-size:13px;
	font-weight:bold;
	padding-left: 15px;
	justify-content: center;
	margin-right: 20px;
}

.btndiv {
	width: 10%;
	float:right;
	margin: 0 auto;
}

.addbtn {
	width: 10px;
	height: 10px;
	background-color:#fff;
	border:none;
	z-index: 1;
	
}

.tf{
	font-size: 9px;
}

.friendmenu{
	position : absolute;
	width: 220px;
	height: 80px;
	border: 4px solid gray;
	border-radius: 10px;
	border : none;
	box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
	background-color: white;
	padding-top: 15px;
	
}

.detailbtn button{
	border: none;
	background: none;
	outline: none;
	font-size: 3px;
	
}

.detailbtn button{
	border: none;
	background: none;
	outline: none;
	font-size: 3px;
}
.section{
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	width: 820px;
	margin: 0 auto;
}
.followlist{
	border: 1px solid gray; 
	display: flex; 
	justify-content: center; 
	width: 900px; 
	flex-direction: column; 
	margin-top: 30px;
	margin: 0 auto;
}


</style>
</head>
<script type="text/javascript">
$(document).on("click", ".addbtn", function() {
	  var $parentBox = $(this).closest(".userbox");
	  var $friendMenus = $(".friendmenu");

	  // 클릭한 부모 상자 안의 friendmenu를 제외한 모든 friendmenu를 숨깁니다.
	  $friendMenus.not($parentBox.find(".friendmenu")).hide();
	});
</script>
<body>

	<div class = "followlist">
	<div style="display: inline-flex; align-items: center; justify-content: space-between; margin-top: 20px;">
	<span style="margin-left:35px; margin-bottom: 20px; font-size: 20pt; font-weight: bold;">친구</span>
	
	<div style=" margin-right:60px; background-color: #F0F2F5; border-radius: 60px; display: inline-flex; align-items: center; padding-left: 2%">
						<span class = "glyphicon glyphicon-search" style = "font-size: 16pt;"></span>
						<input type = "text" name = "searchword" class="followsearchbox"
						style = " width:150px; height:30px; border: none; background: none; outline: none; font-size: 13pt;
						padding: 10px;" placeholder="검색">
	</div>
	</div>
	<section class = "section">
		<c:forEach var = "dto" items = "${list }">
			<div class="userbox" >

				<c:if test="${dto.user_photo!=null}">
					<div class="up">
						<img src="/photo/${dto.user_photo }" class="userphoto">
					</div>
				</c:if>

				<c:if test="${dto.user_photo==null}">
					<div class="up">
						<img src="../image/noimg.png" class="userphoto">
					</div>
				</c:if>
				<div class="un">
					<span>${dto.user_name }</span> 
					<c:if test="${dto.tf_count>0 }">
						<span class="tf" style="font-size: 11px;">함께아는친구: ${dto.tf_count }</span>
					</c:if>
				</div>
				<div class="btndiv">
					<button type="button" class="addbtn" fing_num = ${dto.fing_num }><img src="../image/add.png"></button>
					
					<div class="friendmenu" id="${dto.fing_num }">
								
								<div class = "detailbtn">
								 
								<c:if test="${dto.bookmarkcheck!=1 }">
								<button type="button" class="insbookbtn" bfriend_num = "${dto.to_user }"><b><span style="font-size: 15pt;">
								<i class="fa-star fa-regular" style="color: #ffd43b;"></i> 
								즐겨찾기추가</span></b></button>
								</c:if>
								
								<c:if test="${dto.bookmarkcheck==1 }">
								<button type="button" class="delbookbtn" bfriend_num = "${dto.to_user }"><b><span style="font-size: 15pt;">
								<i class="fa-solid fa-star" style="color: #ffd43b;"></i> 
								즐겨찾기취소</span></b></button>
								</c:if>
								</div>
								
								
								<div class = "detailbtn">
								<button type = "button" class="fldelete"  to_user = ${dto.to_user }><b><span style="font-size: 15pt; margin-left: 4px;">
								<i class="fa-solid fa-xmark" style="color: #cd2323;"></i>
								팔로우취소</span></b></button>
								</div>
					</div>
					</div>
				</div>
		</c:forEach>
		
		
		
	</section>
	
	</div>
	<script type="text/javascript">
		
		offset = ${offset};
		
		$(".friendmenu").hide();

		$(document).on("click",".addbtn",function(){

			var fing_num = $(this).attr("fing_num");
			
			$("#"+fing_num).toggle();
		});
		
		$(document).on("click", ".insbookbtn", function(){
		    var owner_num = "${sessionScope.user_num}";
		    var bfriend_num = $(this).attr("bfriend_num");
		    var clickedElement = $(this);

		    $.ajax({
		        dataType: "text",
		        url: "insertbookmark",
		        type: "get",
		        data: {"owner_num": owner_num, "bfriend_num": bfriend_num},
		        success: function(){ 
		            clickedElement.removeClass("insbookbtn");
		            clickedElement.addClass("delbookbtn");
		            location.reload();
		        }
		    });
		});

		$(document).on("click", ".delbookbtn", function(){
		    var owner_num = "${sessionScope.user_num}";
		    var bfriend_num = $(this).attr("bfriend_num");
		    var clickedElement = $(this);

		    $.ajax({
		        dataType: "text",
		        url: "deletebookmark",
		        type: "get",
		        data: {"owner_num": owner_num, "bfriend_num": bfriend_num},
		        success: function(){
		            clickedElement.removeClass("delbookbtn");
		            clickedElement.addClass("insbookbtn");
		            location.reload();
		        }
		    });
		});
		
		$(document).on("click",".fldelete",function(){ 
			
			$.ajax({
				dataType:"text",
				url:"deletefollowing",
				type:"get",
				data:{"to_user":$(this).attr("to_user")},
				success:function(){
					location.reload();
				}
			});
		});
		
		/* $(".addbtn").each(function(i,ele){
			$(".addbtn").eq(i).click(function(){
				$.each($(".friendmenu"),function(k,elt){
					if(i==k){
						$(elt).toggle();
					}else{
						$(elt).hide();
					}
				})
			})
		}) */
		
		
		window.onscroll = function(e) {

		      if((window.innerHeight + window.scrollY) >= document.body.scrollHeight) {
		    	  
		    	  
		    	  offset=offset+8;
		    	  $.ajax({
		    		 type:"get",
		    		 dataType:"json",
		    		 url:"followlistscroll",
		    		 data:{"offset":offset,"from_user":${from_user}},
		    		 success:function(res){
		    			 $.each(res,function(i,item){
		    				 setTimeout(function(){
		    					
		    		        		var s = "";
		    		        		if(item.user_photo != null){
		    		        			s += "<div class='up'><img src='/photo/"+item.user_photo+"' class='userphoto'></div>";
		    		        		}else{
		    		        			
		    		        			s += "<div class='up'><img src='../image/noimg.png' class='userphoto'></div>";
		    		        		}
		    		        		s += "<div class='un'><span>"+item.user_name+"</span>";
		    		        		
		    		        		if(item.tf_count > 0)
		    		        			s += "<span class='tf' style='font-size: 11px;'>함께아는친구: "+item.tf_count+"</span>";
		    		        		
		    		        		s += "</div>";
		    		        		s += "<div class='btndiv' style='margin: auto 0;'><button type='button' class='addbtn' fing_num = "+item.fing_num+"><img src='../image/add.png'></button>";
		    		        		s += "<div class='friendmenu' id="+item.fing_num+" style='display: none;'>";
									
									s += '<div class = "detailbtn">';
									 
									if(item.bookmarkcheck!=1){
									s += '<button type="button" class="insbookbtn" bfriend_num = '+item.to_user+'><b><span style="font-size: 15pt;">';
									s += '<i class="fa-star fa-regular" style="color: #ffd43b;"></i>&nbsp;즐겨찾기추가</span></b></button>';
									}
										
									
									if(item.bookmarkcheck==1){
									s += '<button type="button" class="delbookbtn" bfriend_num = '+item.to_user+'><b><span style="font-size: 15pt;">';
									s += '<i class="fa-solid fa-star" style="color: #ffd43b;"></i>&nbsp;즐겨찾기취소</span></b></button>';
									}
									s += '</div>';
									
									
									s += '<div class = "detailbtn">';
									s += '<button type = "button" class="fldelete"  to_user = '+item.to_user+'><b><span style="font-size: 15pt; margin-left: 4px;">';
									s += '<i class="fa-solid fa-xmark" style="color: #cd2323;"></i>&nbsp;팔로우취소</span></b></button>';
									s += '</div></div>';
									s += '</div>';
		    		        		
		    		        		
		    		             	var addContent = document.createElement("div");
		    		                addContent.classList.add("userbox");
		    		                addContent.innerHTML = s;
		    		                console.log(s);
		    		                document.querySelector('section').appendChild(addContent);
		    		              	
		    		         }, 100)  
		    			 })
		    		 }
		    	  });
		    	  
		       
		      }
		    }
			
		
			$(".followsearchbox").keyup(function(e){
				if(e.keyCode == 13){
					alert("넘어감");
					location.href = "followsearch?searchword="+$(".followsearchbox").val();
				}
			});
	</script>
</body>
</html>