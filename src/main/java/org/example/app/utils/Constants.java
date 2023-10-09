package org.example.app.utils;

import org.example.app.credentials.Credentials;

public class Constants {

    public final static String DB_DRIVER = "com.mysql.cj.jdbc.Driver";
    public final static String DB_URL = "jdbc:mysql://localhost:3306/";
    public final static String DB_NAME = "demo_db";
    public final static String DB_USER = "dev";
    public final static String DB_PASS = Credentials.DB_PASS;
    public final static String PHONE_RGX = "\\+\\d{2}\\(\\d{3}\\)\\d{3}\\d{2}\\d{2}";
}
