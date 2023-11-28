package com.microsoft.azure.spring.accelerator.integration.test;

import org.junit.jupiter.api.Test;
import org.springframework.http.ResponseEntity;
import org.springframework.util.Assert;
import org.springframework.web.client.RestTemplate;

import java.util.Objects;

class HelloControllerTest {

    private static final String FQDN = "app-armacatest--revision.wittybay-e4a42466.eastus.azurecontainerapps.io";

    @Test
    void testCreatedContainerApp() {
        RestTemplate restTemplate = new RestTemplate();

        String premainUrl = String.format("https://%s/hello", FQDN);
        ResponseEntity<String> premainResponse = restTemplate.getForEntity(premainUrl, String.class);
        Assert.isTrue(Objects.equals(premainResponse.getBody(), "hello world"), "Response body is not expected");

        String attachUrl = String.format("https://%s/attach", FQDN);
        ResponseEntity<String> attachResponse = restTemplate.getForEntity(attachUrl, String.class);
        Assert.isTrue(Objects.equals(attachResponse.getBody(), "attach success"), "Response body is not expected");

    }

}
