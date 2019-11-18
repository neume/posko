# Query Object
This object acts as an intermediary to Activerecord through hash options.
It includes pagination and other filter options.
It also accepts secure params directly from controllers.
This object is ideal for APIs that renders collections.

## When to use
If you have to let the user decide the data to be returned. Example:
- Displaying list of active users after an specified `id`
- Displaying `products` by page
- Displaying records according to inputted filters

## How to Use
Implementation of this object might change in the future.
For more information check [Queryko](https://github.com/neume/queryko) gem.

Procedure:

- Create a class with `Queryko::Base` as base class.
``` ruby
  class ProductsQuery < Queryko::Base
  end
```
- Add query filters.
  - `feature :attribute` filters query with `:min` and `:max`
  - `feature :attribute, :search, as: :attribute` filters query by `:attribute` if the attribute is supplied
```ruby
  class ProductsQuery < Queryko::Base
    feature :created_at, :min
    feature :created_at, :max
    feature :price, :min
    feature :price, :max

    feature :name, :search, as: :name
    feature :vendor, :search, as: :vendor
    ...
  end
```
- Instantiate and execute `call` method.
```ruby
products = ProductsQuery.new(price_min: 100, price_max: 150, name: 'Milk').call
```
