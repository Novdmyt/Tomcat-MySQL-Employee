package org.example.app.utils;

import java.util.regex.Pattern;

public class ValidatorPhone {
    public static boolean isValidPhoneNumber(String phone) {
        String regex = Constants.PHONE_RGX;
        return Pattern.matches(regex, phone);
    }
}