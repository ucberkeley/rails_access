$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "access/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "access"
  s.version     = Access::VERSION
  s.authors     = ["Joel Parker Henderson"]
  s.email       = ["joel@sixarm.com"]
  s.homepage    = "http://sixarm.com"
  s.summary     = "RBAC provides Role Based Access Control."
  s.description = "RBAC provides Role Based Access Control for authorization with users, assignments, roles, permissions, and operations."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2.7", "< 6.1.0"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
