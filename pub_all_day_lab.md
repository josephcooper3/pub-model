# Pair Programming Lab - Pub!

Work on one laptop and Git commit regularly!

Remember to use TDD.

In pairs, plan and create an object oriented model of a Pub, with Drinks and Customers!

MVP:
  - A `Pub` should have a `name`, a `till`, and a collection of `drinks`
  - A `Drink` should have a `name`, and a `price`
  - A `Customer` should have a `name`, and a `wallet`
  - A `Customer` should be able to buy a `Drink` from the `Pub`, reducing the money in its `wallet` and increasing the money in the `Pub`'s `till`

Extensions:
  - Add an `age` to the `Customer`. Make sure the `Pub` checks the `age` before serving the `Customer`.
  - Add `alcohol_level` to the Drink, and a `drunkenness` level to the `Customer`. Every time a `Customer` buys a drink, the `drunkenness` level should go up by the `alcohol_level`.
  - `Pub` should refuse service above a certain level of `drunkenness`!

Advanced extensions:
  - Create a `Food` class, that has a `name`, `price` and `rejuvenation_level`. Each time a `Customer` buys `Food`, their `drunkenness` should go down by the `rejuvenation_level`
  - Pub can have a `stock` (maybe a Hash?) to keep track the amount of `drinks` available (Hard! Might need to change the drinks array to a drinks hash)
  - Pub can have a `stock_value` method to check the total value of its `drinks`
