package com.microsoft.azure.spring.accelerator.jul.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.logging.Logger;

@Controller
public class HelloController {

    private static final Logger logger = Logger.getLogger(HelloController.class.getName());

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String printHello(ModelMap model) {
        model.addAttribute("message", "Hello world!");
        logger.fine("Hello world");
        return "hello";
    }

}
