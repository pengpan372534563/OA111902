<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<html>
<head>
    <title>用户列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script>
        $(function () {
            $("a[uid]").each(function () {
                var aObject = $(this);
                $(this).click(function () {
                    if (confirm("您确定要删除吗？")) {
                        $.get(
                            "${pageContext.request.contextPath}/uid/delete.do",
                            {"uid":aObject.attr("uid")},
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

          function updateClick(uid) {
              window.location.href="${pageContext.request.contextPath}/user/updatePage.do?uid="+uid;
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
            <th width="200px">用户名</th>
            <th width="200px">所属部门</th>
            <th width="280px">岗位</th>
            <th>相关操作</th>
        </tr>
        </thead>

        <!--显示数据列表-->
        <tbody id="TableData">
          <c:forEach items="${userList}" var="user">
              <tr align="center">
              <td>${user.username}</td>
              <td>${user.department.dname}</td>
              <td><c:forEach items="${user.postList}" var="post">${post.pname}&nbsp;&nbsp;&nbsp; </c:forEach></td>
              <td><a href="#" uid="${user.uid}" id="deleteUser">删除</a>&nbsp;
                  <a href="#" id="updateUser">修改</a>
                  <a href="#" id="setUserPost">设置权限</a></td>
              </tr>
          </c:forEach>

          <tr align="center">
              <td colspan="4">
                  <c:forEach items="${pageInfo.pageView}" var="page">
                      ${page}
                  </c:forEach>
              </td>
          </tr>
        </tbody>
    </table>
    <!-- 其他功能超链接 -->
    <div id="TableTail">
        <div id="TableTail_inside">
            <a href="${pageContext.request.contextPath}/user/insert.do"><img src="${pageContext.request.contextPath}/css/images/createNew.png"></a>
        </div>
    </div>
</div>
</body>
</html>
