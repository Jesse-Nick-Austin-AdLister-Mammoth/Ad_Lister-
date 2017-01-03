<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
    <link href="../../fence-theme.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <div class="row">
    <div class="col-md-6">
        <div><h2>${ad.title}</h2></div>
        <div>
        <c:choose>
            <c:when test='${ad.url != null && ad.url.trim() != ""}'>
                <img class="img-rounded showImage" src="${ad.url}" alt="${ad.title}">
            </c:when>
            <c:otherwise>
                <img class="img-rounded" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image">
            </c:otherwise>
        </c:choose>
        </div>

        <div class="col-md-6">
            <p>${ad.description}</p>
            <c:if test="${ad.categoryInt != null && ad.categoryInt != 0}"><p><strong>${categories.get(ad.categoryInt)}</strong></p></c:if>
            <c:if test="${sessionScope.user.id == ad.userId}">
                <div>
                    <form action="/delete" method="post">
                        <input hidden type="text" name="id" value="${ad.id}">
                        <button>Delete</button>
                    </form>
                    <a class="btn btn-default btn-xs" href="#" role="button">Edit</a>
                </div>
            </c:if>
        </div>
    </div>
    </div>
</div>
</body>
</html>
