require "spina/template/version"

module Spina
  module Template
    class Engine < ::Rails::Engine
      config.assets.precompile += %w(wysihtml5.css)
    end
  end
end
