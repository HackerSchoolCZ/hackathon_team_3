*** Settings ***
Library    template_matching.py
Library    SeleniumLibrary        
Test Setup    Open Browser And Maximize
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
CompareImage
    Match Template
      
 
*** Keywords ***
Open Browser And Maximize
    Open Browser    https://alza.cz    chrome
    Maximize Browser Window  
Capture Screenshot And Close Browser   
    Capture Page Screenshot    
    Close Browser

*** Variables ***
