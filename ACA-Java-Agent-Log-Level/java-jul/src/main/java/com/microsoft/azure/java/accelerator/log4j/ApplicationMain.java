package com.microsoft.azure.java.accelerator.log4j;

import java.util.logging.Logger;

public class ApplicationMain {
    static Logger log = Logger.getLogger(ApplicationMain.class.getName());

    public static void main(String[] args) {
        log.info("Hello, World!");
    }

}