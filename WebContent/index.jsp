

<!DOCTYPE html>
<%
session.setAttribute("userid", null);
session.invalidate();

%>
<html>
<head>
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Bootstrap -->
<!--  <link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" />   
 -->


<!--  <link
	href='//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css'
	rel='stylesheet'> 
  -->



<link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">


<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/html5.js"></script>
<script src="js/css3-mediaqueries.js"></script>



<!-- <link href="css/font-awesome.css" rel="stylesheet" /> -->




<style>
.text-center1 {
	margin-left: 40%;
}

.text-center2 {
	margin-left: 35%;
}

body {
	display: block;
	/* margin: 8px; */
}

.container {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

.input-group-addon:first-child {
	border-right: 0;
}

.input-group-addon:first-child {
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
}

.input-group .form-control:last-child {
	border-bottom-left-radius: 0;
	border-top-left-radius: 0;
}

input,textarea,keygen,select,button,isindex {
	margin: 0em;
	font: -webkit-small-control;
	color: initial;
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
}

.col-md-offset-3 {
	margin-top: 3%;
	margin-left: 28%;
}

.container {
	max-width: 1170px;
}

input,textarea,keygen,select,button,isindex,meter,progress {
	-webkit-writing-mode: horizontal-tb;
}

/*  [class^="icon-"],[class*=" icon-"] {
	display: inline;
	width: auto;
	height: auto;
	line-height: normal;
	vertical-align: baseline;
	background-image: none;
	background-position: 0% 0%;
	background-repeat: repeat;
	margin-top: 0;
}
 */
.col-md-6 {
	width: 40%;
	float: left;
	position: relative;
	min-height: 1px;
	padding-right: 15px;
	padding-left: 15px;
}

.margin-base-vertical {
	margin: 40px 0;
}

h1 {
	font-family: "Abel", Arial, sans-serif;
	font-weight: 400;
	font-size: 40px;
}

p {
	margin: 0 0 10px;
	display: block;
	-webkit-margin-before: 1em;
	-webkit-margin-after: 1em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
}

body { /* padding-top: 20px; */
	background-image: -webkit-radial-gradient(cover, #FFF, #f2f2f2);
	background-image: -moz-radial-gradient(cover, #FFF, #f2f2f2);
	background-image: -o-radial-gradient(cover, #FFF, #f2f2f2);
	background-image: radial-gradient(cover, #FFF, #f2f2f2);
	-webkit-box-shadow: inset 0 1px rgba(255, 255, 255, 0.3), inset 0 0 1px
		1px rgba(255, 255, 255, 0.1), 0 2px 10px rgba(0, 0, 0, 0.5);
	box-shadow: inset 0 1px rgba(255, 255, 255, 0.3), inset 0 0 1px 1px
		rgba(255, 255, 255, 0.1), 0 2px 10px rgba(0, 0, 0, 0.5);
	background:
		url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZmZmZmZiIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9Ijc5JSIgc3RvcC1jb2xvcj0iI2YxZjFmMSIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNmNmY2ZjYiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
	font-size: 16px;
	/* font-family: "Open Sans", serif; */
	font-size: 16px;
}

h1 {
	font-family: "Abel", Arial, sans-serif;
	font-weight: 400;
	font-size: 40px;
}

form {
	display: block;
	margin-top: 0em;
}

div {
	display: block;
}

}
.row {
	margin-right: -15px;
	margin-left: -15px;
}

.margin-base-vertical {
	margin: 40px 0;
}

.information-box {
	background: #E5F5F9;
	/* border: 1px solid #CAE0E5; */
	color: #5A9BAB;
	padding: 0.833em 0.833em 0.833em 0.833em;
	margin-bottom: 0.833em;
	color: #5A9BAB;
	padding: 0.833em 0.833em 0.833em 0.833em;
	margin-bottom: 0.833em;
	border: 1px solid #CAD4D8;
	border-bottom-color: #CAD4D8;
	border-radius: 5px;
	background-image: -webkit-radial-gradient(cover, #FFF, #E9E9E9);
	background-image: -moz-radial-gradient(cover, #FFF, #E9E9E9);
	background-image: -o-radial-gradient(cover, #FFF, #E9E9E9);
	background-image: radial-gradient(cover, #FFF, #E9E9E9);
	-webkit-box-shadow: inset 0 1px rgba(255, 255, 255, 0.3), inset 0 0 1px
		1px rgba(255, 255, 255, 0.1), 0 2px 10px rgba(0, 0, 0, 0.5);
	box-shadow: inset 0 1px rgba(255, 255, 255, 0.3), inset 0 0 1px 1px
		rgba(255, 255, 255, 0.1), 0 2px 10px rgba(0, 0, 0, 0.5);
	background:
		url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2ZmZmZmZiIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9Ijc5JSIgc3RvcC1jb2xvcj0iI2YxZjFmMSIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiNmNmY2ZjYiIHN0b3Atb3BhY2l0eT0iMSIvPgogIDwvbGluZWFyR3JhZGllbnQ+CiAgPHJlY3QgeD0iMCIgeT0iMCIgd2lkdGg9IjEiIGhlaWdodD0iMSIgZmlsbD0idXJsKCNncmFkLXVjZ2ctZ2VuZXJhdGVkKSIgLz4KPC9zdmc+);
}

}
.round {
	border-radius: 0.3125em;
	-moz-border-radius: 0.3125em;
	-webkit-border-radius: 0.3125em;
}

.input-group {
	position: relative;
	display: table;
	border-collapse: separate;
	margin-left: 25%;
}

.input-group-addon {
	font-size: 14px;
	font-weight: normal;
	line-height: 1;
	text-align: center;
}

.input-group-addon,.input-group-btn {
	white-space: nowrap;
}

.input-group-addon {
	padding: 6px 12px;
	font-size: 14px;
	font-weight: normal;
	line-height: 1;
	text-align: center;
	background-color: #EEE;
	border: 1px solid #CCC;
	border-radius: 4px;
}

.input-group-addon,.input-group-btn {
	width: 1%;
	white-space: nowrap;
	vertical-align: middle;
	display: table-cell;
}

.input-group .form-control {
	display: table-cell;
}

.input-group .form-control {
	width: 60%;
	margin-bottom: 0;
}

.input-lg {
	height: 45px;
	padding: 10px 16px;
	font-size: 18px;
	line-height: 1.33;
	border-radius: 6px;
}

.head {
	margin-left: 25%;
	font-size: 24px;
	color: #0097B9;
	text-decoration: none;
	text-align: left;
	border-bottom-width: 1px;
	border-bottom-style: dashed;
	border-bottom-color: #D9D9D9;
	padding-left: 0px;
	width: 200px;
	padding-bottom: 8px;
	font-size: 24px;
}

#logo {
	margin-left: 50px;
}

#logo .brand {
	margin-right: 50px;
}

.logo-pic {
	float: left;
	height: 49px;
	width: 84px;
}

div.base-footer {
	/*  background-image: linear-gradient(to top, rgb(60, 79, 119),
		rgb(92, 118, 174) );
		 */
	background-image: url('img/footer.JPG');
	background-repeat: repeat-x;
	/*padding:4px;  */
	padding-left: 10px;
	color: #fff /* rgb(255, 255, 255) */;
	margin: 0 auto -2em;
}

.opacity-nav-bar-top {
	opacity: 0.8;
}

input,textarea,keygen,select,button,isindex {
	margin: 0em;
	font: -webkit-small-control;
	color: initial;
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
}

.form-control {
	display: block;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.428571429;
	color: #555;
	vertical-align: middle;
	background-color: #FFF;
	border: 1px solid #CCC;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	-webkit-transition: border-color ease-in-out .15s, box-shadow
		ease-in-out .15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

@media ( min-width : 1200px) {
	.push {
		min-height: 487px;
	}
}

/* Portrait tablet to landscape and desktop */
@media ( min-width : 768px) and (max-width: 979px) {
}

/* Landscape phone to portrait tablet */
@media ( max-width : 767px) {
	.col-md-6 {
		width: 100%;
		float: left;
		position: relative;
		min-height: 1px;
		padding-right: 15px;
		padding-left: 15px;
	}
	.col-md-offset-3 {
		margin-top: -5%;
		margin-left: -5%;
	}
	.information-box {
		background: none;
		color: #5A9BAB;
		border: none
	}
}

/* Landscape phones and down */
@media ( max-width : 480px) {

	.input-group-addon{
	
	padding:2px;
	}
	
	.col-md-6 {
		width: 100%;
		float: left;
		position: relative;
		min-height: 1px;
		padding-right: 15px;
		padding-left: 15px;
	}
	.information-box {
		background: none;
		border: none;
		color: #5A9BAB;
	}
	.col-md-offset-3 {
		margin-top: -20%;
		margin-left: -5%;
	}
	.head {
		margin-left: 0%;
		font-size: 24px;
		color: #0097B9;
		text-decoration: none;
		text-align: left;
		border-bottom-width: 1px;
		border-bottom-style: dashed;
		border-bottom-color: #D9D9D9;
		padding-left: 0px;
		width: 200px;
		padding-bottom: 8px;
		font-size: 24px;
	}
	.input-group .form-control {
		width: 90%;
		margin-bottom: 0;
	}
	.input-group {
		position: relative;
		display: table;
		border-collapse: separate;
		margin-left: 0%;
	}
	div.base-footer {
		margin-left: -20px;
		margin-right: -20px;
	}
	a.brand.logo-name {
		margin-left: -20%;
	}
}
</style>

</head>
<body>
	<div class="navbar navbar-fixed-top opacity-nav-bar-top"
		style="position: static">
		<div class="navbar-inner">
			<div class="container" id="logo">
				 <a class="brand logo-name hidden-desktop" href="#"
					style="font-size: 18px"></a> 


			</div>
		</div>
	</div>
	<br />
	<br />
	<br />
	<br />
	<div class="container push">

		<div class="row">
			<div class="col-md-6 col-md-offset-3 information-box round">

				<p class="margin-base-vertical head">
					&nbsp;Login
				</p>

				
				<form class="margin-base-vertical" action="login.jsp" method="POST"
					id="login-form">
					<p class="input-group">
						<span class="input-group-addon"><span><img
								src="img/icon-user-login.JPG" style="height: 15px;" /></span></span> <input
							type="text" class="form-control input-lg" name="uname"
							id="login-username" placeholder="jons@gmail.com" />
					</p>
					<p class="input-group">
						<span class="input-group-addon"><span><img
								src="img/icon-lock-login.JPG" style="height: 15px;" /></span></span> <input
							type="password" class="form-control input-lg" name="pass"
							id="login-password" placeholder="" />
					</p>


					<p class="help-block text-center2">
						<small id="myModalLabel"><a href="Registration.jsp">
							Yet Not Registered ?</a></small>
					</p>
					<p class="text-center1">
						<button type="submit" class="btn btn-info">Log In</button>
					</p>
					</span>
				</form>

				<div id="forgotPassword" class="modal hide fade" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
					style="display: none;">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">X</button>
						<h3 id="myModalLabel">Forgot Password</h3>
					</div>
					
						<form id="forgotpassword" name="forgotpassword"
							action="requestToken.action" method="post"
							class="form-horizontal" novalidate="novalidate">
							<fieldset>
								<div class="control-group">
									<label class="control-label" for="emailId">Email ID</label>
									<div class="controls">
										<input type="text" name="emailId" value="" id="login-username"
											placeholder="example@example.com">
									</div>
								</div>
							</fieldset>
						</form>




					</div>
					
				</div>

			</div>
		</div>
	</div>



	<div class="navbar navbar-bottom base-footer">

		<ul
			style="position: fixed; bottom: 15px; right: 15px; z-index: 1000; color: black;"
			class="tas-notification-center"></ul>


		
	</div>
</body>
</html>