<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.3.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Stylish&family=Sunflower&display=swap" rel="stylesheet">
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <style>
        html, body {
            height: 100%;
        }

        body {
            overflow: hidden;
        }

        .wrapper {
            display: flex;
            justify-content: center; /* 가로 중앙. */
            align-items: center; /*새로중앙*/
            height: 100%;
        }

        .oauth_box_1 {
            display: flex;
            justify-content: space-around; /* 간격 */
            align-items: center;
        }

        .oauth_box_1 img {
            width: 40px;
        }

        .oauth_box_2 {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .footer {
            position: fixed; /* 이 부분을 고정 */
            bottom: 0; /* 하단에 여백 없이 */
            width: 100%; /* 가로 사이즈를 브라우저에 가득 채움 */
        }

        li {
            float:left;
        }
    </style>
</head>
<body>
<div class="main" style="height: 100vh; overflow-y: auto;">
    <div>

        <div class="wrapper">
            <div style="width: 30%;">
                <div style="margin: 0 auto; width: 90%;">
                    <p style="font-size: 50px; font-weight: bold;">HANDBOOK</p>
                    <p style="font-size: 20px;">
                        Handbook에서 전세계에 있는 친구, 가족 <br>지인들과 함께 이야기를 나눠 보세요.​
                    </p>
                </div>
            </div>
            <div style="width: 30%;">
                <div style="width: 60%; margin: 0 auto;">
                    <form action="/login/loginprocess" method="post">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디 입력" required="required">
                        </div>
                        <br>
                        <div class="form-floating">
                            <input type="password" class="form-control" id="user_pass" name="user_pass" placeholder="비밀번호 입력" required="required">
                        </div>
                        <br>
                        <div class="d-grid gap-2">
                            <button class="btn btn-primary btn-block" type="submit">로그인</button>
                        </div>
                        <br>

                        <!-- 외부 로그인 -->
                        <div class="oauth_box_1">
                            <img src="/image/logobtn/naver.png" onclick="location.href='${urlNaver}'" style="cursor: pointer;">
                            <img src="/image/logobtn/kakaotalk.png" onclick="location.href='${urlKakao}'" style="cursor: pointer;">
                            <img src="/image/logobtn/google.png" onclick="location.href='${urlGoogle}'" style="cursor: pointer;">
                        </div>
                        <br>
                    </form>

                    <div align="center">
                        <a href="/find/findemail">이메일 찾기</a> |
                        <a href="/find/findpass">비밀번호 찾기</a>
                    </div>
                    <br>
                    <div align="center">
                        <button type="button" class="btn btn-warning" onclick="location.href='/signupform'">새 계정 만들기</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer" style="margin: 0 auto;">
            <div class="row justify-content-center">
                <div class="col-md text-center">
                    <div class="footer-site-logo mb-4">
                        <a href="index.jsp">handbook</a>
                    </div>
                    <ul class="list-unstyled nav-links mb-5" style="font-size: 13px;">
                        <li><a href="#">About</a></li>
                        <li><a href="#">Contact</a></li>
                        <li><a href="#">Press</a></li>
                        <li><a href="#">Careers</a></li>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Legal</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>

                    <div class="social mb-4">
                        <h3>Stay in touch</h3>
                        <ul class="list-unstyled">
                            <li class="in"><a href="https://github.com/SIST1/TodayWithMyDoggy"><span class="icon-github"></span></a></li>
                            <li class="tw"><a href="https://github.com/lambdaramge"><span class="icon-github"></span></a></li>
                            <li class="fb"><a href="https://github.com/tenta3802"><span class="icon-github"></span></a></li>
                            <li class="dr"><a href="https://github.com/hesoo98"><span class="icon-github"></span></a></li>
                            <li class="pin"><a href="https://github.com/028902"><span class="icon-github"></span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    //브라우저 화면크기 바뀔 때마다 리로드하면서 중앙에 배치.
    var windowHeight = window.innerHeight;
    $(".main").css('height', windowHeight - 80);

    window.onresize = function (event) {
        location.reload();
    }
</script>
</body>
</html>