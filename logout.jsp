<html>
<body style="background-color: lavender;">
<%		
	try
	{
		String w =(String)session.getAttribute("login");
		if(w.equalsIgnoreCase("Yes"))
		{
			session.invalidate();

%>

		<center>
				<div style="position: absolute;left: 300px;top: 300px;">
					<font face="cosmic sans ms" size="10px" color="red">
						&#128075; Logout Successfully....
					</font>
				</div>
		</center>
<%
		}
	}
	catch(Exception ex)
	{
%>
		<center>
				<div style="position: absolute;left: 300px;top: 300px;">
					<font face="cosmic sans ms" size="10px" color="green">
						&#128516;!!You Have'nt Login yet!! &#128516;
					</font>
				</div>
		</center>
<%
		}
%>	
	</body>
</html>