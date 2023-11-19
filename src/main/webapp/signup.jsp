<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>findmyPG | Sign Up</title>
</head>

<body>
<form action = "SignUpServlet" method = "post">
    <%--Basic Details--%>
                <fieldset>
                    <input type="text" placeholder="Name" name="name">
                    <input type="password" placeholder="Password" name="password">
                    <input type="number" placeholder="Contact Number" name="phoneno">
                    <input type="email" placeholder="Email" name="email">
                    <input type="text" placeholder="Address/Location" name="location">
                </fieldset>

        <%--User Role--%>
        <fieldset>
            <label for="user_role">Choose room sharing type:</label>
            <select name="user_role" id="user_role">
                <option value="owner">Property Owner</option>
                <option value="normal">Student</option>
            </select>
        </fieldset>
        <input type = "submit" value = "Sign Up" />
</form>
</body>
</html>
