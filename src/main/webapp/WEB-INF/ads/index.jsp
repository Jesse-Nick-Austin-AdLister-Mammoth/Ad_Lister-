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
    <h1>Here Are all the ads!</h1>
    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
                <a href="/ads/show?id=${ad.id}">
                    <img style="float: left; margin-right: 5px;" class="img-rounded"
                         src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw=="
                         alt="Generic placeholder image" width="60" height="60">
                    <h2>${ad.title}</h2>
                </a>
            <p>${ad.description}</p>
        </div>
    </c:forEach>
</div>

</body>
</html>
