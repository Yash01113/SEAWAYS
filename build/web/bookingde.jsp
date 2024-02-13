<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            #customers {
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            #customers td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
            }

            #customers tr:nth-child(even){background-color: #f2f2f2;}

            #customers tr:hover {background-color: #ddd;}

            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: black;
                color: white;
            }
        </style>
    </head>
    <center>
        <div class="container">
            <H1>RESERVATION DETAILS</H1>
            <%
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection con=DriverManager.getConnection("jdbc:mysql://localhost/seaways","root","root");
                 Statement stmt = con.createStatement();
                 ResultSet resultset = stmt.executeQuery("Select * from booking");
                 int i=1;
            %>

            <TABLE BORDER="1.5" id="customers" class="table table-hover">
                <TR>
                <TH>S.NO</TH>
                <TH>Name</TH>
                <TH>Email</TH>
                <TH>Mobile Number</TH>
                <TH>JOURNEY DATE</TH>
                <TH>SOURCE</th>
                <th>DESTINATION</th>
                <th>Number Of Passengers</th>
                </TR>
                <% while(resultset.next()){ %>
                <TR>
                    <TD> <%= i++ %></td>
                    <TD> <%= resultset.getString(1) %></TD>
                    <TD> <%= resultset.getString(2) %></TD>
                    <TD> <%= resultset.getString(3) %></TD>
                    <TD> <%= resultset.getString(4) %></TD>
                    <TD> <%= resultset.getString(5) %></TD>
                    <TD> <%= resultset.getString(6) %></TD>
                    <TD> <%= resultset.getString(7) %></TD>

                </TR>
                <% } %>
            </TABLE>
        </div>
</html>