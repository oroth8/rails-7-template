namespace :heroku do
    task release: ["db:migrate"]
  end