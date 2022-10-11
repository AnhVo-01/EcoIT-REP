package com.example.backend.exceptionhandler;

public class CusNotFoundException extends RuntimeException{
    public CusNotFoundException(Long id) {
        super("Could not find the customer " + id);
    }
}
