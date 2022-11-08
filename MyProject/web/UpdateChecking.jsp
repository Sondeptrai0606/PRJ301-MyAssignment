<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Check Attend</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

    <body>
        <c:set var = "i" scope = "page" value = "0"/>
        <h1  style="text-align: center;">Update Taking Attendance</h1>
        <div class="container">
            <p >Attendance for <b>${s.getGroup().getSubject().getCode()}</b> with Lecturer <b>${s.getGroup().getInstructor().getUserName()}</b> at Slot <b>${s.getSlot()}</b> on Day <b>${s.getDate()}</b> in Room <b>${s.getRoom().getCode()}</b> at ${s.getGroup().getCampus()}</p>
            <div class="row">
                <form action="UpdateCheckattend" style="position: relative;padding-bottom: 50px;" method="post">
                    <input name="sid" value="${param['sid']}" type="hidden">
                    <input name="instructorid" value="${s.getGroup().getInstructor().getId()}" type="hidden">
                    <table class="table">
                        <thead>
                            <tr>
                                <th style="width:5%">STT</th>
                                <th style="width:5%">Mã Lớp</th>
                                <th style="width:10%">MSSV</th>
                                <th style="width:15%">Họ và tên</th>
                                <th style="width:10%">Ảnh</th>
                                <th style="width:25%">Trạng thái</th>
                                <th style="width:10%">Người điểm danh</th>
                                <th style="width:15%">Thời gian cập nhật</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="ck" items="${cklist}" varStatus="x">
                                <tr>
                                    <td >${x.index+1}</td>
                                    <td >${s.getGroup().getCode()}</td>
                                    <td >${ck.getStudent().getCode()}</td>
                                    <td >${ck.getStudent().getName()}</td>
                                    <td ><img src="${ck.getStudent().getImg()}" width="150px"></td>
                                    <td ><input type="radio" value="1" name="${ck.getStudent().getCode()}"  ${ck.isCheck()?"checked":""}>attend <input type="radio"  ${!ck.isCheck()?"checked":""} name="${ck.getStudent().getCode()}" value="0">absent </td>
                                    <td >${s.getGroup().getInstructor().getUserName()}</td>    
                                    <td >${ck.getRecordtime()}</td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                    <input style="position: absolute; bottom: 5px; right: 0;" type="submit" value="Submit" style="align-items: flex-end" class="btn btn-primary">
                </form>

            </div>
        </div>



        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
    </body>

</html>