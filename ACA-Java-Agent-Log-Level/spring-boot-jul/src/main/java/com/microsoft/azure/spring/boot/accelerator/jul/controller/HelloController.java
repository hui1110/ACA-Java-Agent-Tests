package com.microsoft.azure.spring.boot.accelerator.jul.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.logging.Logger;

@RestController
public class HelloController {

    private static final Logger logger = Logger.getLogger(HelloController.class.getName());

    @GetMapping("/hello")
    public String hello() {
        logger.fine("Hello world, spring-boot-jul!");
        return "Hello world";
    }
}
