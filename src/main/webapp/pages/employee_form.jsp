<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Employee</title>
    <style>
        body {
            background-color: #f2f2f2;
            font-family: Arial, sans-serif;
        }

        .greenButton {
            background-color: #44c767;
            border-radius: 16px;
            border: 1px solid #18ab29;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 14px;
            padding: 10px 20px;
            text-decoration: none;
            text-shadow: 0px 1px 0px #2f6627;
            transition: background-color 0.3s ease-in-out;
        }

        .greenButton:hover {
            background-color: #5cbf2a;
        }

        .greenButton:active {
            position: relative;
            top: 1px;
        }

        .container {
            width: 80%; /* Make the container wider */
            margin: 0 auto;
            background-color: #ffffff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
            margin-top: 20px;
            background-color: #66cc66; /* Set the background color to a brighter green */
            color: #ffffff; /* Set the text color to white */
        }

        table th, table td {
            padding: 16px; /* Increase padding for more spacing */
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #4bbf4b; /* Set the header background color to a slightly darker green */
        }

        input[type="text"] {
            width: 100%;
            padding: 12px; /* Increase padding for input elements */
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #44c767;
            border: none;
            color: #ffffff;
            padding: 14px 24px; /* Increase padding for button */
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 10px 0;
            cursor: pointer;
            border-radius: 16px;
            transition: background-color 0.3s ease-in-out;
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
        <div align="center">
            <a href="<%=request.getContextPath()%>/list" class="greenButton">List Employee</a>
        </div>
    </h3>

    <c:if test="${employee != null}">
        <form action="update" method="post">
    </c:if>
    <c:if test="${employee == null}">
        <form action="insert" method="post">
    </c:if>

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
            <input type="hidden" name="id" value="<c:out value='${employee.id}' />"/>
        </c:if>
        <tr>
            <th>Name:</th>
            <td>
                <input type="text" name="name" placeholder="Enter Name" value="<c:out value='${employee.name}' />"/>
            </td>
        </tr>
        <tr>
            <th>Position:</th>
            <td>
                <input type="text" name="position" placeholder="Enter Position" value="<c:out value='${employee.position}' />"/>
            </td>
        </tr>
        <tr>
            <th>Phone:</th>
            <td>
                <input type="text" name="phone" placeholder="Enter Phone (e.g., +38(123)9876543)" value="<c:out value='${employee.phone}' />"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Save"/>
            </td>
        </tr>
    </table>
    </form>
</div>
</body>
</html>
