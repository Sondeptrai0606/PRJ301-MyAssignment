<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Time Table</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>

    <body>
        <h1  style="text-align: center;">Time Table</h1>
        <div class="container">
            <form method="get" action="TeachingSchedule" class="viewTimeTable">
                <div style="margin-left: 45px; margin-bottom: 10px; margin-top: 10px;"> Campus:  
                    <select name="campus" required>
                        <c:forEach var="c" items="${clist}" >
                            <option value="${c}">${c}</option>
                        </c:forEach>
                    </select> 
                    Lecture: <input type="text" name="lecture" required>     
                    <input type="submit" value="View">
                </div>
            </form>
            <div class="row">
                <table class="table  ">
                    <thead >
                        <tr>
                            <th>Slot</th>
                            <th>Ngày </th>
                            <th>Lớp</th>
                            <th>Mã môn </th>
                            <th>Phòng</th>
                            <th>Trạng thái</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${slist}">
                            <tr>
                                <td style="width: 10%;">Slot${s.getSlot()}</td>
                                <td style="width: 16%;">${s.getDate()}</td>
                                <td style="width: 16%; ">${s.getGroup().getCode()}</td>
                                <td style="width: 16%;">${s.getGroup().getSubject().getCode()}</td>
                                <td style="width: 16%;">${s.getRoom().getCode()}</td>
                                <td style="width: 16%;">${s.isStatus()?"<p style='color:green;'>Attend</p>":"<p style='color:red;'>Not yet</p>"}</td>
                                <c:if test="${s.isStatus()}">
                                    <th><a href="CheckAttend?sid=${s.getId()}&status=${s.isStatus()}">View</a></th>
                                    </c:if>
                                    <c:if test="${!s.isStatus()}">
                                    <th><a href="CheckAttend?sid=${s.getId()}&status=${s.isStatus()}">Check</a></th>

                                </c:if>
                            </tr>
                        </c:forEach>



                    </tbody>
                </table>
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