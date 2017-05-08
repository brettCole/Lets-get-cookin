# Lets Get Cookin

Lets Get Cookin is a simple recipe manager app. This app includes recipe creation and editing. But also the ability to rate and review a recipe and also add a recipe to a user's favorites list.

## Installation -

To use clone this repository to your computer and then run the following commands:

```ruby
bundle install
rake db:migrate
rake db:seed
rails s
```

Once server is running, inside your browser navigate to `localhost:3000` and enjoy.

## Important Gems for App -

`bcrypt` - store password with hashing algorithm  
`omniauth`,  
`omniauth-twitter`,  
`omniauth-facebook` - used to handle sign-in with third party web applications.  
`figaro` - used to store key/secret codes from git  

## Contributing -
Bug reports and pull requests are welcome on Github at https://github.com/brettCole/Lets-get-cookin. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org/) code of conduct.

## License -
This software is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
