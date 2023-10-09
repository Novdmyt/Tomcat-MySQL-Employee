<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
        }
        .container {
            text-align: center;
            margin-top: 20px;
        }
        .greenButton {
            background-color: #44c767;
            border-radius: 16px;
            border: 1px solid #18ab29;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            font-size: 14px;
            padding: 8px 16px;
            text-decoration: none;
            text-shadow: 0px 1px 0px #2f6627;
        }
        .greenButton:hover {
            background-color: #5cbf2a;
        }
        .greenButton:active {
            position: relative;
            top: 1px;
        }
        .redButton {
            box-shadow: inset 0px 39px 0px -24px #e67a73;
            background-color: #e4685d;
            border-radius: 4px;
            border: 1px solid #ffffff;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            font-size: 12px;
            padding: 6px 14px;
            text-decoration: none;
            text-shadow: 0px 1px 0px #b23e35;
        }
        .redButton:hover {
            background-color: #eb675e;
        }
        .redButton:active {
            position: relative;
            top: 1px;
        }
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
            background-color: #ffffff;
            border: 1px solid #dddddd;
            box-shadow: 0px 1px 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 12px;
        }
        th {
            background-color: #44c767;
            color: #ffffff;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e1e1e1;
        }
        td a {
            text-decoration: none;
            color: #44c767;
            font-weight: bold;
        }
        td a:hover {
            color: #5cbf2a;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Employee</h1>
        <h3>
            <a href="<%=request.getContextPath()%>/new" class="greenButton">Add Employee</a>
        </h3>
    </div>
    <div align="center">
        <table>
            <caption><h2>Employees List</h2></caption>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Position</th>
                <th>Phone</th>
                <th>Action</th>
            </tr>
            <c:forEach var="employee" items="${listEmployee}">
                <tr>
                    <td><c:out value="${employee.id}" /></td>
                    <td><c:out value="${employee.name}" /></td>
                    <td><c:out value="${employee.position}" /></td>
                    <td><c:out value="${employee.phone}" /></td>
                    <td>
                     <div align="right">
                        <a href="<%=request.getContextPath()%>/edit?id=<c:out value='${employee.id}' />">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="<%=request.getContextPath()%>/delete?id=<c:out value='${employee.id}' />" class="redButton">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
