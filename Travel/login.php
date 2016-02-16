<?php
error_reporting(0);
	if($_GET['error'] == "none"){
		header('Location: loginComplete.php');
	}
   include('header_side.php');
   include('db_connect.php');

   $error=$_GET['error'];
?>

<html>
<body>
<div id="fb-root"></div>
<script>
  window.fbAsyncInit = function() {
  FB.init({
    appId      : '329825160376877',
    status     : true, // check login status
    cookie     : true, // enable cookies to allow the server to access the session
    xfbml      : true  // parse XFBML
  });

  // Here we subscribe to the auth.authResponseChange JavaScript event. This event is fired
  // for any authentication related change, such as login, logout or session refresh. This means that
  // whenever someone who was previously logged out tries to log in again, the correct case below 
  // will be handled. 
  FB.Event.subscribe('auth.authResponseChange', function(response) {
    // Here we specify what we do with the response anytime this event occurs. 
    if (response.status === 'connected') {
      // The response object is returned with a status field that lets the app know the current
      // login status of the person. In this case, we're handling the situation where they 
      // have logged in to the app.
      testAPI();
    } else if (response.status === 'not_authorized') {
      // In this case, the person is logged into Facebook, but not into the app, so we call
      // FB.login() to prompt them to do so. 
      // In real-life usage, you wouldn't want to immediately prompt someone to login 
      // like this, for two reasons:
      // (1) JavaScript created popup windows are blocked by most browsers unless they 
      // result from direct interaction from people using the app (such as a mouse click)
      // (2) it is a bad experience to be continually prompted to login upon page load.
      FB.login();
    } else {
      // In this case, the person is not logged into Facebook, so we call the login() 
      // function to prompt them to do so. Note that at this stage there is no indication
      // of whether they are logged into the app. If they aren't then they'll see the Login
      // dialog right after they log in to Facebook. 
      // The same caveats as above apply to the FB.login() call here.
      FB.login();
    }
  });
  };

  // Load the SDK asynchronously
  (function(d){
   var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
   if (d.getElementById(id)) {return;}
   js = d.createElement('script'); js.id = id; js.async = true;
   js.src = "//connect.facebook.net/en_US/all.js";
   ref.parentNode.insertBefore(js, ref);
  }(document));

  // Here we run a very simple test of the Graph API after login is successful. 
  // This testAPI() function is only called in those cases. 
  function testAPI() {
    console.log('Welcome!  Fetching your information.... ');
    FB.api('/me', function(response) {
      console.log('Good to see you, ' + response.name + '.');
    });
  }
</script>



<div class="content">
<h2><center>Login to your account!</center></h2>
<!--
  Below we include the Login Button social plugin. This button uses the JavaScript SDK to
  present a graphical Login button that triggers the FB.login() function when clicked. -->

<fb:login-button show-faces="true" width="200" max-rows="1"></fb:login-button>

<h3><center>Don't have an account yet?  Click <a href = "register.php">here</a> to register!</center></h3><br/>
<table width=50% >
<?php  
//print errors if something is wrong with the user's input username and password:
   if ($error=="empty") {
?>
<left><b><h3><medium><font color="#FF0000">Both your username and password must be entered!</font></medium></h3></b></left>
<?php
   } else if ($error=="pwd") {
?>
       <left><b><h3><medium><font color="#FF0000">Your password was incorrect!  Try again!</font></medium></h3></b></left>
<?php
   } else if ($error=="username") {
?>
       <left><b><h3><medium><font color="#FF0000">The username you entered does not exist!  Try again!</font></medium></h3></b></left>
<?php
   } else if ($error=="incorrect") {
?>
       <left><b><h3><medium><font color="#FF0000">Incorrect username or password! Try again!</font></medium></h3></b></left>
<?php
   }
?>


<?php
//login form:
?>
<center>
<form action=submitLogin.php method="POST" >
<tr><td>Username: </td><td><input type="text" name="userName" />*</td></tr>
<tr><td>Password: </td><td><input type="password" name="password"  />*</td></tr>
</table>
<table>
<tr><td><small>*These fields are <b><u>required</b></u>!</small></td></tr>
<tr><td><br></td></tr>
<tr><td><input type="submit" value="Submit" class="formbutton"></td></tr>
</table>
</center>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

</div>


<?php
   include('footer.php');
?>


</body>
</html>