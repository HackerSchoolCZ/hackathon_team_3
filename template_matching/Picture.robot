*** Settings ***
Library    api.py                           
Library    SeleniumLibrary        
Test Setup    Open Browser And Maximize
Test Teardown    Capture Screenshot And Close Browser

*** Test Cases ***
CompareImage
    Set Screenshot Directory    \Screenshot\
     #Capture Page Screenshot    Screenshot-Alza-{index}.png  
     Capture Page Screenshot    Screenshot-Alza.png  
   # Matc
  #  Match Template    ${GoodPicture}    ...\Screenshot-Alza.png 
      
 
*** Keywords ***
Open Browser And Maximize
    Open Browser    ${WebPageURL}    ${Browser}
    Maximize Browser Window  
Capture Screenshot And Close Browser   
    #Capture Page Screenshot    
    Close Browser

*** Variables ***
#${GoodPicture}   
#${BadPicture}  
${WebPageURL}    https://alza.cz
${Browser}    Chrome  