
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>findmyPG | Add Property</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form action="PropertyController" method="post" enctype="multipart/form-data">--%>
<%--    Property Name: <input name="prop_name" required>--%>
<%--    Property Price: <input name="prop_price" required>--%>
<%--    Image: <input type="file" id="imageFile" name="imageFile" accept="image/*" multiple>--%>
<%--  <input type="submit" value="Post Property">--%>
<%--</form>--%>
<%--</body>--%>
<%--</html>--%>
<html>
<head>
    <title>File Uploading Form</title>
</head>

<body>
<h3>File Upload:</h3>
<form action = "UploadServlet" method = "post" enctype = "multipart/form-data">
    Property Name: <input type="text" name="prop_name">
    <input type = "file" name = "files" accept="image/*"  multiple/>
    <input type = "submit" value = "Upload File" />
</form>
</body>

</html>