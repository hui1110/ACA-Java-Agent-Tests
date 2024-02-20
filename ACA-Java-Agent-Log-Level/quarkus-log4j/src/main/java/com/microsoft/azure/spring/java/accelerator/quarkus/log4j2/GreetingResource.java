package com.microsoft.azure.spring.java.accelerator.quarkus.log4j2;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import org.jboss.logging.Logger;


@Path("/hello")
public class GreetingResource {

    private static final Logger logger = Logger.getLogger(GreetingResource.class);

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        logger.debug("Hello world!");
        return "hello";
    }

}