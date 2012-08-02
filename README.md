# SixArm.com » Rails » <br> Role Based Access Control (RBAC)

* Doc: <http://sixarm.com/sixarm_rails_rbac/doc>
* Gem: <http://rubygems.org/gems/sixarm_rails_rbac>
* Repo: <http://github.com/sixarm/sixarm_rails_rbac>
* Email: Joel Parker Henderson, <joel@sixarm.com>

## Introduction

Role Based Access Control (RBAC) works with users, assignments, roles, permissions, and operations.

To read a general introduction to RBAC: http://en.wikipedia.org/wiki/Role-based_access_control


### User

A user is a tyipcally a person. Examples: Alice, Bob, Carol.


### Role

A role is typically a job function. Examples: Administrator, Teacher, Student.


### Operation

An operation is an application capability. Examples: "Read Note", "Play Song", "Send Mail", 


### Assignment

An assigment links a user and role. Example: Alice is assigned the administrator role.


### Permission

A permission links a role and operation. Example: an Administrator has permission to read notes.


### Diagram

A simple text diagram of the connections:

    User <--> Assignment <--> Role <--> Permission <--> Operation


## Rails generators

    rails generate scaffold role name:string description:string
    rails generate scaffold operation name:string description:string
    rails generate scaffold assignment user:references role:references
    rails generate scaffold permission role:references operation:references



## Installing the engine


Add the gem to the parent application's <code>Gemfile</code> file:

    gem 'access', :path => "vendor/engines/access"


Mount the engine in the parent application’s <code>config/routes.rb</code> file:

    mount Access::Engine, :at => "access"


To copy migrations from the engine to the parent application:

    rake access:install:migrations


Run the migrations as usual:

    rake db:migrate


Run the parent app as usual:

    rails server


To try the engine:

    http://localhost:3000/access
