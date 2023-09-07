<%
	if(request.getMethod().equalsIgnoreCase("GET"))
	{
		response.sendRedirect("unauthorized.jsp");
	}

%>
<%@page import="java.sql.*"%>
<html>
<body style="background-color:lavender;">
<%
	
	if(request.getMethod().equalsIgnoreCase("POST"))
	{	
			try
			{
				String un = request.getParameter("txt_username").trim();
				String pass = request.getParameter("txt_password").trim();
				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Ujwal123");

				String sql="select username,password from receptionist where username=?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,un);
				ResultSet rs=ps.executeQuery();

				
				if(rs.next())
				{	
				 	String user = rs.getString("username");
				 	String password=rs.getString("password");
			
			
					if(pass.equalsIgnoreCase(password))
					{
						session.setAttribute("username",user);
						session.setAttribute("password",password);
%>
	<center>
		<div style="position: absolute;left: 300px;top: 300px;">
			<font face="cosmic sans ms" size="10px" color="green">
				<%=user%> you have login successfully....&#128077;
				<%
					session.setAttribute("login","yes");
				%>
			</font>
		</div>
	</center>
<%
						
					}
					else
					out.println("<font face='cosmic sans ms' size='10px' color='red'>Password Incorrect</font>");		
				}
				else
				{
						out.println("<font face='cosmic sans ms' size='10px' color='red'>Username Incorrect</font>");
						rs.close();
						ps.close();
						con.close();
				}
				out.println("</html></body>");
			}
			catch(Exception ex)
			{
				out.println(ex);
			}
			finally
			{
				out.close();
			}
		
	}
%>