package com.junit;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class CalculatorTest {

    private Calculator calculator;

    @Before
    public void setUp() {
        System.out.println("Setting up Calculator...");
        calculator = new Calculator();
    }

    @Test
    public void testAddition() {

        int a = 10;
        int b = 20;

        int result = calculator.add(a, b);

        assertEquals(30, result);
    }

    @Test
    public void testSubtraction() {

        int a = 20;
        int b = 5;

        int result = calculator.subtract(a, b);

        assertEquals(15, result);
    }

    @After
    public void tearDown() {
        System.out.println("Cleaning up...");
        calculator = null;
    }
}