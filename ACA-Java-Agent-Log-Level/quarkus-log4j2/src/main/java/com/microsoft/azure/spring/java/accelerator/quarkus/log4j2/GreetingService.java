package com.microsoft.azure.spring.java.accelerator.quarkus.log4j2;

import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class GreetingService {

    public String greeting(String name) {
        return "hello " + name;
    }

}
