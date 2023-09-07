<%@page import="java.sql.*"%>
<html>
<head>
	<style>
			select
			{
				font-family: cosmic sans ms;
				font-size: 20px;
				width: 300px;
				height: 30px;
			}
			table
			{
				font-family: cosmic sans ms;
				font-size: 20px;
			}
			.class236
			{
				width: 100px;
				height: 30px;
				font-family: cosmic sans ms;
				font-size: 20px;
				color: white;
				background-color: darkblue;
			}
			th
			{
				font-family: cosmic sans ms;
				font-size: 18px;
				color: white;
				background-color: darkblue;
			}
			td
			{

				font-family: cosmic sans ms;
				font-size: 15px;
				color: darkblack;
				font-weight: bold;
				text-align: center;
			}
	</style>
	<script type="text/javascript">
		function checkdata()
		{
			msg="";

			if(document.f1.ddldoctor.value.trim()=="-1")
			msg=msg+"**Select Doctor\n";

			if(document.f1.ddltime.value.trim()=="-1")
			msg=msg+"**Select TIme\n";

			if(msg!="")
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
<body style="background-color: lavender;">
<%
	if(request.getMethod().equalsIgnoreCase("POST"))
	{
		String doctor =request.getParameter("ddldoctor").toUpperCase();
		String time = request.getParameter("ddltime").toUpperCase();
%>
		<form action="View_Appointments.jsp" method="post" name="f1">
			<center>
				<font face="algerian" size="30px" color="darkblue">
						APPOINTMENTS
				</font>
				<hr style="background-color:darkblue;height: 5px;" />
				<div style="left: 0p;top: 150px;">
					<table>
						<tr>
							<td>Select Doctor:</td>
							<td>
								<select name="ddldoctor">
									<option value="-1">Select Doctor</option>
									<option <% if(doctor.equalsIgnoreCase("Dr.Manoj Kapadia"))
												out.println("selected");
												%>
												>Dr.Manoj Kapadia</option>
									<option 
									<% if(doctor.equalsIgnoreCase("Dr.Kedar Jaiswal"))
												out.println("selected");
												%>>Dr.Kedar Jaiswal</option>
									<option <% if(doctor.equalsIgnoreCase("Dr.Aarohi Guptal"))
												out.println("selected");
												%> >Dr.Aarohi Gupta</option>
									<option <% if(doctor.equalsIgnoreCase("Dr.Chanchal Lalwani"))
												out.println("selected");
												%> >Dr.Chanchal Lalwani</option>
									<option  <% if(doctor.equalsIgnoreCase("Dr.Sandeep Bhavekar"))
												out.println("selected");
												%>>Dr.Sandeep Bhavekar</option>
									<option <% if(doctor.equalsIgnoreCase("Dr.Rajesh Patil"))
												out.println("selected");
												%>>Dr.Rajesh Patil</option>
								</select>
							</td>
							<td>Select Timing</td>
							<td>
								<select name="ddltime">
										<option value="-1">Select Time</option>
										<optgroup label="AM">
											<option <% if(time.equalsIgnoreCase("9am"))
												out.println("selected");
												%>>9am</option>
											<option <% if(time.equalsIgnoreCase("10am"))
												out.println("selected");
												%>>10am</option>
											<option <% if(time.equalsIgnoreCase("11am"))
												out.println("selected");
												%>>11am</option>
										</optgroup>
										<optgroup label="PM">
											<option <% if(time.equalsIgnoreCase("12pm"))
												out.println("selected");
												%>>12pm</option>
											<option <% if(time.equalsIgnoreCase("1pm"))
												out.println("selected");
												%>>1pm</option>
											<option <% if(time.equalsIgnoreCase("2pm"))
												out.println("selected");
												%>>2pm</option>
											<option <% if(time.equalsIgnoreCase("3pm"))
												out.println("selected");
												%>>3pm</option>
											<option <% if(time.equalsIgnoreCase("4pm"))
												out.println("selected");
												%>>4pm</option>
											<option <% if(time.equalsIgnoreCase("5pm"))
												out.println("selected");
												%>>5pm</option>
											<option <% if(time.equalsIgnoreCase("6pm"))
												out.println("selected");
												%>>6pm</option>
										</optgroup>
								</select>
							</td>
							<td><input  class="class236" type="button" name="btn_button" value="Search" onclick="checkdata()"/></td>
						</tr>
					</table>
				</div>
				<hr style="background-color:darkblue;height: 5px;" />

<%
		String sql="select full_name,doctor_name,timing from appointment where timing=? and doctor_name=?";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Ujwal123");

		PreparedStatement ps = con.prepareStatement(sql);
		//out.println(time);
		//out.println(doctor);
		ps.setString(1,time);
		ps.setString(2,doctor);
		
		ResultSet rs= ps.executeQuery();
%>		<div style="left: 0;top: 500;">
		<table border="1" cellpadding="5px" cellspacing="0" width="80%">
			<tr>
				<th>Full Name</th>
				<th>Doctor Name</th>
				<th>Timing</th>
			</tr>
<%		
		//out.println("Hello");
		while(rs.next())
		{	//out.println("Hello");
			String fn=rs.getString("full_name");
			String doc = rs.getString("doctor_name");
			String ti=rs.getString("timing");
			//out.println("Hello");
%>	
			<tr>
				<td><%=fn%></td>
				<td><%=doc%></td>
				<td><%=ti%></td>
			</tr>
<%
		}
		rs.close();
		ps.close();
		con.close();
%>			
			</div>	
			</table>
			</center>
		</form>		
<%
	}
%>

<%	try
	{
		int flag=0;

		if(request.getMethod().equalsIgnoreCase("GET"))
		{	
			String urep1=(String)session.getAttribute("username");
			String upass1=(String)session.getAttribute("password");
		
			if(urep1.equalsIgnoreCase("receptionist1")&&upass1.equalsIgnoreCase("reception1"))
			{	
				flag++;
			}

			if(urep1.equalsIgnoreCase("receptionist2")&&upass1.equalsIgnoreCase("reception2"))
			{
				flag++;
			}
		
			if(flag!=0)
			{
%>
		<form action="View_Appointments.jsp" method="post" name="f1">
			<center>
				<font face="algerian" size="30px" color="darkblue">
						APPOINTMENTS
				</font>
				<hr style="background-color:darkblue;height: 5px;" />
				<div style="left: 0p;top: 150px;">
					<table>
						<tr>
							<td>Select Doctor:</td>
							<td>
								<select name="ddldoctor">
									<option value="-1">Select Doctor</option>
									<option >Dr.Manoj Kapadia</option>
									<option >Dr.Kedar Jaiswal</option>
									<option >Dr.Aarohi Gupta</option>
									<option >Dr.Chanchal Lalwani</option>
									<option >Dr.Sandeep Bhavekar</option>
									<option >Dr.Rajesh Patil</option>
								</select>
							</td>
							<td>Select Timing</td>
							<td>
								<select name="ddltime">
										<option value="-1">Select Time</option>
										<optgroup label="AM">
											<option>9am</option>
											<option>10am</option>
											<option>11am</option>
										</optgroup>
										<optgroup label="PM">
											<option>12pm</option>
											<option>1pm</option>
											<option>2pm</option>
											<option>3pm</option>
											<option>4pm</option>
											<option>5pm</option>
											<option>6pm</option>
										</optgroup>
								</select>
							</td>
							<td><input  class="class236" type="button" name="btn_button" value="Search" onclick="checkdata()"/></td>
						</tr>
					</table>
				</div>
				<hr style="background-color:darkblue;height: 5px;" />
			</center>
		</form>	
<%
			}
		}
	}
	catch(Exception err)
	{
%>
	<center>
		<div style="position: absolute;left:40px;top: 40px;font-size: 40px;text-align: center;">
			<font face="cosmic sans ms" color="darkblue">
				<u>For Receptionist:-</u> You need to Login First.<br/>
				<br/>
				<br/>
				           <u>For Pepole:-</u>&#128683;!! This area is only accessible for RECEPTIONIST !!&#128683;<br/>
			</font>
		</div>
	</center>
<%		
	}
%>
</body>
</html>
