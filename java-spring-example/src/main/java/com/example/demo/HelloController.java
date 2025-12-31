package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Simple REST controller for demonstration.
 */
@RestController
@RequestMapping("/api")
public class HelloController {

  /**
   * Returns a greeting message.
   *
   * @return greeting string
   */
  @GetMapping("/hello")
  public String hello() {
    return "Hello from Git Hooks Demo!";
  }

  /**
   * Returns application status.
   *
   * @return status string
   */
  @GetMapping("/status")
  public String status() {
    return "Application is running";
  }
}
