/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**

 * @author PC
 */
public class Degree {
    private int degree_id;
    private String degree_name;

    public Degree() {
    }

    public Degree(int degree_id, String degree_name) {
        this.degree_id = degree_id;
        this.degree_name = degree_name;
    }

    public int getDegree_id() {
        return degree_id;
    }

    public void setDegree_id(int degree_id) {
        this.degree_id = degree_id;
    }

    public String getDegree_name() {
        return degree_name;
    }

    public void setDegree_name(String degree_name) {
        this.degree_name = degree_name;
    }

    @Override
    public String toString() {
        return "Degree{" + "degree_id=" + degree_id + ", degree_name=" + degree_name + '}';
    }
    
    
}
