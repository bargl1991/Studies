<%-- 
    Document   : index
    Created on : 2014-01-02, 19:59:06
    Author     : yoda
--%>

<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <title>xD</title>
    </head>
    <body>
        <div id="page">

            <div id="header">
                <h1>Sennik</h1>
                <h2>Sennik zrobiony na potrzebe projektu z PSI</h2>

            </div>
            <div id="bar">
                <div class="link"><a href="#">home11</a></div>
                <div class="link"><a href="#">about</a></div>
                <div class="link"><a href="#">portfolio</a></div>
                <div class="link"><a href="#">prices</a></div>
                <div class="link"><a href="#">products</a></div>
                <div class="link"><a href="#">faq</a></div>
            </div>

            <%
                String ss = request.getParameter("Id");
                //out.println("my value" + ss);
                Class.forName("org.sqlite.JDBC");
                Connection conn
                        = DriverManager.getConnection("jdbc:sqlite:/home/yoda/NetBeansProjects/WebApplication1/web/db.sqlite3");

                String selectSQL = "SELECT Nazwa_snu FROM sen WHERE Nazwa_snu = ? ";
                Statement stmt;
                try {
                    stmt = conn.createStatement(ResultSet.TYPE_FORWARD_ONLY,
                            ResultSet.CONCUR_READ_ONLY);
                    PreparedStatement statement = conn.prepareStatement("select Nazwa_snu,Opis_snu from sen where Nazwa_snu=?");
                    statement.setString(1, ss);
                    ResultSet rs = statement.executeQuery();
                    while (rs.next()) {
                        out.println("<div class=\"contentTitle\"><h1>" + rs.getString(1) + "</h1></div>");
                        out.println("<div class=\"contentText\">" + rs.getString(2) + "</div>  ");
                    }

                    rs.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

                conn.close();
            %>
        </div>
        <div id="footer"><a href="http://www.aszx.net">web development</a> by <a href="http://www.bryantsmith.com">bryant smith</a></div>
    </body>
    <tbody>

    </tbody>
</html>
