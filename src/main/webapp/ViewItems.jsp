<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.demo2.ToDoListWork" %>

<%@ page import="com.example.demo2.todolist" %>
<!DOCTYPE html>
<html>
<head>
    <title>View To-Do Items</title>
</head>
<body>
<h1>To-Do Items</h1>
<ul>
    <%
        com.example.demo2.ToDoListWork todoList = new com.example.demo2.ToDoListWork();
        List<todolist> items = todoList.getItems();
        for (todolist item : items) {
            out.print("<li>" + item.getDescription() +
                    " <a href='delete-item?id=" + item.getId() + "'>Delete</a></li>");
        }
    %>
</ul>
<a href="index.jsp">Back to Home</a>
</body>
</html>