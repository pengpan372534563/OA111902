<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<html>
<head>
    <title>修改岗位</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style>
        .a{
            color: red;
            font-size: 20px;
        }
        .b{
            color: green;
            font-size: 20px;
        }
    </style>
    <script>
        $(function () {
            //定义状态
            var flay;

            //判断
            var pnameVal= $("input[name='pname']").val().trim();
            //非空校验
            if (pnameVal == '') {
                $("#pnameMsg").html("岗位名称不能为空").attr("class","a")
                return
            }else {
                flay =true
            }

            //给输入框绑定事件
            $("input[name='pname']").blur(function () {
                //校验名称
                $.post(
                    "${pageContext.request.contextPath}/post/checkUpdatePname.do",
                    {"pname":pnameVal,"pid":${post.pid}},
                    function (data) {
                        if (data){
                            //返回值不为null  说明不能修改
                            $("#pnameMsg").html("岗位已存在，不可修改").attr("class","a")
                            flay =false
                        }else {
                            //返回值为null说明可以修改
                            $("#pnameMsg").html("岗位名称可以修改").attr("class","b");
                            flay =true
                        }
                    }
                )
            })
            //修改保存提交
            $("#saveUrl").click(function () {
                if (flay){
                    $.post(
                        "${pageContext.request.contextPath}/post/update.do",
                        $("#updateForm").serialize(),
                        function (data) {
                            if(data>=1){
                                alert("修改成功！")
                            }else {
                                alert("修改失败！")
                            }
                            location.href = "${pageContext.request.contextPath}/post/list.do"
                        }
                    )
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
            <img border="0" width="13" height="13" src="${pageContext.request.contextPath}/css/images/title_arrow.gif"/> 修改岗位
        </div>
        <div id="Title_End"></div>
    </div>
</div>

<!--显示表单内容-->
<div id=MainArea>
    <form  action="#" method="post" id="updateForm">
        <%--        隐藏id--%>
        <input type="hidden" name="pid" value="${post.pid}" />
        <div class="ItemBlock_Title1">
        </div>

        <!-- 表单内容显示 -->
        <div class="ItemBlockBorder">
            <div class="ItemBlock">
                <table cellpadding="0" cellspacing="0" class="mainForm">
                    <tr>
                        <td>岗位名称</td>
                        <td><input type="text" name="pname" value="${post.pname}" class="InputStyle"/>*
                            <span id="pnameMsg"></span></td>
                    </tr>
                    <tr>
                        <td>岗位说明</td>
                        <td><textarea name="description"   class="TextareaStyle">${post.description}</textarea></td>
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
