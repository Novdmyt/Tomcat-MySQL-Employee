1) Створення бд
CREATE DATABASE demo_db;

2)  Створення таблиці
CREATE TABLE IF NOT EXISTS employees
( id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(128) NOT NULL,
  position VARCHAR(128) NOT NULL,
  phone VARCHAR(128) NOT NULL,
  PRIMARY KEY (id)
);

3) Створення нового employee у проекті
 String sql = "INSERT INTO employees (name, position, phone) VALUES (?, ?, ?)";

4) Читання всіх employees у проекті
String sql = "SELECT * FROM employees";

5) Читання employee по id у проекті
String sql = "SELECT * FROM employees WHERE id = ?";

6) Оновлення employee у проекті
 String sql = "UPDATE employees SET name = ?, position = ?, phone = ? WHERE id = ?";

7) Видалення employee у проекті
String sql = "DELETE FROM employees where id = ?";