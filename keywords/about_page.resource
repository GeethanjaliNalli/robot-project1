*** Settings ***
Documentation    This About Page Resource file contains all keywords required for About section navigation, tab validation, and closing actions using PlaywrightLibrary.
Resource    ../common/super.resource
Resource    ../objectrepository/about_page.resource

*** Keywords ***
Navigate To About Section From Dashboard
    [Documentation]    High-level keyword to navigate to the About section from the dashboard.
    Click About Link On Dashboard
    Wait Until About Section Is Visible

Navigate Through All About Tabs
    [Documentation]    High-level keyword to iterate through all About section tabs and validate navigation.
    Select And Validate About Tab    ${tab.app_info}
    Select And Validate About Tab    ${tab.medical_aid_contracts}
    Select And Validate About Tab    ${tab.user_manual}
    Select And Validate About Tab    ${tab.changelog}
    Select And Validate About Tab    ${tab.services}

Close About Section Window
    [Documentation]    High-level keyword to close the About section window.
    Click About Close Button
    Wait Until About Section Is Closed

Select And Validate About Tab
    [Arguments]    ${tab_locator}
    [Documentation]    Mid-level keyword to select a tab in the About section and validate that its content is displayed.
    Click About Tab    ${tab_locator}
    Wait Until About Tab Content Is Visible    ${tab_locator}

Click About Link On Dashboard
    [Documentation]    Clicks the About link from the dashboard to open the About section.
    Wait Until Element Is Visible    ${link.about}    ${LONG_WAIT}
    Click    ${link.about}

Wait Until About Section Is Visible
    [Documentation]    Waits until the About section main content is visible.
    Wait Until Element Is Visible    ${tab.app_info}    ${LONG_WAIT}

Click About Tab
    [Arguments]    ${tab_locator}
    [Documentation]    Clicks on a specific tab in the About section.
    Wait Until Element Is Visible    ${tab_locator}    ${LONG_WAIT}
    Click    ${tab_locator}

Wait Until About Tab Content Is Visible
    [Arguments]    ${tab_locator}
    [Documentation]    Waits until the content for the selected About tab is visible.
    ${tab_content_locator}=    Get About Tab Content Locator    ${tab_locator}
    Wait Until Element Is Visible    ${tab_content_locator}    ${LONG_WAIT}

Get About Tab Content Locator
    [Arguments]    ${tab_locator}
    [Documentation]    Returns the content locator for a given About tab.
    # This mapping may need to be updated if the content locators differ from tab locators.
    [Return]    ${tab_locator}

Click About Close Button
    [Documentation]    Clicks the close button to close the About section window.
    Wait Until Element Is Visible    ${button.close}    ${LONG_WAIT}
    Click    ${button.close}

Wait Until About Section Is Closed
    [Documentation]    Waits until the About section is closed (not visible).
    Wait Until Element Is Not Visible    ${button.close}    ${LONG_WAIT}

Validate About Section Is Closed
    [Documentation]    Validates that the About section is no longer visible after closing.
    Run Keyword And Return Status    Wait Until About Section Is Closed
    Should Be True    ${OUTPUT}
