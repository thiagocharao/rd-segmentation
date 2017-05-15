# RD Segmentation Challenge

## Hi y'all!
Knowing the risks of failing miserably for knowing absolutely nothing about Ruby, I went for it using Ruby on Rails.

* "Whats and whys":
  - Using .NET would be my first choice because is the language I've used for the longest time, eventhough it has been a while since I don't work on a project using it. But I would never do it to you guys (having to download Visual Studio or Xamarin Studio), I love .NET ❤️ though.
  - Then thought about using Python, but that was similar enough to use Ruby.
  - Then knowing Ruby's what is used at RD, that was my choice, so in case you guys like it I better get used to it already, although in any case it was really fun! 🤓

All that said, in words of Abraham Lincoln:
> __*"Pardon my French"*__

More Comments at the end about some rocks I bumped into during the challenge and can be seen commit by commit as well.

## __Deployed here__

https://rd-segmentation-challenge.herokuapp.com

Also it is possible to use as an API returning and reading json to all verbs. Exemples below.

## __To be up and running:__

Install RVM with rails if needed:

    $ \curl -sSL * https://get.rvm.io | bash -s stable --ruby

Clone the repo:

    $ git clone * https://github.com/thiagocharao/rd-segmentation.git

RVM stuff (Some pain here for someone (me) used to virtualenvs 😅):

    $ rvm install 2.4.0 # Install ruby version if needed
    $ rvm use ruby-2.4.0@rd_segmentation --create
    $ rvm gemset use rd_segmentation

Install Bundle stuff:

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

# Also as an API

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


# My findings

## Comments

* I don't know best practices when breaking code lines, like PEP8. Would love to know more about best practices in Ruby.

* I managed to leave postgres on production and sqlite to dev because I believe sqlite is way faster, at least it is while running Python tests.

* Used bootstrap because was the fastest way to make the interface more presentable, although I don't know much about UIs.

* There are so many automagical things with Rails, it is really nice, but the down side I felt a bit lost when things didn't go ok. 😬

## Things I would do differently, probably better

* Implement an interface to filter generically any Model, for that, I would create this interface having the method for `comparable_fields`, so each model would say the filterable fields and their types, then make `filter` method to run this interface method instead of specific Concact one.

* Implement validation of comparators x types, to make possible to select only their matches (eg. > to numbers and =* to text)

## Things I would do differently, probably better

* Implement an interface to filter generically any Model, for that, I would create this interface having the method for `comparable_fields`, so each model would say the filterable fields and their types, then make `filter` method to run this interface method instead of specific Concact one.

* Implement validation of comparators x types, to make possible to select only their matches (eg. > to numbers and =* to text)

* Write tests for interfaces, I have to be honest here. No clue how to do it. Google and StackOverflow did not teach me this one. (Selenium and Rspec)

* I had to remove CSRF token validation in order to make it work without much effort, although I would not do this in production, obviously.

* I ended up really upset by not being able to use Ransack, more than that, there is no easy QueryBuilder to use with Active Record, at least I could no find. I was almos there then it got really tricky because Ransack when merging searches it obligates to join all clauses with the same operator (AND or OR). Probably it is possible to make it work, although I was starting to run ou of time.

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
