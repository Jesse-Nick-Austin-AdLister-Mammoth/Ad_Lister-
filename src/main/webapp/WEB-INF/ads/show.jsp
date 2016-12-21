<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <div class="col-md-12">
        <div><h2>${ad.title}</h2></div>
        <c:choose>
            <c:when test='${ad.url != null && ad.url.trim() != ""}'>
                <div><img class="img-rounded" src="${ad.url}" alt="${ad.title}" width="300" height="200"></div>
            </c:when>
            <c:otherwise>
                <div><img class="img-rounded" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="300" height="200"></div>
            </c:otherwise>
        </c:choose>
        <div class="col-md-6"><p>${ad.description}</p></div>
    </div>
</div>
</body>
</html>
