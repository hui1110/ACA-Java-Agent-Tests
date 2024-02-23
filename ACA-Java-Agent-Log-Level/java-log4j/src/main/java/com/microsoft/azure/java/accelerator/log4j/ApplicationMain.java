package com.microsoft.azure.java.accelerator.log4j;

import org.apache.log4j.Logger;

public class ApplicationMain {
    static Logger log = Logger.getLogger(ApplicationMain.class);

    public static void main(String[] args) {
        log.info("Hello, World!");
    }

}