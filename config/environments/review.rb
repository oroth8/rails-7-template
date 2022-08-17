require_relative "development"

Rails.application.configure do
    config.hosts << "west-chestnut-portal-pr-#{ENV['HEROKU_PR_NUMBER']}.herokuapp.com"
  # Override development configuration here
end
