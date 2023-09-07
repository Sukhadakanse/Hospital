<%@page import="java.sql.*"%>
<html>
<head>
	<link href="styles/style1.css" rel="stylesheet"/>
	<style>

	</style>
	<script type="text/javascript">
		function checkdata()
		{
			msg="";
			if(document.f1.txtfn.value.trim()=="")
			msg=msg+"**Full Name required\n";

			if(document.f1.ddldoctor.value.trim()=="-1")
			msg=msg+"**Doctor required\n";

			if(document.f1.ddltime.value.trim()=="-1")
			msg=msg+"**Select Timing\n";

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
		try
		{
			String fu=request.getParameter("txtfn").toUpperCase().trim();
			String d=request.getParameter("ddldoctor").toUpperCase().trim();
			String t=request.getParameter("ddltime").toUpperCase().trim();
			
			
			String sql2="select full_name from appointment where full_name=? and doctor_name=? and timing=?";

			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Ujwal123");
			PreparedStatement ps2 = con1.prepareStatement(sql2);
			ps2.setString(1,fu);
			ps2.setString(2,d);
			ps2.setString(3,t);

			ResultSet rs2 = ps2.executeQuery();
			if(rs2.next())
			{
				String fn=rs2.getString("full_name");
				out.println("<font face='cosmic sans ms' size='10px' color='red'>!!Sorry "+fn+ " you have already booked your appointment!!</font>");
			}
			else
			{
								String full_name=request.getParameter("txtfn").toUpperCase().trim();
								String doctor = request.getParameter("ddldoctor").toUpperCase().trim();
								String time = request.getParameter("ddltime").toUpperCase().trim();
								int value=0;
								if(time.equalsIgnoreCase("9AM"))
								value=1;
								else 
								if(time.equalsIgnoreCase("10AM"))
								value=2;
								else 
								if(time.equalsIgnoreCase("11AM"))
								value=3;
								else 
								if(time.equalsIgnoreCase("12PM"))
								value=4;
								else 
								if(time.equalsIgnoreCase("1PM"))
								value=5;
								else 
								if(time.equalsIgnoreCase("2PM"))
								value=6;
								else 
								if(time.equalsIgnoreCase("3PM"))
								value=7;
								else 
								if(time.equalsIgnoreCase("4PM"))
								value=8;
								else 
								if(time.equalsIgnoreCase("5PM"))
								value=9;
								else 
								if(time.equalsIgnoreCase("6PM"))
								value=10;

				try
				{
					String sql="insert into appointment values(?,?,?,?)";

					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Ujwal123");

					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1,full_name);
					ps.setString(2,doctor);
					ps.setString(3,time);
					ps.setInt(4,value);
					int n= ps.executeUpdate();

					if(n==1)
					out.println("<font face='cosmic sans ms' size='20px' color='green'>Appointment Booked...</font><br/>");
					else
					out.println("<font face='cosmic sans ms' size='20px' color='red'>Appointment Not Booked...</font><br/>");
					con.commit();
					ps.close();
					con.close();
				}
				catch(Exception ex)
				{
						out.println(ex);
				}
			}
            rs2.close();
			ps2.close();
			con1.close();
		}
		catch(Exception ex)
		{
			out.println(ex);
		}
		
	}
%>
<% //out.println(request.getMethod());%>
<%
	if(request.getMethod().equalsIgnoreCase("GET"))
	{
%>
	<form name="f1" action="appointment.jsp" method="post">
		<center>
			<font face="algerian" size="20px" color="darkblue">
						Book Appointments
			</font><br/><br/>
		</center>
			<fieldset >
			<center>
			<table >
				<tr>
					<td>Full Name</td>
					<td><input type="text" placeholder="Enter your name" name="txtfn"></td>
				</tr>

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
				</tr>

				<tr>
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
				</tr>
				<tr>
					<td>    <td>
					<td>    <td>	
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="button" name="btn_submit" value="BOOK" style="background-color: darkblue;width:150;font-size: 20px;" onclick="checkdata()"/>
						<td>
				</tr>
			</table>
			</fieldset >
		</center>
	</form>
<%
}
%>
</body>
</html>