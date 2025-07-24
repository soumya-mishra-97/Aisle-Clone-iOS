# Aisle Clone – iOS App

A SwiftUI-based clone of the Aisle dating app built using Clean Architecture and Combine. 
It features a mobile number login, OTP verification, and a Notes dashboard showcasing user profiles.

## Description

- Screen 1: Enter +91 in the country code field and 9876543212 in the phone number field and click on the Continue button. While clicking on the Continue button make a Phone number API call, Once you get success response then take the user to Screen 2.

- Screen 2: Enter 1234 in the OTP field and click on the Continue button. While clicking on the Continue button, make an OTP API call, You will receive an auth token in the API success response then take the user to Screen 3.

- Screen 3: Add auth token in the header while making Notes API call.


---

## Features
- **Spalsh View** 
- **Phone Number View** 
- **OTP View** 
- **Notes View** 


- **Clean Architecture** (MVVM + UseCases + Combine)
- **Combine Reactive Networking** 
- **SwiftUI UI**

## Tech Stack

- SwiftUI
- Combine
- MVVM + Clean Architecture
- URLSession for API calls

## Requirements

- Xcode 15+
- iOS 17+
- Swift 5.9+

## Author

Soumya Ranjan Mishra

