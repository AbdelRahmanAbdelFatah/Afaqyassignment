#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template
@makeanappointment
Feature: Login Feature
  
  As a user, I want to login to CURA Healthcare Service
  so that I can make an appointment.

  @Valid
  Scenario Outline: Login with a valid credential
    Given I navigate to Page_CURA Healthcare Service
    When I click a-login
    And I click login button
    And I enter username <username> and password <password>
    And I click Log in button
    Then I should be able to login successfully

    Examples: 
      | username | password           |
      | John Doe | ThisIsNotAPassword |

  @InValid
  Scenario Outline: Login with an invalid credential
    Given I navigate to Page_CURA Healthcare Service
    When I click a-login
    And I click login button
    And I enter an invalid username <username> and password <password>
    And I click Log in button
    Then I should NOT be able to login successfully

    Examples: 
      | username | password           |
      | Jane Doe | ThisIsNotAPassword |

  @InValid
  Scenario Outline: Login with an invalid credential
    Given I navigate to Page_CURA Healthcare Service
    When I click a-login
    And I click login button
    And I enter an valid username <username> and invalid password <password>
    And I click Log in button
    Then I should NOT be able to login successfully

    Examples: 
      | username | password |
      | John Doe | ThisIs   |

  @InValid
  Scenario Outline: Login with an invalid credential
    Given I navigate to Page_CURA Healthcare Service
    When I click a-login
    And I click login button
    And I enter an invalid username <username> and invalid password <password>
    And I click Log in button
    Then I should NOT be able to login successfully

    Examples: 
      | username | password  |
      | Jane Doe | ThisIsNot |

  @Valid
  Scenario Outline: make an appointment succesufly
    Given I navigate to make an appointment page
    When I select item from facility
    And I enter visit date <visit date>
    And I enter comment <comment>
    And I click make an appointment button
    Then I should be able to make an appointment successfully

    Examples: 
      | visit date | comment |
      | 14-4-2019  | comment |

  @inValid
  Scenario Outline: make an appointment withiout mandatory filed
    Given I navigate to make an appointment page
    When I select item from facility
    And I  don't enter visit date <visit date>
    And I enter comment <comment>
    And I click make an appointment button
    Then I should be able to make an appointment successfully

    Examples: 
      | visit date | comment |
      |            | comment |
