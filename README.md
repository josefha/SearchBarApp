# SearchBarApp
Simple IOS app that implements a search bar and filters table view cells 

The app consists of a table view controller and a search bar. The table view is populated with data from runeberg.org. For Xcode to be able to download text files from unknown urls an exception for the domain needs to be added to the info.plist (look for App Transport Security settings). The table view is updated every time a change happens in the search bar. When a change happens the full list with data is filtered and only cells that contain the string in the search bar is shown.  This is done with a simple filter function on an array with all values from the data source. 
