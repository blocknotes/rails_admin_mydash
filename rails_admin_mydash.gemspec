$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_mydash/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_mydash"
  s.version     = RailsAdminMydash::VERSION
  s.authors     = ["Mattia Roccoberton"]
  s.email       = ["mat@blocknot.es"]
  s.homepage    = "https://github.com/blocknotes/rails_admin_mydash"
  s.summary     = "Rails Admin Mydash"
  s.description = "An alternative dashboard for rails_admin"
  s.license     = "MIT"
  s.files = Dir["{app,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  # s.add_dependency "rails", "~> 5.0.1"
end
