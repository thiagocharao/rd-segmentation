## Install RVM with rails
\curl -sSL https://get.rvm.io | bash -s stable --rails

rvm install 2.4.0
rvm use 2.4.0
rvm gemset create rd_segmentation

rvm gemset use rd_segmentation
bundle install

rake db:migrate

## REFS
https://rvm.io/rvm/basics
http://fgimian.github.io/blog/2012/12/08/setting-up-virtual-development-environments-for-ruby/
http://api.rubyonrails.org
http://guides.rubyonrails.org
https://devcenter.heroku.com/articles/getting-started-with-rails5
https://we.riseup.net/rails/basic-crudy-mvc
https://launchschool.com/blog/integrating-rails-and-bootstrap-part-1https://github.com/seyhunak/twitter-bootstrap-rails
https://github.com/rails/jquery-rails
https://rubyplus.com/articles/3681-Complex-Forms-in-Rails-5
https://www.viget.com/articles/exploring-the-inverse-of-option-on-rails-model-associations
https://github.com/nixme/pry-nav                 DEBUG!@!@!!🙏
http://edgeapi.rubyonrails.org/classes/ActionController/StrongParameters.html
https://github.com/nathanvda/cocoon
https://github.com/nathanvda/cocoon/wiki/ERB-examples

## Remember
rake db:drop db:create db:migrate
rails generate scaffold Contact name:string email:string age:integer state:string role:string
rails generate bootstrap:install static
rails g bootstrap:themed Contact

# Had to install postgres
brew install postgres


I don't know best practices when breaking code lines, like PEP8.
