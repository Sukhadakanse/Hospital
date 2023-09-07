<html>
	<head>
		<link href="styles/style1.css" rel="stylesheet"/>
		<script type="text/javascript">
			function checkdata()
			{
				var msg="";

				if(document.f1.txt_username.value.trim() == "")
				msg=msg+"Username Required\n";
				
				if(document.f1.txt_password.value.trim()=="")
				msg=msg+"Password Required\n";

				if(msg != "")
				{
					alert(msg);
					return;
				}
				
				if(msg=="")
				{
					document.f1.submit();
				}
			}
		</script>
	</head>
	<body style="background-color: lavender;" >
		<center>
		<form action="login_verify.jsp" method="post" name="f1">
			<font face="algerian" size="35px" color="darkblue">
				Login Page
			</font><br/><br/>
			<fieldset>
			<table>
				<tr>
					<td>Username: </td>
					<td><input type="text" name="txt_username" placeholder="Enter Username"/></td>
				</tr>

				<tr>
					<td>Password: </td>
					<td><input type="password" name="txt_password" placeholder="Enter Password"/></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="button" name="btn_Submit" name="btn_login" value="Login" 
						style="background-color: darkblue;width:150;font-size: 20px;" onclick="checkdata()"/></td>
				</tr>
			</table>
		</fieldset>
		</form>	
		</center>
	</body>
</html>