<%--
  Created by IntelliJ IDEA.
  User: 小红
  Date: 2020/5/24
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>

<%@ include file="buyer_base.jsp"%>
<table id="demo" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="delete">删   除</button>
        <button class="layui-btn layui-btn-sm" lay-event="update">编   辑</button>
    </div>
</script>

<script type="text/html" id="t">
    <div class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label">名称</label>
            <div class="layui-input-inline">
                <input type="text" id='i_name' name="i_name" lay-verify="required" placeholder="请输入物品名称" autocomplete="true" class="layui-input">
            </div>
            <button id="sel" class="layui-btn layui-btn-sm" data-type="sel" lay-event="sel">查询</button>
        </div>
    </div>
</script>

<script>
    layui.use('table', function(){
        var table = layui.table,
            form=layui.form;

        //第一个实例
        table.render({
            elem: '#demo'
            ,toolbar: '#t'
            ,height: 500
            ,even:true
            ,url: '<%=basePath%>buyer/buyerqlbook' //数据接口
            ,page: true //开启分页
            ,id:'tests'
            ,limit:10
            ,cols: [[
                {field:'bookid',title:'书本编号',fixed: 'left', width: 100}
                ,{field: 'bookname', title: '书本名字', width: 100}
                ,{field: 'bookauthor', title: '书本作者', width: 100}
                ,{field: 'bookpublisher', title: '书本出版社',width: 100}
                ,{field: 'bookquantity', title: '数量', width: 100, sort: true}
                ,{field: 'bookprice', title: '单价',width: 100, sort: true}
                ,{field:'right',height:80, width:200, title: '操作', toolbar:'#toolbarDemo'}
            ]]
        });

        table.on('tool(test)', function(obj){
            var data = obj.data;
            console.log(data);
            layer.msg(data.bookname);
            var layEvent = obj.event; //获得 lay-event 对应的值
            switch(obj.event){
                case 'delete':
                    // layer.msg('删除');
                    layer.confirm('确定删除ID为：'+data.bookid+"的书籍吗?",function(index){
                        $.ajax({
                            type:"post",
                            url:"<%=basePath%>buyer/deletelackbook",
                            data:{'bookid':data.bookid},//向服务端发送删除的id
                            // dataType:"json",
                            success:function(data){
                                if (data.count > 0) {
                                    layer.msg('删除成功');
                                    window.parent.location.reload();
                                    // table.reload("demo");
                                    layer.close(index);
                                }
                            }
                        });
                        return false;
                        //layer.close(index);
                    });
                    break;
                case 'update':
                    json = JSON.stringify(data);
                    layui.use('layer', function () {
                        //layer.msg(json);
                        layer.open({
                            title: '修改书本信息',
                            maxmin: true,
                            type: 2,
                            content: 'buyer_uplackbook.jsp',
                            area: ['500px', '400px']
                        });
                    });
                    break;
            }

        });
        $("#sel").click(function (obj) {
            var data = obj.data
            console.log('1111112');
            console.info("sel");
            var bookname = $("#i_name").val();
            console.log(bookname);
            table.reload('tests', {
                url:'<%=basePath%>buyer/buyerqlbookbyid/'+bookname
                , page:{
                    curr:1
                },where:{
                    bookname:bookname
                }
            })

        });
    });



</script>

