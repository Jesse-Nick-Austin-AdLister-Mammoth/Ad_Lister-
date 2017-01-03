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
                <a href="/ads/show?id=${ad.id}">
                    <c:choose>
                        <c:when test='${ad.url != null && ad.url.trim() != ""}'>
                            <img style="float: left; margin-right: 5px; margin-top: 5px;" class="img-rounded"
                                 src="${ad.url}" alt="${ad.title}" width="50" height="50">
                        </c:when>
                        <c:otherwise>
                            <img style="float: left; margin-right: 5px; margin-top: 5px;" class="img-rounded"
                                 src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
                                 alt="Generic placeholder image" width="50" height="50">
                        </c:otherwise>
                    </c:choose>

                    <h2>${ad.title}</h2>
                </a>
                <p>${ad.description}</p>

                <div>
                    <button class="btn btn-danger">Delete</button>
                </div>
            </div>

        </c:forEach>
    </div>
</div>

</body>
</html>
