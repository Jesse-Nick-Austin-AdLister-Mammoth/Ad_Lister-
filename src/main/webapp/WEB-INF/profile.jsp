<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="stylesheet" value="fence-theme.css"/>
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h1>Welcome, ${sessionScope.user.username}!</h1>
    <div>
        <h2>Here are your ads</h2>
        <c:forEach var="ad" items="${ads}">
            <div class="col-md-6">
                <h2><a href="/ads/show?id=${ad.id}">${ad.title}</a></h2>
                <p>${ad.description}</p>
                <button class="btn-danger">Delete</button>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>
