<%@page import="java.sql.*"%>
<html>
<body style="background-color: lavender;">
<%
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

	String sql="insert into patient(reg_no,full_name,gender,age,blood_group,address,contact,doctor_incharge,reason,ward_no,room_no,bed_no,date_admit) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";

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

	int n=ps.executeUpdate();

	if(n==1)
	out.println("<font face='cosmic sans ms' size='20px' color='green'>Record Inserted...</font><br/>");
	else
	out.println("<font face='cosmic sans ms' size='20px' color='red'>Record Not Inserted...</font><br/>");
	con.commit();
	ps.close();
	con.close();
}
catch(Exception ex)
{
	out.println(ex);
}
finally
{
	out.close();
}
%>
</body>
</html>
