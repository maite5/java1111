/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import com.mysql.cj.xdevapi.PreparableStatement;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author maite
 */
public class VeterinarioDAO {
     Connection conexion;
     
     public VeterinarioDAO()
    {
      Conexion con=new Conexion();
      conexion =con.getConnection();
    }
    public List<Veterinario> listarMascota()
    {
        PreparedStatement ps;
        ResultSet rs;
        List<Veterinario> lista=new ArrayList<>();
        
        try
        {
            ps=conexion.prepareStatement("SELECT * FROM mascota");
            rs=ps.executeQuery();
            
            while(rs.next())
            {
             int iddueño=rs.getInt("iddueño");
             String especie=rs.getString("especie");
             String raza=rs.getString("raza");
             String edad=rs.getString("edad");
             String vacunas=rs.getString("vacunas");
             Veterinario veterinario=new Veterinario(iddueño,especie,raza,edad,vacunas);
             lista.add(veterinario);            
            }
            return lista;     
            
        }
        catch(SQLException e)
        {
            System.out.println(e.toString());
            return null;
        }       
    
    
}
     public Veterinario mostrarMascota(int _id)
    {
        PreparedStatement ps;
        ResultSet rs;
        Veterinario veterinario=null;
        
        try
        {
            ps=conexion.prepareStatement("SELECT * FROM mascota WHERE iddueño=?");
            ps.setInt(1, _id);
            rs=ps.executeQuery();
            
            while(rs.next())
            {
             int iddueño=rs.getInt("iddueño");
             String especie=rs.getString("especie");
             String raza=rs.getString("raza");
             String edad=rs.getString("edad");
             String vacunas=rs.getString("vacunas");
             veterinario =new Veterinario(iddueño,especie,raza,edad,vacunas);                        
            }
            return veterinario;               
        }
        catch(SQLException e)
        {
            System.out.println(e.toString());
            return null;
        }
        
    }  
 public boolean insertarMascota(Veterinario veterinario)
    {
        PreparedStatement ps;
        try
        {
           ps=conexion.prepareStatement("INSERT INTO mascota(especie,raza,edad,vacunas) VALUES (?,?,?,?)");
           ps.setString(1, veterinario.getEspecie());
           ps.setString(2, veterinario.getRaza());
           ps.setString(3, veterinario.getEdad());
           ps.setString(4, veterinario.getVacunas());
           ps.execute();          
            return true;
        }
        catch(SQLException e)
        {
            System.out.println(e.toString());
            return false;
        }
        
    }
 public boolean actualizarMascota(Veterinario veterinario)
    {
        PreparedStatement ps;
        try
        {
           ps=conexion.prepareStatement("UPDATE mascota SET especie=?,raza=?,edad=?,vacunas=? WHERE iddueño=?");
           ps.setString(1,veterinario.getEspecie());
           ps.setString(2,veterinario.getRaza());
           ps.setString(3,veterinario.getEdad());
           ps.setString(4,veterinario.getVacunas());
           ps.setInt(5,veterinario.getIddueño());
           ps.execute();          
            return true;
        }
        catch(SQLException e)
        {
            System.out.println(e.toString());
            return false;
        }
        
    }
    public boolean eliminarMascota(int _id)
    {
        PreparedStatement ps;
        try
        {
           ps=conexion.prepareStatement("DELETE FROM mascota WHERE iddueño=?");
           ps.setInt(1, _id);
           ps.execute();          
           return true;
        }
        catch(SQLException e)
        {
            System.out.println(e.toString());
            return false;
        }
        
    }
  }