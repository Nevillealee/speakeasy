# speakeasy

Two sided video streaming marketplace platform, featuring credit card payment capabilities, user role management, complex user interfaces and advanced database relationships 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Ruby, Rails, PostgreSQL, jquery-rails, rspec-rails, factory_girl_rails
```
gem 'jquery-rails'
```
```
group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  gem "factory_girl_rails", "~> 4.0"
end
```

### Installing

We are installing Ruby On Rails on Linux using rbenv. It is a lightweight Ruby Version Management Tool. The rbenv provides an easy installation procedure to manage various versions of Ruby, and a solid environment for developing Ruby on Rails applications.

Follow the steps given below to install Ruby on Rails using rbenv tool.
Step 1: Install Prerequisite Dependencies

First of all, we have to install git - core and some ruby dependences that help to install Ruby on Rails. Use the following command for installing Rails dependencies using yum.
```
sudo yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel
```
Step 2: Install rbenv

Now we will install rbenv and set the appropriate environment variables. Use the following set of commands to get rbenv for git repository.
```
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH = "$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
exec $SHELL
```
```
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH = "$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' << ~/.bash_profile
exec $SHELL
```
Step 3: Install Ruby

Before installing Ruby, determine which version of Ruby you want to install. We will install Ruby 2.2.3. Use the following command for installing Ruby.
```
rbenv install -v 2.2.3
```
Use the following command for setting up the current Ruby version as default.
```
rbenv global 2.2.3
```
Use the following command to verify the Ruby version.
```
ruby -v
```
Output

ruby 2.2.3p173 (2015-08-18 revivion 51636) [X86_64-linux]

Ruby provides a keyword gem for installing the supported dependencies; we call them gems. If you don't want to install the documentation for Ruby-gems, then use the following command.
```
echo "gem: --no-document" > ~/.gemrc
```
Thereafter, it is better to install the Bundler gem, because it helps to manage your application dependencies. Use the following command to install bundler gem.
```
gem install bundler
```
Step 4: Install Rails

Use the following command for installing Rails version 4.2.4.
```
install rails -v 4.2.4
```
Use the following command to make Rails executable available.
```
rbenv rehash
```
Use the following command for checking the rails version.
```
rails -v
```
Output
```
Rails 4.2.4
```
Ruby on Rails framework requires JavaScript Runtime Environment (Node.js) to manage the features of Rails. Next, we will see how we can use Node.js to manage Asset Pipeline which is a Rails feature.
Step 5: Install JavaScript Runtime

Let us install Node.js from the Yum repository. We will take Node.js from EPEL yum repository. Use the following command to add the EPEL package to the yum repository.
```
sudo yum -y install epel-release
```
Use the following command for installing the Node.js package.
```
sudo yum install nodejs
```
Step 6: Install Database

By default, Rails uses sqlite3, but you may want to install MySQL, PostgreSQL, or other RDBMS. This is optional; if you have the database installed, then you may skip this step and it is not mandatory that you have a database installed to start the rails server. For this tutorial, we are using PostgreSQL database. Therefore use the following commands to install PostgreSQL.
```
sudo yum install postgresql-server postgresql-contrib
```
Accept the prompt, by responding with a y. Use the following command to create a PostgreSQl database cluster.
```
sudo postgresql-setup initdb
```
Use the following command to start and enable PostgreSQL.
```
sudo systemctl start postgresql
sudo systemctl enable postgresql
```

## Running the tests

To run rspec tests that are already built in (controller specs) use 
```
bundle exec rspec
```
### Break down into end to end tests

Ive written 2 tests with the  tasks_controller to check the functionaliy of the index action ensuring all task objects are 
properly listed out.

```
it "should list the tasks in the database" do
  task1 = FactoryGirl.create(:task)
  task2 = FactoryGirl.create(:task)
  task1.update_attributes(title: "something else")
  get :index
  expect(response).to have_http_status :success
  response_value = ActiveSupport::JSON.decode(@response.body) #access the JSON format response in a string
  expect(response_value.count).to eq(2)
  response_ids = response_value.collect do |task|
    task["id"]
  end
    expect(response_ids).to eq([task1.id, task2.id])
end
```

## Built With

* [Rails](http://rubyonrails.org/) -  A web-application framework that includes everything needed to create database-backed web applications according to the Model-View-Controller (MVC) pattern.
* [Rubygems](https://www.ruby-toolbox.com/projects/bundler.html) - Dependency Management

## Authors

* **Neville Lee** - *Initial work* - [Nevillealee](https://github.com/nevillealee)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

