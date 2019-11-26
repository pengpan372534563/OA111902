<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<html>
<head>
    <title>添加岗位</title>
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
          $("input[name='pname']").blur(function () {
              var panmeVal= $(this).val();
              if (panmeVal==''){
                  $("#pnameMsg").html("岗位名称不能为空").attr("class","a")
                  return ;
              }
              $.get(
                  "${pageContext.request.contextPath}/post/ajaxFindName.do",
                  {"pname":panmeVal},
                  function (data) {
                      if (data) {
                          $("#pnameMsg").html("岗位名称重复").attr("class","a")
                          flay = false;
                      }else {
                          $("#pnameMsg").html("岗位名称可以使用").attr("class","b");
                          flay = true;
                      }
                  }
              )
          });
          //  保存按钮
          $("#saveUrl").click(function () {
              $("#saveForm").attr("action","${pageContext.request.contextPath}/post/save.do");
              if ($("input[name='pname']").val()==''){
                  $("#pnameMsg").html("岗位名称不能为空").attr("class","a")
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
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/css/images/title_arrow.gif"/> 添加岗位
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
                        <td>岗位名称</td>
                        <td><input type="text" name="pname" class="InputStyle"/> *<span id="pnameMsg"></span></td>
                    </tr>
                    <tr>
                        <td>岗位说明</td>
                        <td><textarea name="description" class="TextareaStyle"></textarea></td>
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
