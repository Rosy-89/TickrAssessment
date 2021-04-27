# TickrAssessment

- Use XCode 12.2 or above version. 
- Used Swift 5.x

# Steps to Run Code 

1. Open TickrAssessment.xcodeproj in Xcode 12.2 and above. 
2.  Select Target as TickrAssessment
3. Select Simulator ,  if simulator is now showig chagne Deployment Target from project setting. 
4. Click on run button. 


# approaches

- Using MVVM-C (Model View View Model Coordinator Architecture)
- UI is added in View Folder using Swift UI
- View Models are added in ViewModel Folder
- Networking realted code is added in Service Folder Using Combine library 
- Unit test cases for ViewModels and Network layer
- Used SPM for thier party integratoin. 


# List current limitations

-   Network availabilty check not implemented
-   Defualt image is not added. 
-   No UI testing. 
-  CI not configured. 


# State known issues with proposed solutions if you have time to improve in the future

- have integrated SwiftReachability to check netowork availabilty 
- Have used XCTest to write UI test
