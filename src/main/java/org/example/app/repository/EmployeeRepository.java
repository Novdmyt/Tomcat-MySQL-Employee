package org.example.app.repository;

import org.example.app.database.DBConn;
import org.example.app.entity.Employee;
import org.example.app.utils.ValidatorName;
import org.example.app.utils.ValidatorPhone;
import org.example.app.utils.ValidatorPosition;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class EmployeeRepository {
    private static final Logger LOGGER = Logger.getLogger(EmployeeRepository.class.getName());

    public void createEmployee(Employee employee){
        String sql = "INSERT INTO employees (name, position, phone) VALUES (?, ?, ?)";
        try(Connection connection = DBConn.connection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            if(ValidatorName.isValidName(employee.getName())){
                preparedStatement.setString(1, employee.getName());
            }else {
                throw new IllegalArgumentException("Invalid name format");
            }
            if(ValidatorPosition.isValidPosition(employee.getPosition())){
                preparedStatement.setString(2, employee.getPosition());
            }else {
                throw new IllegalArgumentException("Invalid position format");
            }
            if (ValidatorPhone.isValidPhoneNumber(employee.getPhone())) {
                preparedStatement.setString(3, employee.getPhone());
            } else {
                throw new IllegalArgumentException("Invalid phone number format");
            }
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            LOGGER.log(Level.WARNING, e.getMessage(), e);
        }
    }

    public List<Employee> readEmployee(){
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM employees";
        try (Connection connection = DBConn.connection();
             Statement statement = connection.createStatement()){
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()){
                list.add(new Employee(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("position"),
                        resultSet.getString("phone")
                ));
            }
            return list;
        }catch (SQLException e){
            LOGGER.log(Level.WARNING, e.getMessage(), e);
            return Collections.emptyList();
        }
    }

    public Employee getEmployeeId(int id){
Employee employee = null;
String sql = "SELECT * FROM employees WHERE id = ?";
try (Connection connection = DBConn.connection();
     PreparedStatement preparedStatement = connection.prepareStatement(sql)){
    preparedStatement.setInt(1, id);
    ResultSet resultSet = preparedStatement.executeQuery();
    if(resultSet.next()){
        employee = new Employee(
                id,
                resultSet.getString("name"),
                resultSet.getString("position"),
                resultSet.getString("phone")
        );
    }

}catch (SQLException e){
    LOGGER.log(Level.WARNING, e.getMessage(), e);
}
return employee;
    }
public void updateEmployee(Employee employee){
        String sql = "UPDATE employees SET name = ?, position = ?, phone = ? WHERE id = ?";
    try (Connection conn = DBConn.connection();
         PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
        if(ValidatorName.isValidName(employee.getName())){
            preparedStatement.setString(1, employee.getName());
        }else {
            throw new IllegalArgumentException("Invalid name format");
        }
        if(ValidatorPosition.isValidPosition(employee.getPosition())){
            preparedStatement.setString(2, employee.getPosition());
        }else {
            throw new IllegalArgumentException("Invalid position format");
        }
        if(ValidatorPhone.isValidPhoneNumber(employee.getPhone())){
            preparedStatement.setString(3, employee.getPhone());
        }else {
            throw new IllegalArgumentException("Invalid phone number format");
        }
        preparedStatement.setInt(4, employee.getId());
         preparedStatement.executeUpdate();
    } catch (SQLException e) {
        LOGGER.log(Level.WARNING, e.getMessage(), e);
    }
}

public void deleteEmployee(Employee employee){
    String sql = "DELETE FROM employees where id = ?";
    // try-with-resources statement for automatic disconnect from DB
    try (Connection conn = DBConn.connection();
         PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
        preparedStatement.setInt(1, employee.getId());
        preparedStatement.executeUpdate();
    } catch (SQLException e) {
        LOGGER.log(Level.WARNING, e.getMessage(), e);
    }
}
}
