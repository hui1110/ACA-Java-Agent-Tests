package com.microsoft.azure.spring.boot.accelerator.log4j.controller;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    private static final Logger logger = Logger.getLogger(HelloController.class);

    @GetMapping("/hello")
    public String hello() {
        logger.debug("Hello world, spring-boot-log4j!");
        return "Hello world";
    }

}
