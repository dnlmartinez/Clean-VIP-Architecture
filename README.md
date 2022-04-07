# Clean VIP Architecture


VIP is an architectural pattern like MVC, MVP or MVVM. Its main difference is the clear logic separation between its components. 

VIP was created to fix MVC, or Massive View Controllers, a common problem in UIKit apps where View Controllers become the main object where code is kept and they become Massive in that most if not all of your logic is kept within them. This can also cause problems when testing your code.

One problem was that the Presenter (P) component may become too large — as it’s responsible for handling UI actions and preparing data for the view. To facilitate the single responsibility principle the relationship between objects was altered. While the VIPER’s V part means both ViewController and a UIView, the VIP’s “V” means simply ViewController. Therefore, the UIView is a separate component now, which makes view controllers a little bit thinner.


## Module


Each module or scene usually involves the following components with their corresponding responsibilities:


```
View: Anything that is a UIView subclass. It should be reusable and as passive as possible.

ViewController: An object that is created to manage the behavior of a specific view. May act as a data source or event handler. Calls necessary Interactor’s methods in response to view events and receives raw view-representable data from the Presenter.

Interactor: Performs business logic in the app, but is not aware of lower-level implementations, such as network clients or databases. For this, we have dependencies on services that do know about them and use them directly. When a service’s task is performed, the Interactor obtains the result and sends it to the Presenter.

Presenter: Receives a task’s result from the interactor and transforms it into a view-suitable format. For example, it may transform an array of complicated Core Data objects into a simple array of Strings

Router: Responsible for performing navigation inside the app. Typically has a dependency on a UINavigationController that’s provided by a Configurator .

Configurator: An object that creates a module by linking all the previous components.

Entity: A plain object, such as a Core Data entity or a Codable model.
Take a look at this diagram (an object that’s being pointed to is owned by the pointing object):
```


![](/rsc/image01.png)


## Relationship


ViewController has a strong reference to the View, Interactor, Router. It conforms to a protocol that a Presenter uses to send data that a View needs.

Interactor has a strong reference to a Presenter. It conforms to a protocol that a View Controller uses to send events (e.g when the viewDidLoad() method is run).

Presenter has a weak reference to the View Controller. It conforms to a protocol that an Interactor uses to send a business logic task’s result.

Router has methods that View Controller run to navigate to another module. Usually, they involve the following pattern: Create another module by using that module’s static configureModule() method and call pushViewController method of the UINavigationController.


## Sample App


For this example we will use data taken from the Marvel Comics API:


The Marvel Comics API is a tool to help developers everywhere create amazing, uncanny and incredible web sites and applications using data from the 70-plus years of the Marvel age of comics.


The Marvel Comics API is a RESTful service which provides methods for accessing specific resources at canonical URLs and for searching and filtering sets of resources by various criteria. All representations are encoded as JSON objects.


We will have a simple GET query to the following endpoint "/v1/public/characters", we will show a list of characters and clicking on an item will present the detail view.



## Unit Testing & Snapshot Testing


Unit testing and snapshot testing were implemented to show the ease of use of the chosen architecture


## Requirements

- iOS 13+ 
- Xcode 13.3

#### CocoaPods (iOS 13+)

You can use [CocoaPods](http://cocoapods.org/) to install dependencies.

and Run from Terminal in the root folder: 

```
pod install
```

