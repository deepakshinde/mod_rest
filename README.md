# ModRestApi for Ejabberd Xmpp server

Ruby interface to ejabberd's  https://github.com/processone/ejabberd-contrib/tree/master/mod_rest

This allows to:

  * Register a new user
  * Unregister a user
  * Check status
  * Change password
  * Check all online user 
  * Check all registered_users
  * Add subscribe friend
  * Get user's friends



## Installation
Note. First setup Ejabberd server with mod_rest module. 

Add this line to your application's Gemfile:

```ruby
gem 'mod_rest'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mod_rest

## Usage

```ruby
client = ModRest::Client.new
cleint.register(username, password)

```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/mod_rest/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
