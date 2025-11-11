*** Settings ***
Documentation     Test suite to verify navigation in the About section.
...               Test Case ID: TC00002
...               Objective: Login and navigate to each tab in the 'About' module.
...               Preconditions: A valid user name and password combination
...               Expected Result: Site login page should open, login to GoodX, navigate About tabs, About section closes.
Resource          ../common/super.resource

Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser

*** Test Cases ***
Verify Navigation In About Section
    [Documentation]    Verify user can login and navigate through all tabs in the About section.
    [Tags]    smoke    about    navigation
    Login With Valid Credentials
    Wait Until Dashboard Is Loaded
    Open About Section
    About Section Should Be Opened
    Navigate To About Tab    Medical Aid Contracts
    About Tab Should Be Opened    Medical Aid Contracts
    Navigate To About Tab    User Manual
    About Tab Should Be Opened    User Manual
    Navigate To About Tab    Changelog
    About Tab Should Be Opened    Changelog
    Navigate To About Tab    Services
    About Tab Should Be Opened    Services
    Close About Section
    About Section Should Be Closed
