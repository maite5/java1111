<%-- 
    Document   : index
    Created on : 25 dic 2021, 14:59:08
    Author     : maite
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Veterinario"%>
<%@page import="modelo.VeterinarioDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
       
        <title>JSP Page</title>
    </head>
    <body>
        <h1> Mascotas!</h1>
         <%
                        List<Veterinario> resultado=null;
                        VeterinarioDAO veterinario=new VeterinarioDAO();
                        resultado=veterinario.listarMascota();
                             for(int i=0;i<resultado.size();i++)
                             {
                             
        %>
         
        <br> 
            <div class="row"> 
  <div class="col-sm-6"> 
    <div class="card">
      <div class="card-body">  
         <ul class="list-group list-group-flush">  
    <li class="list-group-item"> Numero de identificación: <%=resultado.get(i).getIddueño()%>  </li>
     <li class="list-group-item"> Animal:  <%=resultado.get(i).getEspecie()%>  </li>        
    <li class="list-group-item">Raza: <%=resultado.get(i).getRaza()%> </li>
    <li class="list-group-item"> Edad: <%=resultado.get(i).getEdad()%></li> 
    <li class="list-group-item"> Vacuna: <%=resultado.get(i).getVacunas()%></li> </ul>
  </div>
    </div>
  </div>
  
</div>

        
        <%
                    } 
                    %>
        
                    
             
        
             
             
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
   
   
        
    </body>
</html>
