[![Build Status](https://travis-ci.org/dsaenztagarro/howmany-backend.png)](https://travis-ci.org/dsaenztagarro/howmany-backend)
[![Code Climate](https://codeclimate.com/github/dsaenztagarro/howmany-backend/badges/gpa.svg)](https://codeclimate.com/github/dsaenztagarro/howmany-backend)
[![Coverage Status](https://coveralls.io/repos/dsaenztagarro/howmany-backend/badge.png?branch=master)](https://coveralls.io/r/dsaenztagarro/howmany-backend?branch=master)
[![Dependency Status](https://gemnasium.com/dsaenztagarro/howmany-backend.svg)](https://gemnasium.com/dsaenztagarro/howmany-backend)

## Roadmap

- [ ] Auth
- [ ] Capistrano deployment
- [ ] Swagger integration

## Use bundler's binstubs

Setup:

- One time, run `code>chmod +x $rvm_path/hooks/after_cd_bundler`
- Once for each project, run `bundle install --binstubs=.bundle/binstubs`

## Databasecleaner settings

This part sets the default database cleaning strategy to be transactions.
Transactions are very fast, and for all the tests where they do work—that
is, any test where the entire test runs in the RSpec process—they are
preferable.

```ruby
# spec/spec_helper.rb
config.before(:each) do
  DatabaseCleaner.strategy = :transaction
end
```

This line only runs before examples which have been flagged `:js => true`. By
default, these are the only tests for which Capybara fires up a test server
process and drives an actual browser window via the Selenium backend. For
these types of tests, transactions won’t work, so this code overrides the
setting and chooses the “truncation” strategy instead.  

```ruby
# spec/spec_helper.rb
config.before(:each, :js => true) do
  DatabaseCleaner.strategy = :truncation
end
```