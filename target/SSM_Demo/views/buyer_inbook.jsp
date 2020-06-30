<%--
  Created by IntelliJ IDEA.
  User: 小红
  Date: 2020/5/24
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<%@ include file="buyer_base.jsp"%>
    <title>教材发行人员查看书本</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/layui.css" media="all">

    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.js"></script>

    <script src="${pageContext.request.contextPath}/static/layui.js"></script>
    <script src="${pageContext.request.contextPath}/static/layui.all.js"></script>





    <script type="text/javascript">
        $(document).ready(function () {
            $("#Btn").click(function () {
                var book_id = $("#bookid").val();
                var book_n = $("#bookname").val();
                var book_a = $("#bookauthor").val();
                var book_p = $("#bookpublisher").val();
                var book_pr = $("#bookprice").val();
                var major = $("#major").val();
                var book_quan = $("#bookquantity").val();


                $.ajax({
                    type:"post",
                    url:"<%=basePath%>buyer/buyer_inbooks",
                    data:{
                        "bookid":book_id,
                        "bookname":book_n,
                        "bookauthor":book_a,
                        "bookpublisher":book_p,
                        "bookprice":book_pr,
                        "major":major,
                        "bookquantity":book_quan

                    },
                    // dataType:"post",
                    success:function (data) {
                        if (data.count > 0) {
                            alert("增加fdsf成功");
                        }
                        else {
                            alert("增加失败");
                        }
                    }
                });          $("#Books")[0].reset();

            });
        });
    </script>


<form id="Books"  method="post">
    <table>
        <tr>
            <td>书本编号:</td>
            <td><input type="text" name="Books.bookid" id="bookid"></td>
        </tr>

        <tr>
            <td>书本名字:</td>
            <td><input type="text" name="Books.bookname" id="bookname"></td>
        </tr>
        <tr>
            <td>书本作者:</td>
            <td><input type="text" name="Books.bookauthor" id="bookauthor"></td>
        </tr>
        <tr>
            <td>书本出版社:</td>
            <td><input type="text" name="Books.bookpublisher" id="bookpublisher"></td>
        </tr>
        <tr>
            <td>书本单价:</td>
            <td><input type="text" name="Books.bookprice" id="bookprice"></td>
        </tr>

        <tr>
            <td>所属专业:</td>
            <td><input type="text" name="Books.major" id="major"></td>
        </tr>
   <tr>
            <td>书本数量:</td>
            <td><input type="text" name="Books.bookquantity" id="bookquantity"></td>
        </tr>


        <tr>
            <td></td>
            <td><input type="button" value="提交" id="Btn" /></td>
        </tr>
    </table>
</form>
<br><br>


