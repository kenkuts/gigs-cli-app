
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gigs/version"

Gem::Specification.new do |spec|
  spec.name          = "gigs"
  spec.version       = Gigs::VERSION
  spec.authors       = ["Kenneth R. Kutschera"]
  spec.email         = ["kennethchoi19@gmail.com"]
  spec.licenses      = ["MIT"]
  spec.summary       = %q{This gem generates a list of tour dates to where your favorite band,artist or DJ is going to perform.}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/kenkuts/gigs-cli-app"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TO DO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = `git ls-files`.split($\)#Dir.chdir(File.expand_path('..', __FILE__)) do
  #   `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  # end
  # spec.bindir        = "exe"
  spec.executables   = ["gigs"] #spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "lib/gigs"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "nokogiri", "~> 1.10.8"
  spec.add_development_dependency "selenium-webdriver", "~> 3.13"
  spec.add_development_dependency "colorize", "~> 0.8"
  spec.add_development_dependency "pry", "~> 0"
  spec.add_development_dependency "rubyzip", "~> 1.3.0"
end
