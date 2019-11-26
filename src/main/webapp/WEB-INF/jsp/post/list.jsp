<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<html>
<head>
    <title>岗位列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script>
        $(function () {
            $("a[pid]").each(function () {
                var aObject = $(this);
                $(this).click(function () {
                    if (confirm("您确定要删除吗？")) {
                        $.get(
                            "${pageContext.request.contextPath}/post/delete.do",
                            {"pid":aObject.attr("pid")},
                            function (data) {
                                alert(data.message);
                                if (data.message=="删除成功"){
                                    aObject.parents("tr").remove();
                                }
                            }
                        )
                    }
                })
            })
        })

          function updateClick(pid) {
              window.location.href="${pageContext.request.contextPath}/post/updatePage.do?pid="+pid;
          }
    </script>
</head>
<body>

<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/css/images/title_arrow.gif"/> 岗位管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<div id="MainArea">
    <table cellspacing="0" cellpadding="0" class="TableStyle">

        <thead>
        <tr align="center" valign=middle id=TableTitle>
            <th width="150px">岗位名称</th>
            <th width="200px">岗位说明</th>
            <th>相关操作</th>
        </tr>
        </thead>

        <!--显示数据列表-->
        <tbody id="TableData">
          <c:forEach items="${postList}" var="post">
              <tr align="center">
              <td>${post.pname}</td>
              <td>${post.description}</td>
              <td><a href="#" pid="${post.pid}">删除</a>&nbsp;
                  <a href="#" onclick="updateClick('${post.pid}')">修改</a></td>
          </tr>
          </c:forEach>
        </tbody>
    </table>
    <!-- 其他功能超链接 -->
    <div id="TableTail">
        <div id="TableTail_inside">
            <a href="${pageContext.request.contextPath}/post/insert.do"><img src="${pageContext.request.contextPath}/css/images/createNew.png"></a>
        </div>
    </div>
</div>
</body>
</html>
