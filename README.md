# Jungle

A mini e-commerce application built with Rails 4.2 for practice of Ruby, the Rails framwork and tests such as rspec, Capybara, and Poltergeist. 

Jungle app with following behaviours:
  - User can sign up new accout/sign in from any page
  - User can add items on the cart and order pages contain information about the items, and final amount of order
  - If the cart is empty, display a friendly message about cart emptiness and link to the home page
  - Sold out Badge is displayed when quantity of itme becomes zero. 
  - Admin user authentication and Admin user can create category and products. 

## Final Product
!["Screenshot of Main Page"](https://github.com/9boogie/jungle-rails/blob/master/docs/Main%20Page.png)
!["Screenshot of Order Page"](https://github.com/9boogie/jungle-rails/blob/master/docs/Order%20Page.png)
!["Screenshot of Admin Page"](https://github.com/9boogie/jungle-rails/blob/master/docs/Admin%20Page.png)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
