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
https://we.riseup.net/rails/basic-crudy-mvc
https://launchschool.com/blog/integrating-rails-and-bootstrap-part-1https://github.com/seyhunak/twitter-bootstrap-rails
https://github.com/rails/jquery-rails

## Remember
rake db:drop db:create db:migrate
rails generate scaffold Contact name:string email:string age:integer state:string role:string
rails generate bootstrap:install static
rails g bootstrap:themed Contact

# Had to install postgres
brew install postgres
