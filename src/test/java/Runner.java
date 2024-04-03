package TestSuite;
import com.intuit.karate.junit5.Karate;

class Runner {
    @Karate.Test
    public Karate runMealPlan(){
        return Karate.run ("MealPlan/mealplan").relativeTo((getClass()));
    }

    @Karate.Test
    public Karate runReceipes(){
        return Karate.run ("Receipes/receipes").relativeTo((getClass()));
    }
}