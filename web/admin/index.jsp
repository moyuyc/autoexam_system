<%@ page import="top.moyuyc.jdbc.QuesAcess" %>
<%--
  Created by IntelliJ IDEA.
  User: Yc
  Date: 2015/9/25
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="../WEB-INF/error.jsp"%>
<%
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Expires", "0");
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login");
        return;
    }
    if (request.getParameter("root") == null || !request.getParameter("root").toString().equals("all")) {
        response.sendRedirect("?root=all");
        return;
    }
    int i = 0;
    try {
        i = request.getParameter("i") == null ? 0 : Integer.parseInt(request.getParameter("i"));
        if(i<0&&i>2)
            i=0;
    } catch (NumberFormatException e) {
        i=0;
        e.printStackTrace();
    }
    String[] header_list = new String[]{"题库总览", "用户总览", "试卷总览"};
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <script src="../js/jquery-2.1.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/adminIndex.css">
    <link rel="stylesheet" href="../css/jquery.resizableColumns.css">
    <link rel="stylesheet" href="../css/style.css">
    <script src="../js/adminMenu.js"></script>
    <title>管理员界面</title>
    <link rel="Shortcut Icon" href="../images/ico.ico" type="image/x-icon" />
    <script src="../js/jquery.tablesorter.min.js"></script>
    <script src="../js/store.js"></script>
    <script src="../js/jquery.resizableColumns.js"></script>

</head>
<body>
<jsp:include page="template/adminheader.html"></jsp:include>
<jsp:include page="template/menu.jsp"></jsp:include>

<div class="container-fluid">
    <div class="row">

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h2 class="sub-header"><%=header_list[i]%>
            </h2>
            <div class="table-responsive">
                <%if (i == 0) {%>
                <jsp:include page="template/all-0.jsp"></jsp:include>
                <%}else if(i==1){%>
                <jsp:include page="template/all-1.jsp"></jsp:include>
                <%}else if(i==2){%>
                <jsp:include page="template/all-2.jsp"></jsp:include>
                <%}%>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<script>
    $("table").tablesorter()
</script>