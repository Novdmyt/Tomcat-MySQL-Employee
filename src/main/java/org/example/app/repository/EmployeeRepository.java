package org.example.app.repository;

import org.example.app.database.DBConn;
import org.example.app.entity.Employee;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class EmployeeRepository {
    private static final Logger LOGGER = Logger.getLogger(EmployeeRepository.class.getName());

    public void createEmployee(Employee employee){
        String sql = "INSERT INTO books (name, position, phone) VALUES (?, ?, ?)";
        try(Connection connection = DBConn.connection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql)){
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getPosition());
            preparedStatement.setString(3,employee.getPhone());
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
            return list;
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
    preparedStatement.executeUpdate();
}catch (SQLException e){
    LOGGER.log(Level.WARNING, e.getMessage(), e);
}
return employee;
    }

}
