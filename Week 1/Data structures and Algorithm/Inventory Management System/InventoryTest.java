package com.inventory;

public class InventoryTest {

    public static void main(String[] args) {

        Inventory inventory = new Inventory();

        inventory.addProduct(new Product(101, "Laptop", 20, 65000));

        inventory.addProduct(new Product(102, "Mouse", 100, 700));

        inventory.addProduct(new Product(103, "Keyboard", 50, 1200));

        System.out.println("\nInventory:");

        inventory.displayProducts();

        inventory.updateProduct(102, 120, 750);

        inventory.deleteProduct(103);

        System.out.println("\nUpdated Inventory:");

        inventory.displayProducts();
    }
}