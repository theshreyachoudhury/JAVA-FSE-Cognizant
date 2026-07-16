package com.builder;

public class TestBuilder {

    public static void main(String[] args) {

        Computer gamingPC = new Computer.Builder()
                .setCPU("Intel Core i7")
                .setRAM("16 GB")
                .setStorage("1 TB SSD")
                .build();

        gamingPC.display();

        System.out.println();

        Computer officePC = new Computer.Builder()
                .setCPU("Intel Core i5")
                .setRAM("8 GB")
                .setStorage("512 GB SSD")
                .build();

        officePC.display();
    }
}