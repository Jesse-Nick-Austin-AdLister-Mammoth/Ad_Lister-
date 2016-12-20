<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!" />
    </jsp:include>
</head>
<body>
    <jsp:include page="partials/navbar.jsp" />
    <div class="container">
        <h1>Please fill in your information.</h1>
        <form action="/register" data-toggle="validator" method="post">
            <div id="username-form-group" class="form-group">
                <label for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text" required>
                <div id="username-help" class="help-block with-errors"></div>
            </div>
            <div id="email-form-group" class="form-group">
                <label for="email">Email</label>
                <input id="email" name="email" class="form-control" type="email" required>
                <div id="email-help" class="help-block with-errors"></div>
            </div>
            <div id="password-form-group" class="form-group">
                <label for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password" required>
                <div id="password-help" class="help-block with-errors"></div>
            </div>
            <div id="confirm-password-form-group" class="form-group">
                <label for="confirm_password">Confirm Password</label>
                <input id="confirm_password" name="confirm_password" class="form-control" type="password" data-match="#password" required>
                <div id="confirm_password-help" class="help-block with-errors"></div>
            </div>
            <input id="submit" type="submit" data-disable="" class="btn btn-primary btn-block">
        </form>
    </div>
    <script
    src="https://code.jquery.com/jquery-3.1.1.js"
    integrity="sha256-16cdPddA6VdVInumRGo6IbivbERE8p7CQR3HzTBuELA="
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.8/validator.js"></script>
</body>
</html>
