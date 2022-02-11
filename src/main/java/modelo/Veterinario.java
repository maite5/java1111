/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author maite
 */
public class Veterinario {
    private int iddueño;
    private String especie;
    private String raza;
    private String edad;
    private String vacunas; 

    public int getIddueño() {
        return iddueño;
    }

    public void setIddueño(int iddueño) {
        this.iddueño = iddueño;
    }

    public String getEspecie() {
        return especie;
    }

    public void setEspecie(String especie) {
        this.especie = especie;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getEdad() {
        return edad;
    }

    public void setEdad(String edad) {
        this.edad = edad;
    }

    public String getVacunas() {
        return vacunas;
    }

    public void setVacunas(String vacunas) {
        this.vacunas = vacunas;
    }

    public Veterinario(int iddueño, String especie, String raza, String edad, String vacunas) {
        this.iddueño = iddueño;
        this.especie = especie;
        this.raza = raza;
        this.edad = edad;
        this.vacunas = vacunas;
    }
}
