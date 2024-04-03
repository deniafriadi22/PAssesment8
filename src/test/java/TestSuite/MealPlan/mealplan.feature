Feature: Test meal plan

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

  Scenario: test generate meal plan
    Given path '/mealplanner/generate'
    And param apiKey = apiKey
    When method get
    * print response
    Then status 200

  Scenario: test add to meal plan
    * def body =
    """
  {
    "date": 1589500800,
    "slot": 1,
    "position": 0,
    "type": "INGREDIENTS",
    "value": {
        "ingredients": [
            {
                "name": "1 banana"
            }
        ]
    }
}
    """
    Given path 'mealplanner', username, 'items'
    And param apiKey = apiKey
    And request header
    And param hash = hash
    And request body
    When method post
    * print response
    Then status 200