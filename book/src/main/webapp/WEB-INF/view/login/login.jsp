<%@page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="Form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        @import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');
        * {
            box-sizing: border-box;
        }



        .h1 {
            font-weight: bold;
            margin: 0;
        }

        .h2 {
            text-align: center;
        }

        .p {
            font-size: 14px;
            font-weight: 100;
            line-height: 20px;
            letter-spacing: 0.5px;
            margin: 20px 0 30px;
        }

        .span {
            font-size: 12px;
        }

     

        .button {
            border-radius: 20px;
            border: 1px solid rgb(255, 187, 0);
            background-color: rgb(255, 187, 0);
            color: rgb(0, 0, 0);
            font-size: 12px;
            font-weight: bold;
            padding: 12px 45px;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: transform 80ms ease-in;
        }

        .button:active {
            transform: scale(0.95);
        }

        .button:focus {
            outline: none;
        }

        .ghost {
            background-color: transparent;
            border-color: rgb(0, 0, 0);
        }

        .form {
            background-color: #111111;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 50px;
            height: 100%;
            text-align: center;
        }

        .input {
            background-color: #111111;
            color: rgb(255, 187, 0);
            border: none;
            padding: 12px 15px;
            margin: 8px 0;
            width: 100%;
        }

        .container {
            background-color: #111111;
            border-radius: 10px;
            box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
            position: relative;
            overflow: hidden;
            width: 768px;
            max-width: 100%;
            min-height: 480px;
        }

        .form-container {
            position: absolute;
            top: 0;
            height: 100%;
            transition: all 0.6s ease-in-out;
        }

        .sign-in-container {
            left: 0;
            width: 50%;
            z-index: 2;
        }

        .container.right-panel-active .sign-in-container {
            transform: translateX(100%);
        }

        .sign-up-container {
            left: 0;
            width: 50%;
            opacity: 0;
            z-index: 1;
        }

        .container.right-panel-active .sign-up-container {
            transform: translateX(100%);
            opacity: 1;
            z-index: 5;
            animation: show 0.6s;
        }

        @keyframes show {
            0%,
            49.99% {
                opacity: 0;
                z-index: 1;
            }
            50%,
            100% {
                opacity: 1;
                z-index: 5;
            }
        }

        .overlay-container {
            position: absolute;
            top: 0;
            left: 50%;
            width: 50%;
            height: 100%;
            overflow: hidden;
            transition: transform 0.6s ease-in-out;
            z-index: 100;
        }

        .container.right-panel-active .overlay-container {
            transform: translateX(-100%);
        }

        .overlay {
            background: rgb(255, 187, 0);
            background: -webkit-linear-gradient(to right, rgb(255, 187, 0), rgb(255, 206, 73));
            background: linear-gradient(to right, rgb(255, 187, 0), rgb(255, 206, 73));
            background-repeat: no-repeat;
            background-size: cover;
            background-position: 0 0;
            color: rgb(0, 0, 0);
            position: relative;
            left: -100%;
            height: 100%;
            width: 200%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }

        .container.right-panel-active .overlay {
            transform: translateX(50%);
        }

        .overlay-panel {
            position: absolute;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0 40px;
            text-align: center;
            top: 0;
            height: 100%;
            width: 50%;
            transform: translateX(0);
            transition: transform 0.6s ease-in-out;
        }

        .overlay-left {
            transform: translateX(-20%);
        }

        .container.right-panel-active .overlay-left {
            transform: translateX(0);
        }

        .overlay-right {
            right: 0;
            transform: translateX(0);
        }

        .container.right-panel-active .overlay-right {
            transform: translateX(20%);
        }



        .footer {
            background-color: #222;
            color: rgb(255, 187, 0);
            font-size: 14px;
            bottom: 0;
            position: fixed;
            left: 0;
            right: 0;
            text-align: center;
            z-index: 999;
        }

        .footer p {
            margin: 10px 0;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>Document</title>


</head>

<body style=" background: #09b7fc">

<div style=" ;
display: flex;
justify-content: center;
align-items: center;
flex-direction: column;
font-family: 'Montserrat', sans-serif;
height: 100vh;
margin: -20px 0 50px;">
<h2 class="h2">
    <a class="logo" href="${pageContext.request.contextPath}/list-book"><img style="height: 40px;width: 200px;


    margin-left: 50px;" id="logobetran" src="img/header_logo.png" alt="Stori"></a>
</h2>
   <c:if test="${message!=null}">
       <h1>${message}</h1>
   </c:if>
<div class="wrap" class="loginform">
    <div class="container" id="container">
        <div class="form-container sign-up-container">
                <div class="form">
                    <form action="saveUser" method="post">


                <h1 class="h1" style="color: rgb(255, 187, 0)">Create Account</h1>

                <span>

                </span>

                <input class="input"  type="text" name="username" placeholder="Username" />
                <input class="input"  type="password" name="password" placeholder="Password" />
                <button  class="button" type="submit">Sign Up</button>
                    </form>
                </div>

        </div>
        <div class="form-container sign-in-container">
            <div class="form">
                <form action="login" method="post">
                <h1 class="h1" style="color: rgb(255, 187, 0)">Sign in</h1>

                <span></span>
                <input class="input"  type="text" name="user_login" placeholder="Username" />
                <input  class="input" type="password" name="pass_login" placeholder="Password" />
                <a href="#">Forgot your password?</a>
                <button class="button">Sign In</button>
                </form>
            </div>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1 class="h1">Welcome Back!</h1>
                    <p>To keep connected with us please login with your personal info</p>
                    <button class="button" class="ghost" id="signIn">Sign In</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Hello, Friend!</h1>
                    <p>Enter your personal details and start journey with us</p>
                    <button class="button" class="ghost" id="signUp">Sign Up</button>
                </div>
            </div>
        </div>
    </div>


</div>
<footer class="footer">
    <p>
        <strong>            Trần Trí Viễn - N17DCAT076
        </strong>

    </p>
</footer>
</div>
<script>
    const signUpButton = document.getElementById('signUp');
    const signInButton = document.getElementById('signIn');
    const container = document.getElementById('container');

    signUpButton.addEventListener('click', () => {
        container.classList.add("right-panel-active");
    });

    signInButton.addEventListener('click', () => {
        container.classList.remove("right-panel-active");
    });
</script>
</body>

</html>