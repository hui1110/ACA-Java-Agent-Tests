package com.microsoft.azure.java.accelerator.log4j;

import org.apache.log4j.Logger;
import org.apache.log4j.LogManager;

public class ApplicationMain {
    static Logger log = LogManager.getLogger(ApplicationMain.class);

    public static void main(String[] args) {
        log.info("Hello, World!");
    }

}