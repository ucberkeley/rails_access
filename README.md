# UC Berkely » Rails » Access control engine using RBAC concepts

* Repo: <http://github.com/ucberkeley/rails_access>
* Contact: Joel Parker Henderson, <joelparkerhenderson@berkeley.edu>

## Introduction

Role Based Access Control (RBAC) is an approach to authorization of users and systems.

To read a general introduction to RBAC: http://en.wikipedia.org/wiki/Role-based_access_control

This repo is a simple access control engine using Ruby on Rails 3.2.7. It is an experimental work-in-progress and we're making it public to help other Rails engine creators.


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
