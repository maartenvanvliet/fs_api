[![Gem Version](https://badge.fury.io/rb/fs_api.svg)](https://badge.fury.io/rb/fs_api) [![Build Status](https://travis-ci.org/maartenvanvliet/fs_api.svg)](https://travis-ci.org/maartenvanvliet/fs_api)[![Code Climate](https://codeclimate.com/github/maartenvanvliet/fs_api/badges/gpa.svg)](https://codeclimate.com/github/maartenvanvliet/fs_api)

# FsApi

Gem to interface with the [factuursturen.nl](https://www.factuursturen.nl/?a=1552)
invoicing API

Still some issues, upon api calls the server sends back json with stringified
floats/integers/booleans ("true", "1" etc.), for the booleans a conversion is
in place, for the others there isn't yet.

Use the docs at https://www.factuursturen.nl/docs/api_v1.pdf for more information
on the api. Note that there are inconsistencies between the docs and what the api actually does. E.g. required fields that are not required.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fs_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fs_api

## Usage

```ruby
api_client = FsApi::Client.new(username, api_key)

# Retrieve all products
api_client.products.all

# Retrieve all clients
api_client.clients.all

# Retrieve all invoices
api_client.invoices.all

# Find an invoice
api_client.invoices.find(invoice_number)

# Create an invoice
invoice = api_client.invoices.build({clientnr: '1'})
api_client.invoices.save(invoice)

# or shorthand
invoice = api_client.invoices.create({clientnr: '1'})

# Returns false when it fails
api_client.invoices.save(invoice)

# Has the errors of the last api operation
invoice.errors

# Delete an invoice
api_client.invoices.delete(invoice)

# Search in all fields of invoices
api_client.invoices.search('john')

# Search in city field of invoices
api_client.invoices.search(city: 'john')
```

## Todo
* Handle rate limiting
* Refactor base service so services can choose to implement parts
* ~~Implement saved invoices resource~~
* ~~Implement search~~
* ~~Implement invoice payment registration~~

## Contributing

1. Fork it ( https://github.com/maartenvanvliet/fs_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
