<%@page import="java.sql.*"%>
<html>
<head>
		<style>
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
			}
		</style>
</head>
<body style="background-color: lavender;">
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
				try{
				String sql = "select * from patient where discharge_status=?";

				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Ujwal123");

				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1,"YES");
				ResultSet rs = ps.executeQuery();
%>
			<center>
				<font face="algerian" size="20px" color="darkblue">
								Old Records
				</font><br/><br/>
				<table cellspacing="0" cellpadding="5" border="1px" style="width:5%;height: 40%;font-family: cosmic sans ms;font-size: 20px;text-align: center;">
							
						<tr >
							<th>Reg No</th>
							<th>Full Name</th>
							<th>Gender</th>
							<th>Age</th>
							<th>Blood Group</th>
							<th>Address</th>
							<th>Mobile No.</th>
							<th>Incharge Doctor</th>
							<th>Reason</th>
							<th>Ward No.</th>
							<th>Room No.</th>
							<th>Bed No.</th>
							<th>Admit Date</th>
							<th>Discharge Status</th>
							<th>Date Discharge</th>
							<th>Total Bill</th>
							
						</tr>
<%
				while(rs.next())
				{
						int reg_display = rs.getInt("reg_no");
						String fn = rs.getString("full_name");
						String gender =rs.getString("gender");
						int age = rs.getInt("age");
						String blood_group = rs.getString("blood_group");
						String address = rs.getString("address");
						String mo = rs.getString("contact");
						String doctor = rs.getString("doctor_incharge");
						String reason = rs.getString("reason");
						int ward = rs.getInt("ward_no");
						int room = rs.getInt("room_no");
						int bed = rs.getInt("bed_no");
						String admit_date = rs.getString("date_admit");
						String discharge_stat = rs.getString("discharge_status");
						String date_discharge = rs.getString("date_discharge");
						int t_bill=rs.getInt("total_bill");
%>
						
						<tr>
							<td><%=reg_display%></td>
							<td><%=fn%></td>
							<td><%=gender%></td>
							<td><%=age%></td>
							<td><%=blood_group%></td>
							<td><%=address%></td>
							<td><%=mo%></td>
							<td><%=doctor%></td>
							<td><%=reason%></td>
							<td><%=ward%></td>
							<td><%=room%></td>
							<td><%=bed%></td>
							<td><%=admit_date%></td>
							<td><%=discharge_stat%></td>
							<td><%=date_discharge%></td>
							<td><%=t_bill%></td>
						</tr>

					
<%
				}

%>
				</table>
			</center>	
<%
					con.commit();
					rs.close();
					ps.close();
					con.close();
			}
			catch(Exception ex)
			{
				out.println(ex);	
			}
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
