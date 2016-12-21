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
        <form action="/ads/create" method="post" data-toggle="validator">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text" required>
                <div id="title-help" class="help-block with-errors"></div>

            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text" required></textarea>
                <div id="description-help" class="help-block with-errors"></div>
            </div>
            <div id="filepicker" class="btn btn-success btn-lg"><span class="glyphicon glyphicon-picture"></span> Pick file</div>
            <input type="hidden" name="fileurl" id="fileurl">
            <input id="submit" type="submit" data-disable="" class="btn btn-block btn-primary">
        </form>
    </div>

<script
        src="https://code.jquery.com/jquery-3.1.1.js"
        integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
        crossorigin="anonymous"></script>
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
