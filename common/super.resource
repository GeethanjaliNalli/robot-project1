*** Settings ***
Library    CustomLibrary.py
Resource   ../keywords/common_keywords.resource
Resource   ../keywords/dashboard_page.resource
Resource   ../keywords/login_page.resource
Resource   ../objectrepository/dashboard_page.resource
Resource   ../objectrepository/login_page.resource

# Keyword file import for About Page
Resource   ../../keywords/about_page.resource
# Locator file import for About Page
Resource   ../../objectrepository/about_page.resource
