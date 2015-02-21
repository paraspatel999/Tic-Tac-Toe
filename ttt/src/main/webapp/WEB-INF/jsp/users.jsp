<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>Users</title></head>
<body>
<table>
<tr><th>ID</th><th>Username</th><th>Email</th></tr>
<c:forEach items="${users}" var="user">
<tr>
  <td>${user.id}</td>
  <td>${user.user_name}</td>
  <td>${user.email_id}</td>
</tr>
</c:forEach>
</table>
<a href="register.html">Register</a>
</body>
</html>