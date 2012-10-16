$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spud_videos/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spud_videos"
  s.version     = Spud::Videos::VERSION
  s.authors     = ["David Estes"]
  s.email       = ["destes@redwindsw.com"]
  s.homepage    = "http://github.com/davydotcom/spud_videos"
  s.summary     = "Video Management addon for Spud with helpers to render youtube players and vimeo players"
  s.description = "This is a basic vide management admin tool for spud. Useful for allowing customers to add videos to a video library, control order, link to vimeo or youtube."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.2"
  s.add_dependency 'spud_core', ">= 0.9.0","< 1.0.0"


  s.add_development_dependency 'mysql2', '0.3.11'
  s.add_development_dependency 'rspec', '2.8.0'
  s.add_development_dependency 'rspec-rails', '2.8.1'
  s.add_development_dependency 'shoulda', '~> 3.0.1'
  s.add_development_dependency 'factory_girl', '2.5.0'
  s.add_development_dependency 'mocha', '0.10.3'
  s.add_development_dependency 'database_cleaner', '0.7.1'
  s.add_development_dependency 'simplecov', '~> 0.6.4'
end
