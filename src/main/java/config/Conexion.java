/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;


/**
 *
 * @author maite
 */
public class Conexion {
    

    public String driver="com.mysql.cj.jdbc.Driver";
    
    public Connection getConnection()
    {
        Connection conexion=null;
        try
        {
            Class.forName(driver);
            conexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/veterinario","root","root");
            
        }
        catch(ClassNotFoundException | SQLException e) 
        {
                   System.out.println(e.toString()); 
        }
        return conexion;
    }
    
    
    public static void main(String[] args) throws SQLException
    {
            Connection conexion=null;
            Conexion con = new Conexion();
            conexion=con.getConnection();
            PreparedStatement ps;
        ResultSet rs;
        
        ps=conexion.prepareStatement("SELECT * FROM mascota");
            rs=ps.executeQuery();
            
            while(rs.next())
            {
                int iddueño=rs.getInt("iddueño");
                String especie=rs.getString("especie");
                String raza=rs.getString("raza");
                String edad=rs.getString("edad");
                String vacunas=rs.getString("vacunas");
                System.out.println("ID: "+iddueño+" Especie: "+especie+" Raza: "+raza+" Edad: "+edad +" Vacunas: "+vacunas);
                
                
            }
            
        
    
    
    
    }
    
    
    

}
