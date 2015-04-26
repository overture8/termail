# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'termail/version'

Gem::Specification.new do |spec|
  spec.name          = "termail"
  spec.version       = Termail::VERSION
  spec.authors       = ["Phil McClure"]
  spec.email         = ["phil.mcclure@gmail.com"]
  spec.summary       = %q{Termail is a terminal based email client for Gmail, written in Ruby.}
  spec.description   = %q{Termail is a terminal based email client for Gmail, written in Ruby.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = %w[termail.gemspec] + Dir['*.md', 'bin/*', 'lib/**/*.rb']
  spec.executables   = ["termail"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "gmail", "~> 0.5.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
