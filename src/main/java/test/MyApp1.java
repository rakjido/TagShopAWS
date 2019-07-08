package test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MyApp1 {
  final static Logger logger = LoggerFactory.getLogger(MyApp1.class);

  public static void main(String[] args) {
    logger.info("Entering application.");
    System.out.println("Hahaha");
    logger.info("Exiting application.");
  }
}