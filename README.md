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
* Ruby version 2.3.3p222

* Rails version 5.1.6.1

How to run the test suite TODO

Deployment instructions TODO
