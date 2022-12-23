## api/v1/users/:user_id/carts/:cart_id/cart_items/add

  It allows a user to add any item from the menu to a cart. If the cart is not created, then this method also creates a new cart for the user and then adds the item to the cart and stores it in the cart items model.

  If the item is already added into the cart, then it will update the quantity and total_price of the cart item.

  If the item has variations, then the price of the variation becomes the base price of the cart item.

  If the item has addons, then the addon price is added to the base price of the cart item. Please keep in mind the min / max conditions for addons.

  If the item has both variations and addons, then the variation price + addon price becomes the base price of the item.

  If the user selects different  combinations of variations and addons, then a new cart item is created.

## api/v1/users/:user_id/carts/:cart_id/cart_items/:id/remove

  It allows the user to remove a specific cart item.

  If there are multiple quantities of the same item, then only the quantity reduces and the pieces are updated.

  If there are multiple items with variations and addons, then the correct item should be removed

## api/v1/users/:user_id/carts/:cart_id/cart_items/:id

  It returns with the final details of the cart of a user with the final amount that he needs to pay and all the items that are added to the cart.

