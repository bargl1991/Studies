<%-- 
    Document   : strona
    Created on : 2014-01-15, 19:26:06
    Author     : yoda
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
<!DOCTYPE html>
<html >
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>SENNIK</title>
        <meta name="keywords" content="" />
        <meta name="Premium Series" content="" />
        <link href="css/default.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <body>
        <!-- start header -->
        <div id="header">
            <div id="logo">
                <h1><a href="#"><span>SEN</span>NIK</a></h1>
                <p>  Layout Designed By Free CSS Templates</p>
            </div>
            <!--            <div id="menu">
                            <ul id="main">
                                <li class="current_page_item"><a href="#">Homepage</a></li>
                                <li><a href="#">Products</a></li>
                                <li><a href="#">Services</a></li>
                                <li><a href="#">About Us</a></li>
                                <li><a href="#">Contact Us</a></li>
                            </ul>
                            <ul id="feed">
                                <li><a href="#">Entries RSS</a></li>
                                <li><a href="#">Comments RSS</a></li>
                            </ul>
                        </div>-->

        </div>
        <!-- end header -->
        <div id="wrapper">
            <!-- start page -->
            <div id="page">
                <div id="sidebar1" class="sidebar">
                    <ul>
                        <li>
                            <h2>Recent Posts</h2>
                            <ul>
                                <li><a href="#">Aliquam libero</a></li>
                                <li><a href="#">Consectetuer adipiscing elit</a></li>
                                <li><a href="#">Metus aliquam pellentesque</a></li>
                                <li><a href="#">Suspendisse iaculis mauris</a></li>
                                <li><a href="#">Proin gravida orci porttitor</a></li>
                                <li><a href="#">Aliquam libero</a></li>
                                <li><a href="#">Consectetuer adipiscing elit</a></li>
                                <li><a href="#">Metus aliquam pellentesque</a></li>
                                <li><a href="#">Suspendisse iaculis mauris</a></li>
                                <li><a href="#">Proin gravida orci porttitor</a></li>
                            </ul>
                        </li>

                    </ul>
                </div>
                  <div id="content">
                    <div class="flower"><img src="http://img.wallpaperstock.net:81/dream-baby-toy-letters-wallpapers_35098_1920x1200.jpg" alt="" width="510" height="250" /></div>
                    
                </div>
                
               
                
                
                
                
                <!-- end content -->
                <!-- start sidebars -->
                <div id="sidebar2" class="sidebar">
                    <ul>
                        <li>
                            <form id="searchform" method="get" action="#">
                                <div>
                                    <h2>Site Search</h2>
                                    <input type="text" name="s" id="s" size="15" value="" />
                                </div>
                            </form>
                        </li>

                    </ul>
                </div>
                <%
                out.println("<div id=\"content\">");
                Class.forName("org.sqlite.JDBC");
                Connection conn =
                     DriverManager.getConnection("jdbc:sqlite:/home/yoda/NetBeansProjects/WebApplication1/web/db.sqlite3");
                Statement stat = conn.createStatement();
 
                ResultSet rs = stat.executeQuery("select * from sen order by id limit 3;");
 
                while (rs.next()) {
                   // String z = "<h1 class=\"title\"><a href=\"Sen.jsp?Id=" +rs.getString("Nazwa_snu") + " \"class=\"contentTitle\"> <h1>" +rs.getString("Nazwa_snu") +"</h1></a>";
                    String zz = "<div class=\"post\"> <h1 class=\"title\"><a href=\"Sen.jsp?Id=" +rs.getString("Nazwa_snu") + " \">" + rs.getString("Nazwa_snu") +
                            "</a></h1><div class=\"entry\"><p>" + rs.getString("Opis_snu") + "</p></div></div>" ;
                    out.println(zz);
                    //out.println("<div class=\"contentText\">" + rs.getString("Opis_snu") + "</div>  ");
                    //out.println(z);
                }
 
                rs.close();
                conn.close();
                out.println("</div>");
        %>
                <!-- end sidebars -->
                <div style="clear: both;">&nbsp;</div>
            </div>
            <!-- end page -->
        </div>
        
         
        <div id="footer">
            <p class="copyright">&copy;&nbsp;&nbsp;2009 All Rights Reserved &nbsp;&bull;&nbsp; Design by <a href="http://www.freecsstemplates.org/" rel="nofollow">FreeCSSTemplates.org</a>.</p>
            <p class="link"><a href="#">Privacy Policy</a>&nbsp;&#8226;&nbsp;<a href="#">Terms of Use</a></p>
        </div>
    </body>
</html>
