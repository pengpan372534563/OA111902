<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<html>
<head>
    <title>添加部门</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script>
          //保存提交
          function save() {
              var saveForm=document.getElementById("saveForm");
              saveForm.action="${pageContext.request.contextPath}/department/save.do";
              saveForm.submit();
          }
    </script>
</head>
<body>

<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/css/images/title_arrow.gif"/> 添加管理
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>
    <form  action="#" method="post" id="saveForm">
        <div class="ItemBlock_Title1">
        </div>

        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr>
                        <td>部门名称</td>
                        <td><input type="text" name="dname" class="InputStyle"/> *<span id="dnameMsg"></span></td>
                    </tr>
                    <tr>
                        <td>职能说明</td>
                        <td><textarea name="description" class="TextareaStyle"></textarea></td>
                    </tr>
                </table>
            </div>
        </div>
        <!-- 表单操作 -->
        <div id="InputDetailBar">
            <a href="javascript:save()" id="saveUrl"><img src="${pageContext.request.contextPath}/css/images/save.png"/></a>
            <a href="javascript:history.go(-1)"><img src="${pageContext.request.contextPath}/css/images/goBack.png"/></a>
        </div>
    </form>
</div>
</body>
</html>
