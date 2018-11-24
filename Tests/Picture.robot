*** Settings ***
Library    ../Libraries/apy.py
Library    SeleniumLibrary
Resources    ../Resources/pictures.py  
Test Setup    Open Browser And Maximize
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
CompareImage
    Match Template    ../Pictures/${tested_pictures}
      
 
*** Keywords ***
Open Browser And Maximize
    Open Browser    https://alza.cz    chrome
    Maximize Browser Window  
Capture Screenshot And Close Browser   
    Capture Page Screenshot    
    Close Browser

*** Variables ***
