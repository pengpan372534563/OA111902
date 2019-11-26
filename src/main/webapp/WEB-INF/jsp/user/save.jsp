<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<html>
<head>
    <title>用户信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style>
        .a{
            color: red;
            font-size: 30px;
        }
        .b{
            color: green;
            font-size: 30px;
        }
    </style>
    <script>
      $(function () {
          //状态位
          var flay;
          //表单验证
          $("input[name='username']").blur(function () {
              var usernameVal= $(this).val();
              if (usernameVal==''){
                  $("usernameMsg").html("岗位名称不能为空").attr("class","a")
                  return ;
              }
              $.get(
                  "${pageContext.request.contextPath}/user/ajaxUserFindName.do",
                  {"username":usernameVal},
                  function (data) {
                      if (data) {
                          $("#usernameMsg").html("岗位名称重复").attr("class","a")
                          flay = false;
                      }else {
                          $("#usernameMsg").html("岗位名称可以使用").attr("class","b");
                          flay = true;
                      }
                  }
              )
          });
          //  保存按钮
          $("#saveUrl").click(function () {
              $("#saveForm").attr("action","${pageContext.request.contextPath}/user/saveUser.do");
              if ($("input[name='username']").val()==''){
                  $("#usernameMsg").html("岗位名称不能为空").attr("class","a")
                  return ;
              }
              if (flay){
                  $("#saveForm").submit();
              }
          })
      })
    </script>
</head>
<body>

<div id="Title_bar">
    <div id="Title_bar_Head">
        <div id="Title_Head"></div>
        <div id="Title"><!--页面标题-->
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/css/images/title_arrow.gif"/> 用户信息
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>
    <form  action="#" method="post" id="saveForm">
        <div class="ItemBlock_Title1">
            <img border="0" width="4" height="7" src="css/blue/images/item_point.gif" /> 用户信息 </div>
        </div>
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr>
                        <td width="100">所属部门</td>
                        <td>
                            <select name="departmentId">
                                <option value="0">请选择部门</option>
                                <c:forEach items="${departmentList}" var="department">
                                    <option value="${department.did}">${department.dname}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>登录名</td>
                        <td><input type="text" name="username" class="InputStyle"/> *(登录名要唯一)<span id="usernameMsg"></span></td>
                    </tr>
                    <tr>
                        <td>性别</td>
                        <td><input type="radio" value="男" name="sex" checked id="male" /><label for="male">男</label>
                            <input type="radio" value="女" name="sex" id="female" /><label for="female">女</label></td>
                    </tr>
                    <tr>
                        <td>E-mail</td>
                        <td><input type="email" name="email" class="InputStyle"/></td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="ItemBlock_Title1"><!-- 信息说明 -->
            <div class="ItemBlock_Title1">
            <img border="0" width="4" height="7" src="css/blue/images/item_point.gif"/>
                岗位设置
            </div>
        </div>
        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
        <div class="ItemBlock">
            <table cellpadding="0" cellspacing="0" class="mainForm">
                <tr><td width="100">岗位</td>
                    <td>
                        <select  name="pids" multiple="true" size="10" class="SelectStyle">
                            <c:forEach items="${postList}" var="post">
                                <option value="${post.pid}">${post.pname}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
            </table>
        </div>
        </div>
        <!-- 表单操作 -->
        <div id="InputDetailBar">
            <a href="#" id="saveUrl"><img src="${pageContext.request.contextPath}/css/images/save.png"/></a>
            <a href="javascript:history.go(-1)"><img src="${pageContext.request.contextPath}/css/images/goBack.png"/></a>
        </div>
    </form>
</div>
</body>
</html>
