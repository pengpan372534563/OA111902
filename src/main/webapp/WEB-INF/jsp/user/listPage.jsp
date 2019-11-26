    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<html>
<head>
    <title>用户列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script language="javascript" src="${pageContext.request.contextPath}/js/privilege.js"></script>
    <script>
        $(function () {
            $("a[uid]").each(function () {
                $(this).click(function () {
                    if (confirm("您确定要删除吗？")) {
                            window.location.href="${pageContext.request.contextPath}/user/delete.do?uid="+ $(this).attr("uid");
                    }
                })
            })
        })
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
        <tr align="center" valign=middle id="TableTitle" >
            <th width="200px">用户名</th>
            <th width="200px">所属部门</th>
            <th width="280px">岗位</th>
            <th>相关操作</th>
        </tr>
        </thead>

        <!--显示数据列表-->
        <tbody id="TableData">
          <c:forEach items="${pageInfo.list}" var="user">
              <tr align="center">
              <td>${user.username}</td>
                  <input type="hidden" name="uid" value="${user.uid}"/>
              <td>${user.department.dname}</td>
              <td><c:forEach items="${user.postList}" var="post">${post.pname}&nbsp;&nbsp;&nbsp; </c:forEach></td>
              <td><a href="#" uid="${user.uid}" >删除</a>&nbsp;
                  <a href="${pageContext.request.contextPath}/user/updatePage.do?uid=${user.uid}" >修改</a>
                  <a href="#" name="setUserPost">设置权限</a></td>
              </tr>
          </c:forEach>
          <tr align="center">
              <td colspan="4">
                  <a href="${pageContext.request.contextPath}/user/page.do?pageNum=1">首页</a>
                  <a href="${pageContext.request.contextPath}/user/page.do?pageNum=${pageInfo.pageNum>1? pageInfo.prePage:1}">上一页</a>
                  <a href="${pageContext.request.contextPath}/user/page.do?pageNum=${pageInfo.pageNum<pageInfo.pages ? pageInfo.nextPage:pageInfo.pages}">下一页</a>
                  <a href="${pageContext.request.contextPath}/user/page.do?pageNum=${pageInfo.pages}">尾页</a>
              </td>
          </tr>
        </tbody>
    </table>
    <!-- 其他功能超链接 -->
    <div id="TableTail">
        <div id="TableTail_inside">
            <a href="${pageContext.request.contextPath}/user/addPage.do"><img src="${pageContext.request.contextPath}/css/images/createNew.png"></a>
        </div>
    </div>


    <div class="ItemBlock_Title1" id="userTitle" style="display: none;"><!-- 信息说明 --><div class="ItemBlock_Title1">
        <img border="0" width="4" height="7" src="${pageContext.request.contextPath}/css/blue/images/item_point.gif"/>
        <div id="userImage"></div>
    </div>
        <div class="ItemBlock_Title1" id="privilegeTitle" style="display: none;"><div class="ItemBlock_Title1">
            <img border="0" width="4" height="7" src="${pageContext.request.contextPath}/css/blue/images/item_point.gif" />选择权限</div>
        </div>

        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder" style="display: none;" id="privilegeContent">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <!--表头-->
                    <thead>
                    <tr align="LEFT" valign="MIDDLE" id="TableTitle">
                        <td width="300px" style="padding-left: 7px;">
                            <!-- 如果把全选元素的id指定为selectAll，并且有函数selectAll()，就会有错。因为有一种用法：可以直接用id引用元素 -->
                            <input type="checkbox" id="allchecked" disabled="disabled"/>
                            <label for="cbSelectAll">全选</label>
                        </td>
                    </tr>
                    </thead>
                    <!--显示数据列表-->
                    <tbody id="TableData">
                    <tr class="TableDetail1">
                        <!-- 显示权限树 -->
                        <td>
                            <ul id='privilegeTree' class="tree"></ul>
                            <img src="${pageContext.request.contextPath}/css/images/loading.gif" id="loading">
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 表单操作 -->
        <div id="InputDetailBar">
            <img id="savePrivilege" src="${pageContext.request.contextPath}/css/images/save.png"/>
        </div>
    </div>
</body>
</html>