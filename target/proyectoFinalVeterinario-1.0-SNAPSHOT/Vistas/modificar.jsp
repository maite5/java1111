<%-- 
    Document   : modificar
    Created on : 16 dic 2021, 18:20:37
    Author     : maite
--%>
<%@page import="java.util.List"%>
<%@page import="modelo.VeterinarioDAO"%>
<%@page import="modelo.Veterinario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
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
        <h1>Hello World!</h1>
         <div class="container">
            <h1 class="text-center" >Modificar Mascota </h1>
            
            <div class="row" >
               
                <%
                         String iddueño = request.getParameter ("iddueño"); // Use request para obtener 
                         int mid;
                        mid =Integer.parseInt(iddueño);
                        Veterinario resultado=null;
                        VeterinarioDAO veterinario=new VeterinarioDAO();
                        resultado=veterinario.mostrarMascota(mid);
                %> 
                <form class="p-5" action="VeterinarioController?accion=actualizar" method="POST">
                    <div class="mb-3" >
                        <label for="iddueño" class="form-label" > </label> 
                        <input type="hidden" class="form-control" id="iddueño" name="iddueño" value=<%=resultado.getIddueño()%>>
                    </div>
                    
                    <div class="mb-3" >
                        <label for="especie" class="form-label" >Especie</label>
                        <input type="text" class="form-control" id="especie" name="especie" value=<%=resultado.getEspecie()%> >
                    </div>
                    
                    <div class="mb-3" >
                        <label for="raza" class="form-label" >Raza</label>
                        <input type="text" class="form-control" id="raza" name="raza" value=<%=resultado.getRaza()%> >
                    </div>
                    
                    <div class="mb-3" >
                        <label for="edad" class="form-label" >Edad</label>
                        <input type="text" class="form-control" id="edad" name="edad" value=<%=resultado.getEdad()%>  >
                    </div>
                    
                    <div class="mb-3" >
                        <label for="vacunas" class="form-label" >Vacunas</label>
                        <input type="text" class="form-control" id="vacunas" name="vacunas" value=<%=resultado.getVacunas()%> >
                    </div>
                    
                    <button type="submit" class="btn-primary">Enviar Modificar</button>

                </form>                   
                          
                
            </div>
            
            
        </div>
    </body>
</html>
