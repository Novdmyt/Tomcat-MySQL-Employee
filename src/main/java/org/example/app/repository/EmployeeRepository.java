package org.example.app.repository;

import org.example.app.database.DBConn;
import org.example.app.entity.Employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
}
