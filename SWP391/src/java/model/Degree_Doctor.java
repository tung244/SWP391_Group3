/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @autho

CREATE TABLE Degree_Doctor(
	doctor_id INT,
	degree_id INT,
	PRIMARY KEY(doctor_id,degree_id),
	FOREIGN KEY (doctor_id) REFERENCES dbo.Doctors(doctor_id),
	FOREIGN KEY (degree_id) REFERENCES dbo.Degree(degree_id)
)r PC
 */
public class Degree_Doctor {
    private int doctor_id;
    private int degree_id;

    public Degree_Doctor() {
    }

    public Degree_Doctor(int doctor_id, int degree_id) {
        this.doctor_id = doctor_id;
        this.degree_id = degree_id;
    }

    public int getDoctor_id() {
        return doctor_id;
    }

    public void setDoctor_id(int doctor_id) {
        this.doctor_id = doctor_id;
    }

    public int getDegree_id() {
        return degree_id;
    }

    public void setDegree_id(int degree_id) {
        this.degree_id = degree_id;
    }

    @Override
    public String toString() {
        return "Degree_Doctor{" + "doctor_id=" + doctor_id + ", degree_id=" + degree_id + '}';
    }
    
    
}
