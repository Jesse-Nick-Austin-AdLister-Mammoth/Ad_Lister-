<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="fence-theme.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1 id="indexHead" class="text-center">Welcome to Fence</h1>
        <p class="text-center" id="indexText">
            Fence is a classified ad website dedicated to helping our users find the things they need now.
        </p>

    </div>
</body>
</html>
