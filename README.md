# RD Segmentation Challenge

More Comments at the end about some rocks I bumped into during the challenge and can be seen commit by commit as well.

## __Deployed here__

https://rd-segmentation-challenge.herokuapp.com

Also it is possible to use as an API returning and reading json to all verbs. Exemples below.

## __To be up and running:__

Install RVM with rails if needed:

    $ \curl -sSL * https://get.rvm.io | bash -s stable --ruby

Clone the repo:

    $ git clone * https://github.com/thiagocharao/rd-segmentation.git

RVM:

    $ rvm install 2.4.0 # Install ruby version if needed
    $ rvm use ruby-2.4.0@rd_segmentation --create
    $ rvm gemset use rd_segmentation

Install Bundle:

    $ gem install bundler
    $ bundle install --without production

DB setup:

    $ rake db:create
    $ rake db:migrate
    $ rake db:seed # if you want some data

Go for it!

    $ rails s

Test running:

    $ rake test

Deployed on Heroku:

    $ brew install heroku # Assuming OSX
    $ heroku login
    $ heroku create
    $ git push heroku master
    $ heroku run rake db:migrate
    $ heroku open

# As an API

## Contacts API CRUD
```json
POST  http://localhost:3000/contacts/
Accept: application/json
Content-Type: application/json

{
    "name": "Thiago Charão",
    "age": 28,
    "email": "charao.thiago@gmail.com",
    "role": "Software Developer",
    "state": "SC"
}
```

## Contact segmentations API CRUD
```json
POST http://localhost:3000/contact_segmentations/
Accept: application/json
Content-Type: application/json

{
    "contact_segmentation":{
        "description": "Find Charão",
        "filter_conditions_attributes": [
            {"field": "name", "comparator": "*=", "value": "Charão"},
            {"field": "age", "comparator": "=", "value": 28}
        ]
    }
}
```
## Retrieve segmentation example
```json
GET http://localhost:3000/contact_segmentations/:id
Accept: application/json

{
  "segmentation": {
    "id": 13,
    "description": "Find Charão"
  },
  "filter_conditions": [
    {
      "id": 11,
      "field": "name",
      "comparator": "*=",
      "value": "Charão",
      "contact_segmentation_id": 13,
      "mandatory": true
    },
    {
      "id": 12,
      "field": "age",
      "comparator": "=",
      "value": "28",
      "contact_segmentation_id": 13,
      "mandatory": true
    }
  ],
  "contacts": [
    {
      "id": 36,
      "name": "Thiago Charão",
      "email": "charao.thiago@gmail.com",
      "age": 28,
      "state": "SC",
      "role": "Software Developer"
    }
  ]
}

```

## References
#### They are pretty much ordered by each difficult I encontered

https://rvm.io/rvm/basics

http://fgimian.github.io/blog/2012/12/08/setting-up-virtual-development-environments-for-ruby/

http://api.rubyonrails.org

http://guides.rubyonrails.org

https://devcenter.heroku.com/articles/getting-started-with-rails5

https://we.riseup.net/rails/basic-crudy-mvc

https://launchschool.com/blog/integrating-rails-and-bootstrap-part-1

https://github.com/seyhunak/twitter-bootstrap-rails

https://github.com/rails/jquery-rails

https://rubyplus.com/articles/3681-Complex-Forms-in-Rails-5

https://www.viget.com/articles/exploring-the-inverse-of-option-on-rails-model-associations

https://github.com/nixme/pry-nav

http://edgeapi.rubyonrails.org/classes/ActionController/StrongParameters.html

https://github.com/nathanvda/cocoon

https://github.com/nathanvda/cocoon/wiki/ERB-examples

https://makandracards.com/makandra/20093-how-to-find-out-the-type-of-a-model-s-attribute

https://github.com/activerecord-hackery/ransack

http://stackoverflow.com/questions/1407451/calling-a-function-from-a-string-with-the-functions-name-in-ruby
