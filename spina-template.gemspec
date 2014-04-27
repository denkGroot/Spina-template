# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spina/template/version'

Gem::Specification.new do |spec|
  spec.name          = "spina-template"
  spec.version       = Spina::Template::VERSION
  spec.authors       = ["Bram Jetten"]
  spec.email         = ["bram@denkgroot.com"]
  spec.description   = "Template"
  spec.summary       = "Spina"
  spec.homepage      = "http://www.denkgroot.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "bourbon", "~> 3.2.1"
  spec.add_dependency "neat", "~> 1.5.0"
  spec.add_dependency "coffee-rails"
  spec.add_dependency 'jquery-fileupload-rails'
end
