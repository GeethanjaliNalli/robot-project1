*** Settings ***
Documentation    This About page Resource file has all the About section navigation keywords
Resource    ../common/super.resource
Resource    ../objectrepository/about_page.resource

*** Keywords ***
Open About Section
    [Documentation]    Opens the About section from the dashboard using the About button.
    [Arguments]    ${about_button_locator}
    Wait Until Element Is Visible    ${about_button_locator}    ${LONG_WAIT}
    Click    ${about_button_locator}
    Wait Until About Section Is Visible

Navigate To About Tab
    [Documentation]    Navigates to a specific tab in the About section using the provided tab locator.
    [Arguments]    ${tab_locator}
    Wait Until Element Is Visible    ${tab_locator}    ${LONG_WAIT}
    Click    ${tab_locator}
    Wait Until About Tab Content Is Visible    ${tab_locator}

Close About Section
    [Documentation]    Closes the About section using the provided close button locator.
    [Arguments]    ${close_button_locator}
    Wait Until Element Is Visible    ${close_button_locator}    ${LONG_WAIT}
    Click    ${close_button_locator}
    Wait Until About Section Is Closed

Wait Until About Section Is Visible
    [Documentation]    Waits until the About section is visible after clicking the About button.
    Wait Until Element Is Visible    ${tab.medical_aid_contracts}    ${LONG_WAIT}

Wait Until About Tab Content Is Visible
    [Documentation]    Waits until the content of the selected About tab is visible.
    [Arguments]    ${tab_locator}
    Run Keyword If    '${tab_locator}' == '${tab.medical_aid_contracts}'    Wait Until Element Is Visible    ${tab.medical_aid_contracts}    ${LONG_WAIT}
    ...    ELSE IF    '${tab_locator}' == '${tab.user_manual}'    Wait Until Element Is Visible    ${tab.user_manual}    ${LONG_WAIT}
    ...    ELSE IF    '${tab_locator}' == '${tab.changelog}'    Wait Until Element Is Visible    ${tab.changelog}    ${LONG_WAIT}
    ...    ELSE IF    '${tab_locator}' == '${tab.services}'    Wait Until Element Is Visible    ${tab.services}    ${LONG_WAIT}

Wait Until About Section Is Closed
    [Documentation]    Waits until the About section is closed and not visible.
    Wait Until Element Is Not Visible    ${tab.medical_aid_contracts}    ${LONG_WAIT}
    Wait Until Element Is Not Visible    ${tab.user_manual}    ${LONG_WAIT}
    Wait Until Element Is Not Visible    ${tab.changelog}    ${LONG_WAIT}
    Wait Until Element Is Not Visible    ${tab.services}    ${LONG_WAIT}

Click
    [Documentation]    Clicks the specified element.
    [Arguments]    ${locator}
    Click    ${locator}

Wait Until Element Is Visible
    [Documentation]    Waits until the specified element is visible.
    [Arguments]    ${locator}    ${timeout}=${LONG_WAIT}
    Wait Until Element Is Visible    ${locator}    ${timeout}

Wait Until Element Is Not Visible
    [Documentation]    Waits until the specified element is not visible.
    [Arguments]    ${locator}    ${timeout}=${LONG_WAIT}
    Wait Until Element Is Not Visible    ${locator}    ${timeout}
