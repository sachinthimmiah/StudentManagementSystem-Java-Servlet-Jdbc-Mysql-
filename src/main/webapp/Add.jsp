<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

.mainform {
	border: 5px solid black;
	width: 450px;
	padding: 20px;
	border-radius: 7px;
	background-color: white;
}

input {
	padding: 5px;
	border-radius: 4px;
	color: black;
	margin-top: 10px;
}

input[type="number"], input[type="text"], input[type="number"] {
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

input[type="submit"] {
	padding: 10px;
	font-weight: bold;
	border: none;
	cursor: pointer;
	margin-left: 40px;
	background-color: green;
	color: white;
}

</style>
</head>
<body>
<div class="main">
            <form action="studentform" method="post" class="mainform">
                <h2>Registration Form</h2>
                <label class="labelname">Usn:</label>
                <input
                    type="text"
                    name="usn1"
                    placeholder="Enter the usn"
                    required
                >
                <br>
                <br>
                <label class="labelname">Name :</label>
                <input
                    type="text"
                    name="name1"
                    placeholder="Enter the Name"
                    required
                >
                <br>
                <br>
                <label class="labelname">Branch:</label>
                <select name="branch1">
                    <option value="">Select Branch</option>
                    <option value="CSE">CSE</option>
                    <option value="ME">ME</option>
                    <option value="CV">CV</option>
                    <option value="EC<">EC</option>
                    <option value="IT">IT</option>
                </select>
                <br>
                <br>
                <label class="labelname">Contact:</label>
                <input
                    type="tel"
                    name="contact1"
                    placeholder="Enter the Contact Number"
                    required
                >
                <br>
                <br>
                <label class="labelname">Gender :</label>
                <input
                    type="radio"
                    name="gender1"
                    value="Male"
                    required
                >
                Male
                <input
                    type="radio"
                    name="gender1"
                    value="Female"
                    required
                >
                Female
                <br>
                <br>
                <label class="labelname">City :</label>
                <input
                    type="text"
                    name="city1"
                    placeholder="Enter the City"
                    required
                >
                <br>
                <br>
                <input type="submit" name="action1" value="Add">
            </form>
        </div>
         <script>
        function showAlert() {
            var message = "${message1}";
            if (message) {
                alert(message);
            }
        }
    </script>
</body>
</html>