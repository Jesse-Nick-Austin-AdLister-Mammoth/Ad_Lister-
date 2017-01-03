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
                <div><img class="img-rounded" src="${ad.url}" alt="${ad.title}" width="300" height="300"></div>
            </c:when>
            <c:otherwise>
                <div><img class="img-rounded" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" width="300" height="300"></div>
            </c:otherwise>
        </c:choose>

        <div class="col-md-6">
            <p>${ad.description}</p>
            <c:if test="${ad.categoryInt != null && ad.categoryInt != 0}"><p><strong>${categories.get(ad.categoryInt)}</strong></p></c:if>
            <c:if test="${sessionScope.user.id == ad.userId}">
                <div>
                    <form action="/delete" method="post">
                        <input hidden type="text" name="id" value="${ad.id}">
                        <button>Delete</button>
                    </form>
                    <button>Edit</button>
                </div>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
