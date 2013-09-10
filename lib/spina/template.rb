require "spina/template/version"

module Spina
  module Template
    class Engine < ::Rails::Engine
      Rails.application.config.assets.precompile += %w(wysihtml5.css)
    end
  end
end
