<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Student List</title>
 <style>
 table {
	width: 80%;
	border-collapse: collapse;
	margin: 20px 0;
	font-family: Arial, sans-serif;
	margin: 0 auto;
}

h1 {
	margin-top: 30px;
	text-align: center;
	font-weight: bold;
}

th, td {
	border-radius: 7px;
	padding: 10px;
	text-align: left;
	border: 3px solid wheat; th { background-color : black;
	color: white;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

.action-header {
	background-color: black;
	color: white;
	text-align: center;
}

.action-btn {
	padding: 5px 10px;
	margin: 5px;
	background-color: #007bff;
	color: white;
	border: none;
	cursor: pointer;
	text-align: center;
	cursor:pointer;
}

.action-btn:hover {
	background-color: #0056b3;
}

button.action1 {
	width: 70px;
	background-color: #72c572;
	color: white;
	padding: 6px;
	border-radius: 8px;
	cursor:pointer;
}

a{
	margin: 15px;
	text-align: center;
	display: block;
}
button.action2 {
	background-color: red;
	padding: 7px;
	border-radius: 7px;
	color: white;
	cursor:pointer;
}

.main {
    display: flex;
    justify-content: center;
}
 </style>
</head>

<body>
 
	<h1>Student List</h1>
	<div class="main" style="display:flex;justify-content:center"> 
 <a href="Add.jsp" class="anchor" style="display: block;margin: 20px;">
    <button type="button" class="action3" style="background-color:blue;border-radius: 5px;
    color: white;
    padding: 5px;
    cursor:pointer;">Add Student</button> 
</a>
</div>
 
	<table>
		<thead>
			<tr>
				<th>SI</th>
				<th>USN</th>
				<th>Name</th>
				<th>Branch</th>
				<th>Contact</th>
				<th>Gender</th>
				<th>City</th>
				<th class="action-header">Action</th>
			</tr>
		</thead>
		<tbody>
			<!-- Check if there are students -->
			<c:if test="${not empty students}">
				<c:forEach var="student" items="${students}">
					<tr>
						<td>${student.si}</td>
						<td>${student.usn}</td>
						<td>${student.name}</td>
						<td>${student.branch}</td>
						<td>${student.contact}</td>
						<td>${student.gender}</td>
						<td>${student.city}</td>
						<td class="action-btn">
							<a  href="Update.jsp?si=${student.si}" style="display: inline-block;"  >
						 
								<button type="button" class="action1" value="${student.si}" >Update</button>
							</a>
							<form action="deletestud" method="post" style="display: inline-block;">
								<input type="hidden" name="id" value="${student.si}">
								<button type="submit" class="action2">Delete</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			 
			<c:if test="${empty students}">
				<tr>
					<td colspan="8" style="text-align: center;">No records found.</td>
				</tr>
			</c:if>
		</tbody>
	</table>
	 
	
	 <script>
    function confirmDel() {
        // Display the confirmation message
        if (confirm("Do you want to delete this?")) {
            // If the user clicks "OK", proceed with submission
            return true;
        } else {
            // If the user clicks "Cancel", prevent submission
            alert("Action cancelled.");
            return false;
        }
    }
</script>
</body>
</html>
