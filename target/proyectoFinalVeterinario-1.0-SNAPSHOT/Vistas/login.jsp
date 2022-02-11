<%-- 
    Document   : login
    Created on : 26 dic 2021, 18:07:11
    Author     : maite
--%>
<%@page import="modelo.Veterinario"%>
<%@page import="modelo.VeterinarioDAO"%>
<%@page import="controlador.VeterinarioController"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        
    </head>
    <body>
    <center> <h1> Login !</h1> </center> 
        
      <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form>
                    <form method="post" action="login.jsp" >
                        <div class="form-group">
                            <label>Usuario</label>
                            <input type="text" class="form-control" name="user" placeholder=" Escribe tu usuario">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password" placeholder="Escribe tu password">
                        </div>
                        <button type="submit" class="btn btn-primary" name="login" >Login</button>
                    </form>
                    <%
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;
                        if (request.getParameter("login") != null) {
                            String user = request.getParameter("user");
                            String password = request.getParameter("password");
                            HttpSession sesion = request.getSession();
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/veterinario","root","root");
                                st = con.createStatement();
                                rs = st.executeQuery(" SELECT * FROM `user` where user='" + user + "' and password='" + password + "'; "); 
                                while (rs.next()) {
                                    sesion.setAttribute("logueado", "1");
                                    sesion.setAttribute("user", rs.getString("user"));
                                    sesion.setAttribute("id", rs.getString("id"));
                                    response.sendRedirect("VeterinarioController.java");
                                }
                                out.print(" <div class=\"alert alert-danger\" role=\"alert\"> Usuario no valido </div>");
                            } catch (Exception e) {
                            }
                        }
                    %>

                </div>
            </div>
        </div>
        
    </body>
    
    <%
        if( request.getParameter("login")!=null ){
            String user=request.getParameter("user");
            String password=request.getParameter("password");
            HttpSession sesion=request.getSession();
            if(user.equals("admin") && password.equals("admin")){
                sesion.setAttribute("logueado", "1");
                sesion.setAttribute("user", user);
                response.sendRedirect("index.jsp");   
            }  
            else{
                out.print(" Te quivocaste usuario o contraseña invalidos"); 
            }
        }
    %> 
</html>
