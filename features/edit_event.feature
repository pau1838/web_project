Feature: Edit an event
  In order to change the parameters of the event
  As the owner of the establishement owner of the event
  I want to be able to edit the name, the band list, the state, the date, and the description.

  Background: There are registered users, an establishment created by one of them, and an event organized in that establishment
    Given There are establishments
      | user        | password | name     | address     | mail                 | mobile    |
      | Tremola     | patata   | Tremola  | C.Major n 9 | tremola@gmail.com    | 100000001 |
    And There are bands
      | user          | password | web_link                             | playlist                                    | mail                 | mobile    | name      |
      | Skeewiff      | patata   | https://soundcloud.com/skeewiff      |  https://soundcloud.com/dj-elye/sets/jazz   | skeewiff@gmail.com   | 100000001 | skeewiff  |
    And There are events
      |  name            |  band                 |  state  |  date  |  description  |  establishment  |
      |  Acampada Jove   |  skeewiff@gmail.com   |  SR     |  1     |  Large descr  |  Tremola        |

  Scenario: Edit owned event
    Given I'm registrated as user "Tremola" with password "patata"
    When I visit the event with name "Acampada Jove"
    And I edit the current event
      | state   |
      | CL      |
    Then I'm viewing the details page for event at establishment "Bar The Bar" by "user1"
      |  name            |  band                 |  state  | description  |
      |  Acampada Jove   |  skeewiff@gmail.com   |  CL     | Large descr  |
    And There are 1 events

  Scenario: Try to edit event but not logged in
    When I visit the event with name "Acampada Jove"
    Then There is no name "edit"

  Scenario: Try to edit event but I am not the owner
    Given I'm registrated as user "user2" with password "password"
    When I visit the event with name "Acampada Jove"
    Then There is no name "edit"
