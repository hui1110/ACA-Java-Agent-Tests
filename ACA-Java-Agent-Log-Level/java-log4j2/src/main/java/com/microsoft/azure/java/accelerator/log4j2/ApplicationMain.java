package com.microsoft.azure.java.accelerator.log4j2;

import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

public class ApplicationMain {
    static Logger log = LogManager.getLogger(ApplicationMain.class);

    public static void main(String[] args) {
        log.info("Hello, World!");
    }

}