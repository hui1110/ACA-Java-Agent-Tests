package com.microsoft.azure.quarkus.accelerator.logback;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Path("/hello")
public class GreetingResource {
    private static final Logger logger = LoggerFactory.getLogger(GreetingResource.class);

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        logger.debug("quarkus-logback-sample");
        return "Hello, quarkus-logback!";
    }

}