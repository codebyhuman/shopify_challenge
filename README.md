# README

This server side web api project is for the Shopify Summer 2019 Developer Intern Challenge.
It is the barebones of an online marketplace, built with ruby, rails, and graphql.

It includes the basic functionalities
  * fetch products one at a time
  * fetch products all at once (with argument to only return products with available inventory)
  * purchase products which reduces the inventory by 1
  
As well as additional functionalities
  * Have a cart system with total price of cart
  * Create a shopping cart (with or without initial items)
  * Add items to shopping cart
  * Check out a shopping cart (reduces inventory and clears cart)

Example Queries
```
query {
  #to get all products in the marketplace
  fetchAllProducts {
    title
    inventory_count
    price
  }
  
  #to get all products in the marketplace with available inventory
  fetchAllProducts(available:true) {
    title
    inventory_count
    price
  }
  
   #to fetch one product with the name "ice cream"
  fetchOneProduct(title:"ice cream") {
    title
    inventory_count
    price
  }
  
  #to fetch all orders (products with multiple quantities)
  fetchAllOrders {
      price
      quantity
      product {
        title
        inventory_count
        price
      }
  }
  
  #to fetch all carts
  fetchAllCarts {
    id
    total_cost
    orders {
      price
      #also has the other orders fields but let's just leave it here :)
    }
  }
}
```

Example Mutations
```
mutation {
  #purchase one ice cream
  purchaseProduct(product: "ice cream") {
    title
    inventory_count
  }
  
  #create an empty cart
  createCart() {
    id
    total_cost
  }
  
  #create a cart with 5 ice creams
  createCart(items: ["ice cream:5"]) {
    id
    total_cost
  }
  
  #note for the following mutations you need cart_id, which can be
  #queried for with fetchAllCarts
  
  #add additional items to cart #1
  addToCart(cart_id: 1, items: ["potato:2"]) {
    id
    total_cost
  }
  
  #"checks out" cart #1 by reducing inventory & clearing the cart
  checkOut(cart_id: 1) {
    id
    total_cost
  }
}
```

Versioning
* Handled by Docker
* Ruby v2.6
* Rails v5.1.4

How to run the test suite

* Run `rails test` to run custom unit tests
* Unit tests are located in /tests/models
* Tests include checking for correct query and mutation logic

Deployment instructions
* The deployment for this app is handled by a Docker image, see Dockerfile for more details
* To run locally, clone the repo and build and run docker image
* `sudo docker build -t app .` and `sudo docker run -it -p 80:80 app`
* Check your local host ip address under port 80 to see the server running
* I have also set up a public IP address on Google Cloud
* View the GraphIQL site at [35.196.89.53/graphiql](35.196.89.53/graphiql)
* You can also post normally to 34.73.184.101/graphql 

