<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Create a new Ad</h1>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <div id="filepicker">Pick file</div>
            <input type="hidden" name="fileurl" id="fileurl">
            <input id="submit" type="submit" class="btn btn-block btn-primary">
        </form>
    </div>

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
