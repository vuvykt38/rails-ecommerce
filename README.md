# Book Store

A mini e-commerce application built with Rails 6. This app is a demo app to help me test, debug and get started with FB Business Tools (App Events, Facebook Login, Messenger Platform, etc).

## Live Demo

https://boxing-whistler-23624.herokuapp.com

## Overview

The purpose of this project was to:

-   Become familiar with Ruby and the Rails framework.
-   Gain experience handling feature and bug-fix requests.
-   Use this e-commerce app to implement FB's solutions for Business. 


## Development

### USE  CASES
- The buyer can use **Book Store** to browse the products, select some to purchase, and supply the information needed to create an order.
- The seller uses **Book Store**  to maintain a list of products to sell.
### PAGE  FLOW
The sketch of the buyer flow is shown in the following figure:

![enter image description here](https://learning.oreilly.com/library/view/agile-web-development/9781680507522/images/buyer_flow.png)

The seller flow, shown in the next figure:

![enter image description here](https://learning.oreilly.com/library/view/agile-web-development/9781680507522/images/seller_flow.png)

### DATA
Based on the use cases and the flows, here is the data I have worked with:

![enter image description here](https://learning.oreilly.com/library/view/agile-web-development/9781680507522/images/initial_data.png)

### Features Implemented
-   User registration, login, logout (include Facebook login)
-   Create, edit, and manage products (Seller)
-   Proceed products to cart
-   Make orders
-   Edit , destroy orders (Seller)
-  Search Bars

### Page Included
-   Home
-   Login
-   Register
-   Add/Edit Product (Seller)
-   Product List
-   Single Product View
-   Checkout

## Facebook Integration
To understand tools, concepts and processes related to Facebook family of apps, I have integrated Facebook Business tools including: 

- Facebook Business SDK
- App Events
- Facebook Login
- Messenger Platform
- Facebook Pixel
- Social Integrations
- Commerce Platform (WIP)

### App Events
To capture the right set data points to unlock the full value of measure ad performance and build audiences for ad targeting. Here are the list key events for an e-commerce that I have implemented via Google Tag Manager. 

| # | Event                  | Event Property  | Description                       | Data Type |
|---|------------------------|-----------------|-----------------------------------|-----------|
| 1 | User LoggedIn          |                 | When a user logs in               |           |
|   |                        | platform        | Website/Apps                      | String    |
|   |                        | social_login    | Facebook/Google/Organic           | String    |
| 2 | Registration Initiated |                 | Whenever registration process starts|           |
|   |                        | platform        |                                   | String    |
|   |                        | date            |                                   | String    |
| 3 | Registration Completed |                 | When registration is completed.|           |
|   |                        | register_option |                                   | String    |
|   |                        | platform        |                                   | String    |
| 4 | Searched               |                 |          When a user performs a search                         |           |
|   |                        | keyword         | Capture search terms              | String    |
|   |                        | search_results  | Number of Search Results          | Integer   |
| 5 | Category Opened        |                 |   When a category open (e.g. Kids, Romance, etc)                                |           |
|   |                        | category_name   | Product Vertical  ex: Electronics | String    |
|   |                        | platform        |                                   | String    |
| 6 | Product Viewed         |                 |     Whenever user view any product of any category                              |           |
|   |                        | name            | Product Name                      | String    |
|   |                        | item_url        |                                   | String    |
|   |                        | category        | Product Vertical  ex: Electronics | String    |
|   |                        | item_image      |                                   | String    |
|   |                        | currency        |                                   | String    |
|   |                        | platform        |                                   | String    |
|   |                        | price           |                                   | Integer   |
| 7 | Added to Cart          |                 |  When a user adds an item to the cart                                 |           |
|   |                        | name            |                                   | String    |
|   |                        | currency        |                                   | String    |
|   |                        | price           | Product Vertical  Ex: Electronics | Integer   |
|   |                        | platform        |                                   | String    |
|  8 | Initiate Checkout      |                 | When a user initiates checkout    |           |
|   |                        | products        | List of cart items                | String    |
|   |                        | num_items       |                                   | Integer   |
|   |                        | currency        |                                   | String    |
|   |                        | total_amount    |                                   | Integer   |
|   |                        | platform        |                                   | String    |
| 9  | Purchase               |                 |   When a user actually place an order                                |           |
|   |                        | products        | List of items                     | String    |
|   |                        | currency        |                                   | String    |
|   |                        | num_items       |                                   | Integer   |
|   |                        | platform        |                                   | String    |
|   |                        | total_amount    |                                   | Integer   |

### Facebook Login
Facebook Login improves the app user experience by enabling customers to easily sign up for the app without creating a username/password, and it maximizes the number of people using the app.

Here’s authentication flows with Facebook that I have integrated:

When users want to register for our application, they will click the “Continue with Facebook”. When the button is clicked, our client application will request an access token from Facebook. Then, the user will be presented with a dialog to allow the application to access some of their Facebook data. If the user gives their permission, our client application will get the Facebook access token in response. At this moment we can access user data from the client application, but an account is not yet created at our backend. In order to create new user account, our client application sends a request to our backend with the Facebook access token. The backend needs to verify the Facebook access token, so it is sends a verification request directly to Facebook. If the Facebook token is valid, the Facebook server will send user data back to our application. Upon receiving this data, the backend server has verified that the user credentials are valid and will create a user profile in our application with data received from Facebook.

The process for user login is similar. During the login process, users do not need to allow the application to access its Facebook data and the backend will not use the Facebook data to create a new user, but will instead update the user profile data on our backend.

When the user clicks Logout button, the logout method will be executed. It deletes the token from the browser’s local storage. After that, the user is logged off.

![enter image description here](https://i.ibb.co/wYKbpwg/ezgif-com-gif-maker.gif)

#### Test Cases

- [x]  Someone new to your app logs in with Facebook
- [x] Someone logs in with Facebook after previously logging in via a non-Facebook flow with the same email address
- [x] Someone who has logged into your app with Facebook in the past logs back in
- [x] Someone cancels log in with Facebook and tries to log in again
- [ ] Someone changes the Facebook password after logging in with Facebook to your app
- [ ] Someone disabled Facebook platform via app settings and logs in to your app
- [x] Someone revisits your app when your app token has expired

### Messenger Platform
I have created a chatbot like FB Sample Messenger Experience (Original Coast Clothing). The chatbot is a delightful messaging experience that leverages both automation and live customer support

#### Platform features
This experience leverages the following platform features listed below.
- Send API
- Webhooks
- Quick Replies
- Templates
- Buttons
- Persona API
- Messenger Analytics
- Messenger Profile API (below features only applied for test users since the app needs to go through App Review)
		- Persistent Menu
		- Get Started Button
		- Welcome Page
		
![enter image description here](https://i.ibb.co/4SxxByL/Screen-Shot-2021-07-15-at-22-42-49.png)
	
#### Curation: Suggest a Book

![enter image description here](https://i.ibb.co/dgFLywf/ezgif-com-gif-maker-2.gif)

#### Care: Live Chat
![enter image description here](https://i.ibb.co/4J6MtTK/ezgif-com-gif-maker-4.gif)

#### CSAT

![enter image description here](https://i.ibb.co/LxX8Ysw/ezgif-com-gif-maker-5.gif)	

#### Fallback Message

![enter image description here](https://i.ibb.co/cwgkqmh/ezgif-com-gif-maker-6.gif)
