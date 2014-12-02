namespace :db do
  task :go => %w(db:drop db:create db:migrate db:test:prepare)
end
