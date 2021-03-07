# Golden Scent
The Golden Scent task completed with MVVM  and Coordinator pattern with showing list of Products.

# Content

 * Overview
 * How To Run
 * Unit Testing 
 * App Features

 # Overview
 
 * **Controller**: Contains **ProductsListViewController** . This controller fectch the data from the ProductsListViewModel. 
 
 * **ProductsListViewModel**: Contain **ProductsRepository** .This module responsible to get the data from the repo and send it to the viewcontroller and then viewController will send data to respective views
 
 * **Models**: Contains   **ViewModels**

 * **Coordinator**: Contains **Coordinator** and **MainCoordinator** . The responsiblity of coordinators is to handle the navigation of the app and setup the start of the app.
 
 * **Repository**: Contains **ProductsRepository** .This repo will contact with Json file to fetch the Products and will send back to respective ViewModel
 

# How To run

To run the project use the 12.2 xcode

# Unit Testing 
Added Unit testing class for ProductsRepository


# App Features
* MVVM with Coordinator pattern
* AutoLayout
