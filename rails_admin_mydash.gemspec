$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_admin_mydash/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_admin_mydash"
  s.version     = RailsAdminMydash::VERSION
  s.authors     = ["Mattia Roccoberton"]
  s.email       = ["mat@blocknot.es"]
  s.homepage    = "http://blocknot.es/blocknotes/rails_admin_mydash"
  s.summary     = "RailsAdmin Mydash"
  s.description = "Custom Dashboard for RailsAdmin"
  s.license     = "MIT"
  s.files = Dir["{app,lib,vendor}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  # s.add_dependency "rails", "~> 5.0.1"
end
