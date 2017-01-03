<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="../fence-theme.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
    <div class="col-md-12">
        <div><h2>${ad.title}</h2></div>
        <div id="showImage">
        <c:choose>
            <c:when test='${ad.url != null && ad.url.trim() != ""}'>
                <img class="img-rounded" src="${ad.url}" alt="${ad.title}">
            </c:when>
            <c:otherwise>
                <img class="img-rounded" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="300" height="300">
            </c:otherwise>
        </c:choose>
        </div>

        <div class="col-md-6">
            <p>${ad.description}</p>
            <c:if test="${ad.categoryInt != null}"><p><strong>${categories.get(ad.categoryInt)}</strong></p></c:if>
            <c:if test="${sessionScope.user.id == ad.userId}">
                <div>
                    <button class="btn btn-danger">Delete</button>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>
