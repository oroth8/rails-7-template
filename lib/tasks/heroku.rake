# frozen_string_literal: true

namespace :heroku do
  task release: ['db:migrate']

  # Review apps lifecycle
  namespace :review do
    # Called right after a review app is created
    task setup: ['db:schema:load', 'db:seed']

    # Called after review app is destroyed
    # rubocop:disable Lint/EmptyBlock
    task(destroy: :environment) {}
    # rubocop:enable Lint/EmptyBlock
  end
end
