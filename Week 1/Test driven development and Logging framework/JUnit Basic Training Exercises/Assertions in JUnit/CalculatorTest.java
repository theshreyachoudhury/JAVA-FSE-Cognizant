package com.junit;

import static org.junit.Assert.*;

import org.junit.Test;

public class CalculatorTest {

    Calculator calculator = new Calculator();

    @Test
    public void testAdd() {
        assertEquals(30, calculator.add(10, 20));
    }

    @Test
    public void testSubtract() {
        assertEquals(5, calculator.subtract(10, 5));
    }

    @Test
    public void testPositive() {
        assertTrue(calculator.isPositive(10));
    }

    @Test
    public void testMessage() {
        assertNotNull(calculator.getMessage());
    }

}