# Payleap

Ruby interface to the PayLeap payments API

## Installation

Add this line to your application's Gemfile:

    gem 'payleap'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install payleap

## Usage

First create a PayLeap client object
    payleap = Payleap::Client.new(:username => 'API Username', :transaction_key => 'Your Key')

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
