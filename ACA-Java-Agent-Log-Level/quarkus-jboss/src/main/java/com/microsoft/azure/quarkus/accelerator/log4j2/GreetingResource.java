package com.microsoft.azure.quarkus.accelerator.log4j2;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import org.jboss.logmanager.Level;
import org.jboss.logmanager.Logger;

@Path("/hello")
public class GreetingResource {

    private static final Logger logger = Logger.getLogger(GreetingResource.class.getName());

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        logger.log(Level.DEBUG, "Hello world!");
        return "Hello, quarkus-jboss!";
    }

}
