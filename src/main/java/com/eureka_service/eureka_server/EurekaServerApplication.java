package com.eureka_service.eureka_server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class EurekaServerApplication {

	public static void main(String[] args) {
		System.out.println("starting ureka server");
		SpringApplication.run(EurekaServerApplication.class, args);
		System.out.println("ureka started");
	}

}
