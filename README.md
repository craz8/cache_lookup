# CacheLookup

Provide an alternative to **ActiveRecord#find** that uses the Rails cache to store retrieved items to reduce database load and increase
performance for subsequent lookups for the same item.  **CacheLookup** also provides cache expiry for items when they are updated
or deleted from teh database. 

## Installation

Add this line to your application's Gemfile:

    gem 'cache_lookup'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cache_lookup

## Quick Start

In your ActiveRecord model:

```ruby
class Article < ActiveRecord::Base

  cache_lookup :id
  cache_lookup :slug

end
```

In your controller:

```ruby
class ArticleController < ApplicationController
  
  def show
    @article = Article.lookup_by_id(params[:id])
  end
end
```

## Usage

#### cache_lookup(attribute)

Defines the attribute to use as the cache key, and for reading from the database.  The attribute must return a single item when queried, otherwise 
cache expiry will be broken.

Typically, the attribute will be 'id', but can be any attribute on the model.

```ruby
class Article < ActiveRecord::Base

  cache_lookup :id

end
```

#### Model#lookup_by_<attribute>

The method **lookup_by_<attribute>** will be added to your model.  In the above example, this will be **lookup_by_id**.  When used with the 'id' attribute,
this can be a direct replacement for Model.find(id).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits

[<img src="http://d1za39ny3bo0r4.cloudfront.net/assets/craz8-logo-8e807e1c44376d564da419a6d82ec5be.png">](http://craz8.com)

CacheLookup is maintained by CRAZ8
