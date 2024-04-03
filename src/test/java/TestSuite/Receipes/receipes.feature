Feature: Test receipes

  Background:
    * url 'https://api.spoonacular.com'
    * def apiKey = '5cedc908127f4403a9592025d76f2375'
    * def username = 'deni15'
    * def hash = 'a6e8f7d1ec2b33c46b959578ebf0e5ed44aef21a'
    * def header =
    """
    {
    "Content-Type": "application/json"
    }
    """

  Scenario: Search Recipes
    Given path 'recipes/complexSearch'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Search Recipes by Nutrients
    Given path '/recipes/findByNutrients'
    And param minCarbs = 10
    And param maxCarbs = 50
    And param number = 2
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Search Recipes by Ingredients
    Given path '/recipes/findByIngredients'
    And param ingredients = 'apple', 'flour', 'sugar'
    And param number = 2
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Get Recipe Information
    Given path '/recipes/716429/information'
    And param includeNutrition = false
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Get Recipe Information Bulk
    Given path '/recipes/informationBulk'
    And param ids = 715538,716429
    And param includeNutrition = false
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Get Similar Recipes
    Given path '/recipes/715538/similar'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Get Random Recipes
    Given path '/recipes/random'
    And param number = 1
    And param include-tags = 'vegetarian, dessert'
    And param exclude-tags = 'dairyFree'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Autocomplete Recipe Search
    Given path '/recipes/autocomplete'
    And param number = 10
    And param query = 'chick'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Taste by ID
    Given path '/recipes/69095/tasteWidget.json'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Equipment by ID
    Given path '/recipes/1003464/equipmentWidget.json'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Price Breakdown by ID
    Given path '/recipes/1003464/priceBreakdownWidget.json'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Ingredients by ID
    Given path '/recipes/1003464/ingredientWidget.json'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Nutrition by ID
    Given path 'recipes/1003464/nutritionWidget.json'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Get Analyzed Recipe Instructions
    Given path '/recipes/404784/analyzedInstructions'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Extract Recipe from Website
    Given path '/recipes/extract'
    And param apiKey = apiKey
    And param url = 'https://foodista.com/recipe/ZHK4KPB6/chocolate-crinkle-cookies'
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Analyze Recipe
    * def body =
    """
    {
    "title": "Spaghetti Carbonara",
    "servings": 2,
    "ingredients": [
        "1 lb spaghetti",
        "3.5 oz pancetta",
        "2 Tbsps olive oil",
        "1  egg",
        "0.5 cup parmesan cheese"
    ],
    "instructions": "Bring a large pot of water to a boil and season generously with salt. Add the pasta to the water once boiling and cook until al dente. Reserve 2 cups of cooking water and drain the pasta. "
}
    """
    Given path '/recipes/analyze'
    And param apiKey = apiKey
    And param language = 'en'
    And param includeNutrition = false
    And param includeTaste = false
    And request header
    And request body
    When method post
    * print response
    Then status 200

  Scenario: Summarize Recipe
    Given path '/recipes/4632/summary'
    And param apiKey = apiKey
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Analyze Recipe Instructions
    * def body =
    """
    {
    "parsedInstructions": [
        {
            "name": "",
            "steps": [
                {
                    "number": 1,
                    "step": "Put the garlic in a pan and then add the onion.",
                    "ingredients": [
                        {
                            "id": 11215,
                            "name": "garlic",
                            "localizedName": "garlic",
                            "image": "garlic.png"
                        },
                        {
                            "id": 11282,
                            "name": "onion",
                            "localizedName": "onion",
                            "image": "brown-onion.png"
                        }
                    ],
                    "equipment": [
                        {
                            "id": 404645,
                            "name": "frying pan",
                            "localizedName": "frying pan",
                            "image": "pan.png"
                        }
                    ]
                },
                {
                    "number": 2,
                    "step": "Add some salt and oregano.",
                    "ingredients": [
                        {
                            "id": 2027,
                            "name": "oregano",
                            "localizedName": "oregano",
                            "image": "oregano.jpg"
                        },
                        {
                            "id": 2047,
                            "name": "salt",
                            "localizedName": "salt",
                            "image": "salt.jpg"
                        }
                    ],
                    "equipment": []
                }
            ]
        }
    ],
    "ingredients": [
        {
            "id": 2027,
            "name": "oregano"
        },
        {
            "id": 11215,
            "name": "garlic"
        },
        {
            "id": 11282,
            "name": "onion"
        },
        {
            "id": 2047,
            "name": "salt"
        }
    ],
    "equipment": [
        {
            "id": 404645,
            "name": "frying pan"
        }
    ]
}
    """
    Given path '/recipes/analyzeI!nstructions'
    And param apiKey = apiKey
    And param instructions = 'Put the garlic in a pan and then add the onion. Add some salt and oregano.'
    And request header
    And request body
    When method post
    * print response
    Then status 200

  Scenario: Classify Cuisine
    * def body =
    """
    {
    "cuisine": "Mediterranean",
    "cuisines": [
        "Mediterranean",
        "European",
        "Italian"
    ],
    "confidence": 0.0
    }
    """
    Given path '/recipes/cuisine'
    And param apiKey = apiKey
    And request header
    And request body
    When method post
    * print response
    Then status 200

  Scenario: Analyze a Recipe Search Query
    Given path '/recipes/queries/analyze'
    And param apiKey = apiKey
    And param q = 'salmon with fusilli and no nuts'
    And request header
    When method get
    * print response
    Then status 200

  Scenario: Guess Nutrition by Dish Name
    Given path '/recipes/guessNutrition'
    And param apiKey = apiKey
    And param title = 'Spaghetti Aglio et Olio'
    And request header
    When method get
    * print response
    Then status 200
