package SteppingStones;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 *package SteppingStones;

/**
 *
 * @author snhu.edu
 */

import java.util.Scanner;
import java.util.ArrayList;

public class SteppingStone4_Loops {
    
    public static void main(String[] args) {
       Scanner scnr = new Scanner(System.in);
       String recipeName = "";
       ArrayList <String> ingredientList = new ArrayList();
       String newIngredient = "";
       boolean addMoreIngredients = true;
       
       System.out.println("Please enter the recipe name: ");
       recipeName = scnr.nextLine();
               
       do {
           
           System.out.println("Would you like to enter an ingredient?: ");
           String reply = scnr.next().toLowerCase();
           if (reply.equals("y")) {
               System.out.println("What is the ingredient?");
               newIngredient = scnr.next();
               ingredientList.add(newIngredient);
               
           } else if (!reply.equals("n")) {
               System.out.println("Please enter y or n");
           } else {
               addMoreIngredients = false;
           }
        } while (addMoreIngredients) ;
       
       for (int i = 0; i < ingredientList.size(); i++ ) {
           System.out.println(ingredientList.get(i));
       }
    }
}
