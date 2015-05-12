require "spina/template/version"
require 'bourbon'
require 'neat'
require 'jquery-fileupload-rails'
require 'font-awesome-sass'

module Spina
  module Template
    class Engine < ::Rails::Engine
      config.assets.precompile += %w(spina/wysihtml5_textarea.css)
    end
  end
end
