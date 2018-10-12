# API Demo in RxSwift

A simple demo app which uses RxSwift to connect to a REST API service. The app displays a list of users in a table view, and on select of a row will show the fictional posts for that user.

## Setup

1. Xcode 10

2. Cocoapods

   a. Via included Ruby Gemfile using Bundler

   ```bash
   bundle install
   bundle exec pod install
   ```

   b.

   ```
   gem install cocoapods
   pod install
   ```

## Running

Simply **⌘R** in Xcode to run the application.

## Testing

Tests can be run with **⌘U**

## Future Improvements

Some of the following topics could be explored to improve the app which are beyond scope for now:

1. Better error handling, provide better feedback to the user when an error occurs and allow them to retry
2. Cache data offline so the app could function without a network connection
3. Use background refresh to keep data up-to-date when the user chooses to launch
4. Enhanced UI design
5. Abstract and decouple data passing between view controllers

