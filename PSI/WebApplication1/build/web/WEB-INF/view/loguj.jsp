<%-- 
    Document   : loguj
    Created on : 2014-01-02, 23:06:25
    Author     : yoda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="waliduj.jsp">
            Podaj swój login: 
            <input type="text" name="name" /> 
            Podaj swoje hasło: 
            <input type="text" name="password" /> 
            <input type="submit" value="zaloguj">
        </form>
    </body>
</html>
