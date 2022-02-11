<%-- 
    Document   : veterinario
    Created on : 16 dic 2021, 18:18:28
    Author     : maite
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.Veterinario"%>
<%@page import="modelo.VeterinarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/6ed7d13145.js" crossorigin="anonymous"></script>
    
    <!-- Font Awesome -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
  rel="stylesheet"
/>
<!-- Google Fonts -->
<link
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
  rel="stylesheet"
/>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.1/mdb.min.css"
  rel="stylesheet"
/>
    </head>
    <body>
    <center> <h1> Panel de Control!</h1> </center> 
        
         <div class="container">
            <div class="row">
                <a class="btn btn-primary col-4 m-4" href="VeterinarioController?accion=nuevo">Agregar Mascota</a>
                <table class="table table-primary">
                    <thead> 
    <tr>
      <th>id</th>
      <th>Especie</th>
      <th>Raza</th>
      <th>Edad</th>
      <th>Vacunas</th> 
      <th class="text-center" >Modificar</th>
      <th class="text-center" >Eliminar</th>
                       
    </tr>
  </thead>
  <tbody>
       <%
                        List<Veterinario> resultado=null;
                        VeterinarioDAO veterinario=new VeterinarioDAO();
                        resultado=veterinario.listarMascota();
                             for(int i=0;i<resultado.size();i++)
                             {
                             String ruta="VeterinarioController?accion=modificar&iddueño="+resultado.get(i).getIddueño();
                             String rutaE="VeterinarioController?accion=eliminar&iddueño="+resultado.get(i).getIddueño();;
        %>
         
         <tr>
                            <td scope="row"><%=resultado.get(i).getIddueño()%></td> 
                            <td><%=resultado.get(i).getEspecie()%></td> 
                            <td><%=resultado.get(i).getRaza()%></td>  
                            <td><%=resultado.get(i).getEdad()%></td> 
                            <td><%=resultado.get(i).getVacunas()%></td>
                            <td class="text-center"><a class="text-success" href=<%=ruta%>><i class="fas fa-angle-double-down"></i></td> 
                            <td class="text-center" ><a class="text-success" href=<%=rutaE%>><i class="fas fa-angle-double-down"></i></td>         
         </tr>    
        

   
  </tbody>
  <%
                    }
                    %>
</table>
</div>
            
        </div>
    </body>
</html>
