package com.microsoft.azure.java.accelerator.logback;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ApplicationMain {
    static Logger log = LoggerFactory.getLogger(ApplicationMain.class);

    public static void main(String[] args) {
        log.info("Hello, World!");
    }

}