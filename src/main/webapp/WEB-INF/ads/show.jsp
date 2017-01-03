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
                        <button class="btn btn-primary">Delete</button>
                    </form>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">Edit</button>
                    <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" style="color: black">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <form action="/update" method="post">
                                    <div class="form-group">
                                        <label for="title">Title</label>
                                        <input id="title" name="title" class="form-control" type="text" required value="${ad.title}">
                                        <div id="title-help" class="help-block with-errors"></div>
                                    </div>
                                    <div class="form-group">
                                        <label for="description">Description</label>
                                        <textarea id="description" name="description" class="form-control" type="text" required>${ad.description}</textarea>
                                        <div id="description-help" class="help-block with-errors"></div>
                                    </div>
                                    <div id="filepicker" class="btn btn-success btn-lg"><span class="glyphicon glyphicon-picture"></span> Pick file</div>
                                    <select name="category">
                                        <option value="${ad.categoryInt}" selected disabled>${categories.get(ad.categoryInt)}</option>
                                        <option value="0">Undefined</option>
                                        <c:forEach var="category" items="${categories}" varStatus="loop">
                                            <option value="${loop.index + 1}">${category.value}</option>
                                        </c:forEach>
                                    </select>
                                    <input type="hidden" name="fileurl" id="fileurl" value="${ad.url}">
                                    <input id="submit" type="submit" data-disable="" class="btn btn-block btn-primary">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
    </div>
</div>
<script
        src="https://code.jquery.com/jquery-3.1.1.js"
        integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.8/validator.js"></script>
<script type="text/javascript" src="//api.filestackapi.com/filestack.js"></script>
<script type="text/javascript">
    filepicker.setKey("AFBrFHPurTte7wKazwLQzz");
    document.getElementById("filepicker").addEventListener("click", function(){
        filepicker.pick(
            {mimetype: 'image/*'},
            function(Blob){
                console.log(Blob.url);
                document.getElementById("fileurl").value = Blob.url;
            },
            function(FPError){
                console.log(FPError.toString());
            });
    });
</script>
</body>
</html>
