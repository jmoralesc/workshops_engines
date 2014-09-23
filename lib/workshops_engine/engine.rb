module WorkshopsEngine
  class Engine < ::Rails::Engine
    isolate_namespace WorkshopsEngine
    
    config.to_prepare do
      Dir.glob(Rails.root + 'app/decorators/**/*_decorator.rb').each do |c|
        require_dependency(c)
      end
    end

    # config.generators do |g|
    #   g.test_framework :rspec
    # end
  end
end
