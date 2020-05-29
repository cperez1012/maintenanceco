Scope Method

Scopes are custom queries that you define inside your Rails models with the scope method.

Every scope takes two arguments:

1. A name, which you use to call this scope in your code
2. A lambda, which implements the query

class Fruit < ApplicationRecord
  scope :with_juice, -> { where("juice > 0") }
end

As a result of calling a scope, you’ll get an ActiveRecord::Relation object.

Which means you can chain & combine scopes!

Example:

Fruit.with_juice.with_round_shape.first(3)

If you want to use this query in other places and not duplicate code, use scope method in model file

Differences Between Scope and Class Methods

1. Scopes result in cleaner code because of their syntax
2. Scopes are used for exactly one thing, so you know what you get the moment you see one
3. Scopes aren’t mixed with other methods, so they’re easier to spot

***Scope guarantees an ActiveRecord::Relation, and class methods don’t. This helps you avoid errors when your scope returns nothing.

