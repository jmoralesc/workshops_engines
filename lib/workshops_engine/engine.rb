module WorkshopsEngine
  class Engine < ::Rails::Engine
    isolate_namespace WorkshopsEngine
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
