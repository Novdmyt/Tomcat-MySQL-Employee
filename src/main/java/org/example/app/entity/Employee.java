package org.example.app.entity;

public class Employee {
    private int id;
    private String name;
    private String position;
    private String phone;

    public Employee(int id){
        this.id = id;
    }

    public Employee(String position, String phone){
        this.position = position;
        this.phone = phone;
    }

    public Employee(int id, String position, String phone){
        this.id = id;
        this.position = position;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPosition() {
        return position;
    }

    public String getPhone() {
        return phone;
    }
}
