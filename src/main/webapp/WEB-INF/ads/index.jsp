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
    <h1 id="adsIndexHead">Viewing all items</h1>
    <c:forEach var="ad" items="${ads}">
        <div id="adsIndexEach" class="col-md-6">
                <a href="/ads/show?id=${ad.id}">
                    <c:choose>
                        <c:when test='${ad.url != null && ad.url.trim() != ""}'>
                            <img style="float: left; margin-right: 5px;" class="img-rounded" src="${ad.url}" alt="${ad.title}" width="50" height="50">
                        </c:when>
                        <c:otherwise>
                            <img style="float: left; margin-right: 5px;" class="img-rounded" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="50" height="50">
                        </c:otherwise>
                    </c:choose>

                    <h2>${ad.title}</h2>

                </a>
            <p id="adDescription">${ad.description}</p>
        </div>

    </c:forEach>
</div>

</body>
</html>
