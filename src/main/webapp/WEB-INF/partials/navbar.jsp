<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <c:choose>
                <c:when test="${sessionScope.user != null}">
                    <li><a href="/ads/create"><span class="glyphicon glyphicon-file"></span> New Ad</a></li>
                    <li><a href="/profile"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
                    <li><a href="/logout"><span class="glyphicon glyphicon-eject"></span> Logout</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="/register"><span class="glyphicon glyphicon-plus"></span> Register</a></li>
                    <li><a href="/login"><span class="glyphicon glyphicon-user"></span> Login</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
