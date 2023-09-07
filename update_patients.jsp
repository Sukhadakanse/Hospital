<%@page import="java.sql.*"%>
<html>
<head>
		<link href="styles/style1.css" rel="stylesheet" />
	<style>
		.class123
		{
			resize: none;
		}
	</style>

	<script type="text/javascript">
		function checkdata()
		{
			msg="";

			if(document.f1.txtregno.value.trim()=="")
			msg=msg+"*Register No required\n";

			if(document.f1.txtfn.value.trim()=="")
			msg=msg+"*Full Name required\n";

			if(document.f1.ddlGender.value.trim()=="-1")
			msg=msg+"*Gender required\n";

			if(document.f1.txtage.value.trim()=="")
			msg=msg+"*Age required\n";

			if(document.f1.txtbloodgroup.value.trim()=="")
			msg=msg+"*Blood Group required\n";

			if(document.f1.textAddress.value.trim()=="")
			msg=msg+"*Address required\n";

			if(document.f1.txtmonum.value.trim()=="")
			msg=msg+"*Mobile No required\n";

			if(document.f1.ddldoctor.value.trim()=="-1")
			msg=msg+"*Doctor Incharge required\n";

			if(document.f1.txtreason.value.trim()=="")
			msg=msg+"*Reason of Admit required\n";

			if(document.f1.txtward.value.trim()=="")
			msg=msg+"*Ward No required\n";

			if(document.f1.txtroomno.value.trim()=="")
			msg=msg+"*Room No required\n";

			if(document.f1.txtbedno.value.trim()=="")
			msg=msg+"*Bed No required\n";

			if(document.f1.txtadmit.value.trim()=="")
			msg=msg+"*Admit date required\n";

			if(document.f1.ddlStatus.value.trim()=="-1")
			msg=msg+"*Discharge Status required\n";

			if(document.f1.txt_discharge_date.value.trim()=="")
			msg=msg+"*Discharge date required\n";

			if(document.f1.txtotal_bill.value.trim()=="")
			msg=msg+"*Total bill required\n";

			if(msg!="")
			{
				alert(msg);
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
					
					int reg = Integer.parseInt(request.getParameter("txtregno").trim());
					String fn = request.getParameter("txtfn").toUpperCase().trim();
					String gender =request.getParameter("ddlGender").toUpperCase().trim();
					int age = Integer.parseInt(request.getParameter("txtage").trim());
					String blood_group = request.getParameter("txtbloodgroup").toUpperCase().trim();
					String address = request.getParameter("textAddress").toUpperCase().trim();
					String mo = request.getParameter("txtmonum").trim();
					String doctor = request.getParameter("ddldoctor").toUpperCase().trim();
					String reason = request.getParameter("txtreason").toUpperCase().trim();
					int ward = Integer.parseInt(request.getParameter("txtward").trim());
					int room = Integer.parseInt(request.getParameter("txtroomno").trim());
					int bed = Integer.parseInt(request.getParameter("txtbedno").trim());
					String admit_date = request.getParameter("txtadmit").toUpperCase().trim();
					String discharge_stat = request.getParameter("ddlStatus").toUpperCase().trim();
					String date_discharge = request.getParameter("txt_discharge_date").toUpperCase().trim();
					int t_bill=Integer.parseInt(request.getParameter("txtotal_bill").trim());
					
					try{
					String sql="update patient set reg_no=?,full_name=?,gender=?,age=?,blood_group=?,address=?,contact=?,doctor_incharge=?,reason=?,ward_no=?,room_no=?,bed_no=?,date_admit=?,discharge_status=?,date_discharge=?,total_bill=? where reg_no=?";

					Class.forName("oracle.jdbc.driver.OracleDriver");
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Ujwal123");

					PreparedStatement ps = con.prepareStatement(sql);

					ps.setInt(1,reg);
					ps.setString(2,fn);
					ps.setString(3,gender);
					ps.setInt(4,age);
					ps.setString(5,blood_group);
					ps.setString(6,address);
					ps.setString(7,mo);
					ps.setString(8,doctor);
					ps.setString(9,reason);
					ps.setInt(10,ward);
					ps.setInt(11,room);
					ps.setInt(12,bed);
					ps.setString(13,admit_date);
					ps.setString(14,discharge_stat);
					ps.setString(15,date_discharge);
					ps.setInt(16,t_bill);
					ps.setInt(17,reg);
					
					int n=ps.executeUpdate();

					if(n==1)
					out.println("<font face='cosmic sans ms' size='20px' color='green'>Record Updated...</font><br/>");
					else
					out.println("<font face='cosmic sans ms' size='20px' color='red'>Record Not Updated...</font><br/>");
					con.commit();
					ps.close();
					con.close();
				}
				catch(Exception ex)
				{
					out.println(ex);
				}
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
			try
			{
				int s=(Integer)session.getAttribute("reg_no");
				String sql="select * from patient where reg_no=?";

				Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","Ujwal123");

				PreparedStatement ps = con.prepareStatement(sql);
				ps.setInt(1,s);

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
				<form name="f1" action="update_patients.jsp" method="post">
					<center>
						<font face="algerian" size="20px" color="darkblue">
								Patient Data Update
						</font><br/><br/>
							<fieldset>
								<table>
										<tr>
											<td>Register No: </td>
											<td><input type="text" name="txtregno" placeholder="Enter Register No." readonly value="<%=reg_display%>"/></td>
										</tr>
										
										<tr>
											<td>Full Name: </td>
											<td><input type="text" name="txtfn" placeholder="Enter Full Name" value="<%=fn%>" readonly/></td>
										</tr>
									
										<tr>
											<td>Gender: </td>
											<td>
												<select name="ddlGender" >
														<option value="-1">Select Gender</option>
														<option <% if(gender.equalsIgnoreCase("Male"))
																	out.println("selected");%>>Male</option>
														<option <% if(gender.equalsIgnoreCase("Female")) 
																    out.println("selected");%>>Female</option>
												</select>
											</td>
										</tr>
				
										<tr>
											<td>Age (ex.18): </td>
											<td><input type="text" name="txtage" placeholder="Enter Age" value="<%=age%>" /></td>
										</tr>
				
										<tr>
											<td>Blood Group:</td>
											<td><input type="text" name="txtbloodgroup" placeholder="Enter Blood Group" value="<%=blood_group%>" /></td>
										</tr>
					
										<tr>
											<td>Address:</td>
											<td><textarea  class="class123" name="textAddress" ><%=address%></textarea></td>
										</tr>
				
										<tr>
											<td>Contact (ex.9231234879):</td>
											<td><input type="text" name="txtmonum" placeholder="Enter Mobile No." value="<%=mo%>" /></td>
										</tr>
				
										<tr>
											<td>Doctor Incharge: </td>
											<td>
												<select name="ddldoctor">
														<option value="-1">Select Doctor</option>
														<option <% if(doctor.equalsIgnoreCase("Dr.Manoj Kapadia"))
																	out.println("selected");%>>Dr.Manoj Kapadia</option>
														<option <% if(doctor.equalsIgnoreCase("Dr.Kedar Jaiswal"))
																	out.println("selected");%>>Dr.Kedar Jaiswal</option>
														<option <% if(doctor.equalsIgnoreCase("Dr.Aarohi Gupta"))
																	out.println("selected");%>>Dr.Aarohi Gupta</option>
														<option <% if(doctor.equalsIgnoreCase("Dr.Chanchal Lalwani"))
																	out.println("selected");%>>Dr.Chanchal Lalwani</option>
														<option <% if(doctor.equalsIgnoreCase("Dr.Sandeep Bhavekar"))
																	out.println("selected");%>>Dr.Sandeep Bhavekar</option>
														<option <% if(doctor.equalsIgnoreCase("Dr.Rajesh Patil"))
																	out.println("selected");%>>Dr.Rajesh Patil</option>
												</select>
											</td>
										</tr>
				
										<tr>
											<td>Reason to admit:</td>
											<td><textarea  class="class123" name="txtreason"><%=reason%></textarea></td>
										</tr>
				
										<tr>
											<td>Ward No (1 to 5):</td>
											<td><input type="text" name="txtward" placeholder="Enter Ward No." value="<%=ward%>"></td>
										</tr>
				
										<tr>
											<td>Room No(1 to 2): </td>
											<td><input type="text" name="txtroomno" placeholder="Enter Room No." value="<%=room%>"></td>
										</tr>
				
										<tr>
											<td>Bed No (1 to 10): </td>
											<td><input type="text" name="txtbedno" placeholder="Enter Bed No." value="<%=bed%>"></td>
										</tr>

										<tr>
											<td>Date of Admit (ex.12-Jan-2021) : </td>
											<td><input type="text" name="txtadmit" placeholder="Enter Admit date" value="<%=admit_date%>"></td>
										</tr>

										<tr>
											<td>Discharge Status : </td>
											<td>
												<select name="ddlStatus" >
														<option value="-1">Select Discharge</option>
														<option <% if(discharge_stat.equalsIgnoreCase("Yes"))
																	out.println("selected");%>>Yes</option>
														<option <% if(discharge_stat.equalsIgnoreCase("No")) 
																    out.println("selected");%>>NO</option>
												</select>
											</td>
										</tr>

										<tr>
											<td>Date of Discharge (ex.12-Jan-2021) : </td>
											<td><input type="text" name="txt_discharge_date" placeholder="Enter Discharge Date" value="<%=date_discharge%>"></td>
										</tr>

										<tr>
											<td>Total Bill (&#8377;): </td>
											<td><input type="text" name="txtotal_bill" placeholder="Enter Total Bill" value="<%=t_bill%>"></td>
										</tr>

										<tr>
											<td colspan="2" align="right"><input type="button" value="Update Record" name="btnadd" onclick="checkdata()"></td>
										</tr>
								</table>
						</fieldset>
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
