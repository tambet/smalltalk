# Smalltalk

A sample [AngularJS](http://angularjs.org) [app](https://github.com/tambet/smalltalk/)
which uses [rails](http://rubyonrails.org/) as a backend.

## Setting the environment up

* ruby 2.1.0 ([rbenv](https://github.com/sstephenson/rbenv) recommended for installation)
* node 0.10.26 ([nvm](https://github.com/creationix/nvm) recommended for installation)

## Installation

1. `git clone git@github.com:tambet/smalltalk.git`
2. `cd smalltalk && bundle install`
3. `rake db:create && rake db:migrate`

Bower package manager is used to maintain the front-end dependencies.

4. `npm install -g bower`
5. `bower install`
6. Start the server `rails s`

## Running tests

`rake spec`
