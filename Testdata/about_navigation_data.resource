*** Variables ***

&{ABOUT_NAVIGATION_INFO}
...    input.username=AutomationUser
...    input.password=AutoPass123
...    select.module=ABOUT
...    select.tabs=Overview,Company Info,Team,Contact,Legal
...    expected.close_action=About section closed successfully

&{EXPECTED_DATA}
...    navigation_status=User should be able to navigate through all tabs in the About section and close it successfully.
...    navigation_tabs=Overview,Company Info,Team,Contact,Legal
...    close_status=Closed
