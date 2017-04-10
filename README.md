# WITNESS ME

## TEAM KLCK

## GROUP MEMBERS

* Chase Stephens: chastep
* Kristen Moore: kmoreo
* Karl Thomas: karlthomas925
* Liz Hart: elizabethhart

## PROJECT DESCRIPTION

Problem: 

Say you want to bet your friend that they can't run around the block in 2 minutes. You realize that neither of you have any cash to place on this epic challenge. Enter Witness Me...

Solution: 

Witness Me allows users to challenge each other to various friendly bets just to make things interesting. These bets can range from $1 to a maximum of $10. 

A witness must be present to determine the winner. The winner receives the pot of money placed in the initial bet. The money is transferred behind the scenes using the Dwolla API. 

Challenges are initiated and confirmed in real-time using a web socket functionality that utilizes Rails ActionCable service.


## Things you'll need to be up to date in our code --

* ruby 2.3.x
* ruby on rails 5.x installed
* heroku account: we are using postgres for our database with the intention of deploying on heroku/digital ocean
* the gmail account name and password, ask Liz, Kristen, Karl, or Chase

### Clone down:
```
git clone https://github.com/chastep/WITNESS-ME.git
cd WITNESS-ME
```

### Database creation:
```
rails db:create
rails db:migrate
```

### Testing: RSpec
```
rails spec
```

### Deploying Locally
```
rails server
```

### Deploying in Heroku
```
https://devcenter.heroku.com/articles/getting-started-with-rails5
```

## Contributing
Please fork this repo and commit your changes. Submit a pull request for us to review. We love feedback!

## Licensing
Witness Me is released under the [MIT License](https://opensource.org/licenses/MIT)
