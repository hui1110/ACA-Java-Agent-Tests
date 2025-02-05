package com.microsoft.azure.spring.boot.accelerator.log4j2.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    private static final Logger logger = LogManager.getLogger(HelloController.class);

    @GetMapping("/hello")
    public String hello() {
        logger.debug("spring-boot-log4j2-sample");
        return "Hello, spring-boot-log4j2!";
    }

}
