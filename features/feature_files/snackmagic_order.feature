Feature: To order a swag on snackmagic

    Scenario:
        Given I am on snackmagic login page
        When I login to my account
        Then I am redirected to snackmagic homepage
        Given I am on snackmagic homepage
        When I click on start order
        Then I get redirected to snackmagic send treat page
        Given I am on snackmagic send treat page
        When I click start a new order
        Then create a new treat
        And start customizing the modals
        When I proceed to checkout
        And send email to the recipient
        Then order is placed successfully
