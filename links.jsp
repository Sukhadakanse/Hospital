<html>
	<head>
		<link href="styles/style1.css" rel="stylesheet">
		<style>
			.h234
			{
				background-color: crimson;
				color: white;
				width: 100px;
				height: 50px;
			}
		</style>
	</head>
	<body style="background-color:gainsboro;">
		<center>
			<font style="background-color: darkblue;color: white; height: 40px;text-align: center;font-size: 20px;">NAVIGATION MENUS
			</font><br/><br/>
			<fieldset>
				<legend><b>SEVA</b></legend>
		<table>
			<tr>
				<td><a href="home.jsp" target="f2"><input type="button" value="Home"></a></td>
			</tr>

			<tr>
				<td><a href="login.jsp" target="f2"><input type="button" value="Login"></a></td>
			</tr>

			<tr>
				<td><a href="doctors.jsp" target="f2"><input type="button" value="Doctors List"></a></td>
			</tr>
		</table>
	</fieldset>
	<fieldset>
		<legend><b>Management</b></legend>
		<table>
			<tr>
				<td><a href="search_patients.jsp" target="f2"><input type="button" value="Search Patients"></a></td>
			</tr>

			<tr>
				<td><a href="add_patients.jsp" target="f2"><input type="button" value="Add Patients"></a></td>
			</tr>

			<tr>
				<td><a href="show_patients.jsp" target="f2"><input type="button" value="Patients Records"></a></td>
			</tr>

			<tr>
				<td><a href="View_Appointments.jsp" target="f2"><input type="button" value="Appointments"></a></td>
			</tr>

			<tr>
				<td><a href="Old_records.jsp" target="f2"><input type="button" value="Old Records"></a></td>
			</tr>
			
			<tr>
				<td>
					<a href="logout.jsp" target="f2" >
						<input type="button" value="Logout" style="background-color: crimson;color: white;border-color:black;border-width: 2px;">
					</a>
				</td>
			</tr>
		</table>
	</fieldset>
	<fieldset>
		<legend><b>For People</b></legend>
		<table>
			<tr>
				<td>
					<a href="appointment.jsp" target="f2">
						<input type="button" value=" Book Appointment">
					</a>
				</td>
			</tr>
		</table>
	</fieldset>
	</center>
	</body>
</html>