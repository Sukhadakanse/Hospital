<%@page import="java.sql.*"%>
<html>
<%
	
	if(request.getMethod().equalsIgnoreCase("POST"))
	{	
		try
		{	
			
			if(request.getParameter("btn_button")==null)
			{
%>
	<form action="search_patients.jsp" method="post" name="f2">
		<center>
			<div style="position: absolute;left: 100px;top: 10px;">
				<font face="cosmic sans ms" size="20px" color="darkblue">
						<u>Search Patient</u>
				</font><br/><br/>

				<table>
					<tr>
						<td>	
							<input class="class234" type="text" name="reg_no" placeholder="Enter Register No."
<%
							if(request.getParameter("reg_no")!=null)
							{
								out.println("value=\""+request.getParameter("reg_no")+"\"");
							}
%>
							/>
						</td>
						<td><input  class="class236" type="button" name="btn_button" value="Search" onclick="checkdata1()"/></td>
					</tr>
				</table>
			</div>
			<div style="position:absolute;left:0;top: 120px;width: 1270px;">
				<hr style="background-color: darkblue; height: 5px;" />
			</div>
		</center>	

		<center>
				<div style="position:absolute;left:0;top: 150px;width: 1270px;">
<%
			try
			{
				if(request.getParameter("reg_no").isEmpty()==false)
				{	
					int reg =Integer.parseInt(request.getParameter("reg_no").trim());
					String sql="select * from patient where reg_no=?";

					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Ujwal123");

					PreparedStatement ps = con.prepareStatement(sql);
					ps.setInt(1,reg);
					ResultSet rs = ps.executeQuery();


					if(rs.next())
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
						<table cellspacing="0" cellpadding="5" border="1px" style="width:80%;font-family: cosmic sans ms;font-size: 20px;text-align: center;">
							<caption style="font-size:25px;color: darkblue;"><strong>Patient Data</strong></caption>
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

					</table>
					<br/>
					<br/>
					<table>
						<tr>
							<td><a href="update_patients.jsp"><input type="button" name="update" value="Update" onclick="direct()" style="width: 100px;height: 30px;font-family: cosmic sans ms;font-size: 20px;color: white;background-color: darkblue;"></a></td>
						</tr>
					</table>
<%					
					con.commit();
					rs.close();
					ps.close();
					con.close();
					}
					else
					out.println("<font face='cosmic sans ms' size='20px' color='darkred'>!!Soory no data found!!</font>");
				}
			}
			catch(Exception ex)
			{
				out.println(ex);
			}
%>
				</div>
		</center>
	</form>
<%
			}
		}
		catch(Exception ex)
		{
			out.println(ex);
		}
	}

%>

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
				
			}
			.class234
			{
				width: 850px;
				height: 30px;
				font-family: cosmic sans ms;
				font-size: 20px;
				color: darkblue;
				border-color: darkblue;
				border-width: 3px;
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
		</style>

		<script type="text/javascript">
			function checkdata()
			{
				msg="";

				if(document.f1.reg_no.value.trim()=="")
				msg=msg+"**Search Number Required\n";

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
			function checkdata1()
			{
				msg="";

				if(document.f2.reg_no.value.trim()=="")
				msg=msg+"**Search Number Required\n";

				if(msg!="")
				{
					alert(msg);
					return;
				}

				if(msg=="")
				{
					document.f2.submit();
				}
			}

			function direct()
			{
				response.sendRedirect("update_patients.jsp");
			}
			function direct1()
			{
				response.sendRedirect("delete_record.jsp");
			}
		</script>
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
%>
			<form action="test.jsp" method="post" name="f1">
				<center>
				<div style="position: absolute;left: 100px;top: 10px;">
						<font face="cosmic sans ms" size="20px" color="darkblue">
							<u>Search Patient</u>
						</font><br/><br/>

						<table>
							<tr>
								<td>	
									<input class="class234" type="text" name="reg_no" placeholder="Enter Register No."/>
								</td>
								<td><input  class="class236" type="button" name="btn_button" value="Search" onclick="checkdata()"/></td>
							</tr>
						</table>
				</div>
				<div style="position:absolute;left:0;top: 120px;width: 1270px;">
					<hr style="background-color: darkblue; height: 5px;" />
				</div>
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
		<div style="position: absolute;left: 200px;top: 300px;">
			<font face="cosmic sans ms" size="30px" color="darkblue">
				&#128516; You need to Login First.<br/>
				This area is only accessible for RECEPTIONIST<br/>
			</font>
		</div>
	</center>
<%		
	}

%>
</body>
</html>
