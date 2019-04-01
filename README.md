# Lets Get Cookin

Lets Get Cookin is a simple recipe manager app. This app includes recipe creation with editing. Also gives the user the ability to rate and review a recipe. The user has the ability to add a recipe to their favorites list if they like it.

## Installation Instructions -

To use clone this repository to your computer and then run the following commands in your terminal:

```ruby
bundle install
rake db:migrate
rake db:seed
rails s
```

Once server is running, inside your browser navigate to `localhost:3000` and enjoy.

## Important Gems for App -

* `bcrypt` - store password with hashing algorithm
* `omniauth` - used to handle sign-in with third party web applications`,
  * `omniauth-twitter`,
  * `omniauth-facebook`,
* `figaro` - used to store key/secret codes from git, ENV values

## Contributing -
Bug reports and pull requests are welcome on Github at https://github.com/brettCole/Lets-get-cookin. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org/) code of conduct.

## License -
This software is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
