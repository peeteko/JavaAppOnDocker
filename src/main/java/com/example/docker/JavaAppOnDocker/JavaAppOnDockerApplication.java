package com.example.docker.JavaAppOnDocker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@SpringBootApplication
@EnableScheduling
public class JavaAppOnDockerApplication {

	public static void main(String[] args) {
		SpringApplication.run(JavaAppOnDockerApplication.class, args);
	}


	@Scheduled(fixedDelay = 1000)
	public void run() {
		System.out.println("Running");
	}
}
