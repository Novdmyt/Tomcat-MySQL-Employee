<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
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
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
            background-color: #ffffff;
            border: 1px solid #dddddd;
            border-radius: 8px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
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
        input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #44c767;
            border: none;
            border-radius: 4px;
            color: white;
            padding: 10px 20px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #5cbf2a;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Employee</h1>
        <h3>
            <a href="<%=request.getContextPath()%>/list" class="greenButton">List Employee</a>
        </h3>
    </div>
    <div align="center">
        <form action="update"" method="post">
            <table>
                <caption>
                    <h3>
                        <c:if test="${employee != null}">
                            Edit Employee
                        </c:if>
                        <c:if test="${employee == null}">
                            Add New Employee
                        </c:if>
                    </h3>
                </caption>
                <c:if test="${employee != null}">
                    <input type="hidden" name="id" value="<c:out value='${employee.id}' />" />
                </c:if>
                <tr>
                    <th>Name:</th>
                    <td>
                        <input type="text" name="name" placeholder="Enter Name" value="<c:out value='${employee.name}' />" />
                    </td>
                </tr>
                <tr>
                    <th>Position:</th>
                    <td>
                        <input type="text" name="position" placeholder="Enter Position" value="<c:out value='${employee.position}' />" />
                    </td>
                </tr>
                <tr>
                    <th>Phone:</th>
                    <td>
                        <input type="text" name="phone" placeholder="Enter Phone (e.g., +38(123)9876543)" value="<c:out value='${employee.phone}' />" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                     <div align="center">
                        <input type="submit" value="Save"  />

                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
