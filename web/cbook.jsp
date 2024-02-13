<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="assets/img/logo.webp" type="image/webp">
    <title>SEAWAYS BOOKING DETAILS</title>
    <link rel="stylesheet" href="clogin.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500&display=swap"
        rel="stylesheet">
    <style>
            #customers {
                font-family: Arial, Helvetica, sans-serif;
                border-collapse: collapse;
                width: auto;
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
<body>
    <div class="site-blocks-cover"
        style="background-image: url(home1.jpg); height: 791px; width: 100%; padding-left: 6px;"
        data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="content">
            <div class="container">
                <div class="row justify-align-center align-items-center">
                    <div class="col">
                        <div class="header">
                            <h2 style="text-shadow: 1px 1px 2px #ffffffe3;">BOOKING DETAILS</h2>
                        </div>
                        <form class="form" id="form" action="Cmain.html">
                            <div class="form-control">
                                <div class="container">
                                    <center>
                                    <H3>YOUR BOOKINGS ARE HERE</H3>
                                    <%
                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/seaways","root","root");
                                        String email = request.getParameter("email");
                                        PreparedStatement p = con.prepareStatement("Select name,jd,source,destination,nop from booking where email=?");
                                        p.setString(1, email);
                                        ResultSet resultset = p.executeQuery();
                                         int i=1;
                                    %>
                                    
                                    <TABLE BORDER="1.5" class="table table-hover" id="customers">
                                        <TR>
                                        <TH>S.NO</TH>
                                        <TH>Name</TH>
                                        <TH>JOURNEY DATE</TH>
                                        <TH>SOURCE</TH>
                                        <TH>DESTINATION</th>
                                        <TH>NUMBER OF PASSENGERS</th>
                                        </TR>
                                        <% while(resultset.next()){ %>
                                        <TR>
                                            <TD> <%= i++ %></td>
                                            <TD> <%= resultset.getString(1) %></TD>
                                            <TD> <%= resultset.getString(2) %></TD>
                                            <TD> <%= resultset.getString(3) %></TD>
                                            <TD> <%= resultset.getString(4) %></TD>
                                            <TD> <%= resultset.getString(5) %></TD>
                                        </TR>
                                        <% } %>
                                    </TABLE>
                                    
                                </div>
                            <div class="button">
                                <button type="submit" id="submit" style="color: white; text-decoration: none; padding: auto; text-align: center;">HOME</button>
                                <br>
                                <br>
                            </div>
                                    </center>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/login.js"></script>
</body>
</html>