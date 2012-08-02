# Rails access control engine using RBAC

* Repo: <http://github.com/ucberkeley/rails_access>
* Contact: Joel Parker Henderson, <joelparkerhenderson@berkeley.edu>

## Introduction

Role Based Access Control (RBAC) is an approach to authorization of users and systems.

To read a general introduction to RBAC: http://en.wikipedia.org/wiki/Role-based_access_control

This repo is a simple access control engine using Ruby on Rails 3.2.7. It is an experimental work-in-progress and we're making it public to help other Rails engine creators.

A simple text diagram of the connections:

    User <--> Assignment <--> Role <--> Permission <--> Operation


### User

A user is a tyipcally a person.

Examples: Alice, Bob, Carol.

This is provided by your application, rather than this engine. See more about this below.


### Role

A role is typically a job function.

Examples: Admin, Teacher, Student.


### Operation

An operation is an application capability. 

Examples: Read Note, Play Song, Send Mail.


### Assignment

An assigment links a user and role. 

Example: Alice is assigned the admin role.


### Permission

A permission links a role and operation. 

Example: an admin has permission to read notes.




##  Models


User model:

    class User
       # Add these two lines to your existing user model
       has_many :assignments
       has_many :roles, :through => :assignments
    end

Assignment model:

    class Assignment
       belongs_to :user
       belongs_to :role
    end

Role model:

    class Role
       has_many :assignments
       has_many :users, :through => :assignments
       has_many :permissions
       has_many :operations, :through => :permissions
    end

Permission model:

    class Permission
       belongs_to :role
       belongs_to :operation
    end

Operation model:

    class Operation
      has_many :permissions
      has_many :roles, :through => :permissions
    end



### Your app provides the User model

This Rails engine assumes that your application provides a model called "User", and that you can add the two lines of code to your model to connect it to this engine.

We are building the engine this way to make it easy to add to our existing applications, which already have a User model.

We're considering making this configurable for different model names, such as "Person". If this is something you need, feel free to contact us and also we're happy to add pull requests.



## Code examples


### User examples

For the alice user:

    # Get roles
    alice.roles #=> [admin, developer]

    # Assign
    alice.roles += admin

    # Deassign
    alice.roles -= admin

### Role examples

For the admin role:

    # Get users:
    admin.users #=> [alice]

    # Assign
    admin += alice

    # Deassign
    admin -= alice

    # Get operations
    admin.operations #=> [create_note, read_note, update_note, delete_note]

    # Grant permission
    admin.operations += create_note

    # Revoke permission
    admin.operations -= create_note

### Operation examples 

For the read_note operation:

    # Get roles
    read_note.roles #=> [admin]

    # Grant permission
    read_note.roles += admin

    # Revoke permission
    read_note.roles -= admin


### Advanced examples

To do more advanced work with associations:

    # Get a user's assignments
    alice.assigments #=> [array of assignments]

    # Get a user's assignment's role 
    alice.assignments.first.role #=> [admin]
    
    # Get a role's assignments
    admin.assignments #=> [array of assignments]

    # Get a role's assignment's user
    admin.assignemnts.first.user #=> [alice]

    # Get a role's permissions
    admin.permissions #=> [array of permissions]

    # Get a role's permission's operation
    admin.permission.first.operation #=> [read_note]

    # Get an operation's permissions
    read_note.permissions #=> [array of permissions]

    # Get an operation's permission's role
    read_note.permissions.first.role #=> [admin]


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
