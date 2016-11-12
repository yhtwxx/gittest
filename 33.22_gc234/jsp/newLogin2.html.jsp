<html>
<head>

<title>longsnake88 Flash</title>

<script type="text/javascript" src="http://cache.download.banner.longsnake88.com/integrationjs.php"></script>

<script type="text/javascript">
 iapiSetCallout('Login', calloutLogin);
 iapiSetCallout('Logout', calloutLogout);

 function login(realMode) {
  iapiLogin(document.getElementById("loginform").username.value.toUpperCase(), document.getElementById("loginform").password.value, realMode, "en");
 }

 function logout(allSessions, realMode) {  
  iapiLogout(allSessions, realMode);
 }

function calloutLogin(response) {
 if (response.errorCode) {
alert("Login failed, " + response.errorText);
  }
else {
window.location = "main.html";
}
}

function calloutLogout(response) {
 if (response.errorCode) {
 alert("Logout failed, " + response.errorCode);
 }
 else {
 alert("Logout OK"); 
 }
}
</script>

</head>
<body>

<b>LongSnake88 Flash</b><br>
Please enter your username and password and then press the Login button<br><br>
<form id="loginform">
Username: <input type="text" name="username"><br>
Password: <input type="text" name="password">
</form>
<input type="submit" value="Login" onclick="login(1)">
<br><br><br><br><a><a href="javascript:logout(1,1)">LOGOUT</a>

</body>
</html>