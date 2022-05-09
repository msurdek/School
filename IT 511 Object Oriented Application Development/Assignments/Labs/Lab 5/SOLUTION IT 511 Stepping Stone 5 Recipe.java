/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SteppingStones;

import java.util.Scanner;
import java.util.ArrayList;

/**
 *
 * @author snhu.edu
 */

public class SteppingStone5_Recipe {

    private String recipeName;
    private int servings;
    private ArrayList<String> recipeIngredients;
    private double totalRecipeCalories;

    /**
     * @return the recipeName
     */
    public String getRecipeName() {
        return recipeName;
    }

    /**
     * @param recipeName the recipeName to set
     */
    public void setRecipeName(String recipeName) {
        this.recipeName = recipeName;
    }

    /**
     * @return the servings
     */
    public int getServings() {
        return servings;
    }

    /**
     * @param servings the servings to set
     */
    public void setServings(int servings) {
        this.servings = servings;
    }

    /**
     * @return the recipeIngredients
     */
    public ArrayList<String> getRecipeIngredients() {
        return recipeIngredients;
    }

    /**
     * @param recipeIngredients the recipeIngredients to set
     */
    public void setRecipeIngredients(ArrayList<String> recipeIngredients) {
        this.recipeIngredients = recipeIngredients;
    }

    /**
     * @return the totalRecipeCalories
     */
    public double getTotalRecipeCalories() {
        return totalRecipeCalories;
    }

    /**
     * @param totalRecipeCalories the totalRecipeCalories to set
     */
    public void setTotalRecipeCalories(double totalRecipeCalories) {
        this.totalRecipeCalories = totalRecipeCalories;
    }

    public SteppingStone5_Recipe() {
        this.recipeName = "";
        this.servings = 0;
        this.recipeIngredients = new ArrayList<>();
        this.totalRecipeCalories = 0;
    }

    public SteppingStone5_Recipe(String recipeName, int servings, ArrayList<String> recipeIngredients, double totalRecipeCalories) {
        this.recipeName = recipeName;
        this.servings = servings;
        this.recipeIngredients = recipeIngredients;
        this.totalRecipeCalories = totalRecipeCalories;
    }

    public void printRecipe() {
        double singleServingCalories = totalRecipeCalories / servings;
        System.out.println("Recipe: " + getRecipeName());
        System.out.println("Yield: " + getServings() + " servings");
        System.out.println("Ingredients:");
        /*
        for (Ingredient currentIngredient: recipeIngredients)
            System.out.println(currentIngredient.getIngredientName());
        */
         for (int i = 0; i < recipeIngredients.size(); i++) {
            Ingredient currentIngredient = recipeIngredients.get(i);
            String currentIngredientName = currentIngredient.getIngredientName();
            System.out.println(currentIngredientName);
        }
         
        System.out.println("Total Calories per serving: " + singleServingCalories);
    }

    public SteppingStone5_Recipe createNewRecipe() { //Comment out for Stepping Stone 6
	//public SteppingStone5_Recipe createNewRecipe() {  //uncomment for Stepping Stone 6
        double totalRecipeCalories = 0;
        ArrayList<String> recipeIngredients = new ArrayList();
        boolean addMoreIngredients = true;
        Scanner scnr = new Scanner(System.in);

        System.out.println("Please enter the recipe name: ");
        String recipeName = scnr.nextLine();

        System.out.println("How many servings: ");
        int servings = scnr.nextInt();

        do {
            System.out.println("Please enter the ingredient name or type 'e' if you are done: ");
            String ingredientName = scnr.next();
            if (ingredientName.toLowerCase().equals("e")) {
                addMoreIngredients = false;
            }
            
            else {
                Ingredient tempIngredient = new Ingredient().enterNewIngredient(ingredientName);
                recipeIngredients.add(tempIngredient);
            }
        } while (addMoreIngredients);
        
        for (int i = 0; i < recipeIngredients.size(); i++) {
            Ingredient currentIngredient = recipeIngredients.get(i);
            float ingredientAmount = currentIngredient.getIngredientAmount();
            int ingredientCalories = currentIngredient.getIngredientCalories();
            double ingredientTotalCalories = ingredientAmount * ingredientCalories;
            totalRecipeCalories += ingredientTotalCalories;
        }
        SteppingStone5_Recipe newRecipe = new SteppingStone5_Recipe(recipeName, servings, recipeIngredients, totalRecipeCalories);
        //newRecipe.printRecipe();//comment out for Stepping Stone 6 
        return newRecipe; //uncomment for Stepping Stone 6

    }

}
