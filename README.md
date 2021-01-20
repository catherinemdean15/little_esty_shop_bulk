# Little Esty Shop - Bulk Discounts
This project is an extension of the Little Esty Shop group project from Turing Backend Mod 2. Students will add functionality for merchants to create bulk discounts for their items. A “bulk discount” is a discount based on the quantity of items the customer is buying, for example “20% off orders of 10 or more items”.

# Learning Goals
Write migrations to create tables and relationships between tables
Implement CRUD functionality for a resource using forms (form_tag or form_with), buttons, and links
Use MVC to organize code effectively, limiting the amount of logic included in views and controllers
Use built-in ActiveRecord methods to join multiple tables of data, make calculations, and group data based on one or more attributes
Write model tests that fully cover the data logic of the application
Write feature tests that fully cover the functionality of the application

# Requirements
Rails 5.2.x
PostgreSQL
ActiveRecord
Import data from CSV files
All code must be tested via feature tests and model tests, respectively progress on user stories
Deploy completed code to Heroku

# Database Schema
<img src="https://user-images.githubusercontent.com/69832134/105249742-d3d0c180-5b35-11eb-9151-d72c130586d0.png" alt="little-esty-shop">

## User Stories

``` 
1. Merchant Bulk Discounts Index

As a merchant
When I visit my merchant dashboard
Then I see a link to view all my discounts
When I click this link
Then I am taken to my bulk discounts index page
Where I see all of my bulk discounts including their
percentage discount and quantity thresholds
And each bulk discount listed includes a link to its show page
```

``` 
2. Merchant Bulk Discount Create

As a merchant
When I visit my bulk discounts index
Then I see a link to create a new discount
When I click this link
Then I am taken to a new page where I see a form to add a new bulk discount
When I fill in the form with valid data
Then I am redirected back to the bulk discount index
And I see my new bulk discount listed
```

```
3. Merchant Bulk Discount Delete

As a merchant
When I visit my bulk discounts index
Then next to each bulk discount I see a link to delete it
When I click this link
Then I am redirected back to the bulk discounts index page
And I no longer see the discount listed
```

```
4. Merchant Bulk Discount Show

As a merchant
When I visit my bulk discount show page
Then I see the bulk discounts quantity and price
```

```
5. Merchant Bulk Discount Edit

As a merchant
When I visit my bulk discount show page
Then I see a link to edit the bulk discount
When I click this link
Then I am taken to a new page with a form to edit the discount
And I see that the discounts current attributes are prepoluated in the form
When I change any/all of the information and click submit
Then I am redirected to the bulk discount's show page
And I see that the discount's attributes have been updated
```

```
6. Merchant Invoice Show Page: Total Revenue includes discounts

As a merchant
When I visit my merchant invoice show page
Then I see that the total revenue for my merchant includes bulk discounts in the calculation
```

```
7. Merchant Invoice Show Page: Link to applied discounts

As a merchant
When I visit my merchant invoice show page
Next to each invoice item I see a link to the show page for the bulk discount that was applied (if any)
```

```
8. Admin Invoice Show Page: Total Revenue includes discounts

As an admin
When I visit an admin invoice show page
Then I see that the total revenue includes bulk discounts in the calculation
```

## Extensions
  - When an invoice is pending, a merchant should not be able to delete or edit a bulk discount that applies to any of their items on that invoice.
  - When an Admin marks an invoice as “completed”, then the discount percentage should be stored on the invoice item record so that it can be referenced later
  - Merchants should not be able to create/edit bulk discounts if they already have a discount in the system that would prevent the new discount from being applied (see example 4)

# Potential Future Functionality
* Complete Extensions
* Add personal GitHub API

