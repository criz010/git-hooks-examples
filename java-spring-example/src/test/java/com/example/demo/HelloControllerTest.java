package com.example.demo;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * Test class for HelloController.
 */
@SpringBootTest
class HelloControllerTest {

  @Autowired
  private HelloController helloController;

  @Test
  void contextLoads() {
    assertNotNull(helloController);
  }

  @Test
  void testHello() {
    String result = helloController.hello();
    assertEquals("Hello from Git Hooks Demo!", result);
  }

  @Test
  void testStatus() {
    String result = helloController.status();
    assertEquals("Application is running", result);
  }
}
