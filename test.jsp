<html>
<body style="background-color: lavender;">
<%		
		if(session.getAttribute("username") && session.getAttribute("password"))
		{
			session.invalidate();

%>

		<center>
				<div style="position: absolute;left: 300px;top: 300px;">
					<font face="cosmic sans ms" size="10px" color="red">
						Logout Successfully....
					</font>
				</div>
		</center>
<%
		}
%>
	</body>
</html>