<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Student</title>
 <style>
* {
	padding: 0;
	margin: 0;
}

.main {
	width: 100%;
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #f4f4f4;
}

.updateform {
	border: 5px solid black;
	width: 400px;
	padding: 20px;
	border-radius: 9px;
	background-color: white;
}

input {
	padding: 5px;
	border-radius: 4px;
	color: black;
	margin-top: 10px;
}

input[type="text"] {
	width: calc(100% - 80px);
	margin-left: 40px;
}

.labelname {
	padding-left: 20px;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
}

h2 {
	padding: 20px;
	text-align: center;
}

button[type="submit"] {
	padding: 10px;
	font-weight: bold;
	border: none;
	cursor: pointer;
	border-radius: 6px;;
	margin-left: 40px;
	margin-top: 8px;
	background-color: green;
	color: white;
}
</style>
</head>
<body>


<div class="main">
<%
    String si = request.getParameter("si");  
       
%>

    <form action="updatestudform" method="post" class="updateform">
        <h2>Update Student Information</h2>
         
        <input type="hidden" name="id1"  value="<%= si %>"">
        <label class="labelname">USN:</label>
        <input type="text" name="usn1" value="${students.usn}" required> <br> <br> 
        <label class="labelname">Name:</label>
        <input type="text" name="name1" value="${students.name}" required> <br> <br> 
        <label class="labelname">Branch:</label>
        <select name="branch1">
            <option value="">Select Branch</option>
            <option value="CSE" ${student.branch == "CSE" ? "selected" : ""}>CSE</option>
            <option value="ME" ${student.branch == "ME" ? "selected" : ""}>ME</option>
            <option value="CV" ${student.branch == "CV" ? "selected" : ""}>CV</option>
            <option value="EC" ${student.branch == "EC" ? "selected" : ""}>EC</option>
            <option value="IT" ${student.branch == "IT" ? "selected" : ""}>IT</option>
        </select>
        <br> <br>
        <label class="labelname">Contact:</label>
        <input type="text" name="contact1" value="${student.contact}" required> <br><br>  
        <label class="labelname">Gender :</label>
        <input type="radio" name="gender1" value="Male" ${student.gender == "Male" ? "checked" : ""}> Male
        <input type="radio" name="gender1" value="Female" ${student.gender == "Female" ? "checked" : ""}> Female
        <br> <br>
        <label class="labelname">City:</label>
        <input type="text" name="city1" value="${student.city}" required> <br>
        <button type="submit">Update</button>
    </form>
</div>
<script>
        function showAlert() {
            var message = "${message}";
            if (message) {
                alert(message);
            }
        }
    </script>
</body>
</html>
