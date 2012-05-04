require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  
  # Mongoid likes to preload all of your models in rails, making Spork a near worthless experience. 
  # https://github.com/sporkrb/spork/wiki/Spork.trap_method-Jujutsu
  require "rails/mongoid"
  Spork.trap_class_method(Rails::Mongoid, :load_models)


  require "rails/application"
  Spork.trap_method(Rails::Application, :eager_load!)
  Spork.trap_method(Rails::Application, :reload_routes!)
  
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'database_cleaner'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    # config.include FactoryGirl::Syntax::Methods
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec


    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    # config.fixture_path = "#{::Rails.root}/spec/fixtures"
    # config.include FactoryGirl::Syntax::Methods

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    # config.use_transactional_fixtures = true

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    config.treat_symbols_as_metadata_keys_with_true_values = true
    config.filter_run :focus => true
    config.run_all_when_everything_filtered = true

    DatabaseCleaner.strategy = :truncation
  end

  JsonSpec.configure do
    exclude_keys "created_at", "updated_at", "_id"
  end
end

Spork.each_run do

  # https://github.com/guard/guard-rspec/issues/61
  $rspec_start_time = Time.now
  
  # This code will be run each time you run your specs.
  # FactoryGirl.reload

  RSpec.configure do |config| 
    #database cleaner
    config.before(:suite) do
      DatabaseCleaner.clean
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end
  end
end



