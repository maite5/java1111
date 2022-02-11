/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Veterinario;
import modelo.VeterinarioDAO;

/**
 *
 * @author maite
 */
@WebServlet(name = "VeterinarioController", urlPatterns = {"/VeterinarioController"})
public class VeterinarioController extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        VeterinarioDAO veterinariodao=new VeterinarioDAO();
        String accion;
        RequestDispatcher dispatcher = null;
        accion=request.getParameter("accion");
        
        if(accion==null||accion.isEmpty())
        {
            dispatcher=request.getRequestDispatcher("Vistas/veterinario.jsp");
        }
        else if(accion.equals("modificar"))
        { 
           dispatcher=request.getRequestDispatcher("Vistas/modificar.jsp"); 
        }
         else if(accion.equals("actualizar"))
        {
            int iddueño=Integer.parseInt(request.getParameter("iddueño"));
            String especie=request.getParameter("especie");
            String raza=request.getParameter("raza");
            String edad=request.getParameter("edad");    
            String vacunas=request.getParameter("vacunas");  
            Veterinario veterinario=new Veterinario(iddueño,especie,raza,edad,vacunas);
            veterinariodao.actualizarMascota(veterinario);            
            dispatcher=request.getRequestDispatcher("Vistas/veterinario.jsp");
        }
         
         
        else if(accion.equals("eliminar"))
        {
          int iddueño=Integer.parseInt(request.getParameter("iddueño")) ;
          veterinariodao.eliminarMascota(iddueño);
          dispatcher=request.getRequestDispatcher("Vistas/veterinario.jsp"); 
        }
        
        
        else if(accion.equals("nuevo"))
        {
            dispatcher=request.getRequestDispatcher("Vistas/nuevo.jsp"); 
        } 
        else if(accion.equals("insert"))
        {
            String especie=request.getParameter("especie");
            String raza=request.getParameter("raza");
            String edad=request.getParameter("edad"); 
            String vacunas=request.getParameter("vacunas"); 
            Veterinario veterinario=new Veterinario(0,especie,raza,edad,vacunas);
            veterinariodao.insertarMascota(veterinario);            
            dispatcher=request.getRequestDispatcher("Vistas/veterinario.jsp"); 
        }
        else
        {
            dispatcher=request.getRequestDispatcher("Vistas/veterinario.jsp");
        }
        
        
            
        dispatcher.forward(request,response);        
    } 

        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException 
    {
        doGet(request,response);
    }

    
    @Override
    public String getServletInfo() 
    {
        return "Short description"; 
    }

}

    //  }
  //  }

  
    