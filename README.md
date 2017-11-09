<a href="https://www.twilio.com">
  <img src="https://static0.twilio.com/marketing/bundles/marketing/img/logos/wordmark-red.svg" alt="Twilio" width="250" />
</a>

# Account Verification Rails

[![Build Status](https://travis-ci.org/TwilioDevEd/account-verification-rails.svg?branch=master)](https://travis-ci.org/TwilioDevEd/account-verification-rails)

Verify new user accounts by sending them a one-time code via Authy. Reduce
fraudulent signups in your applications and ensure your users are in fact
living, breathing human beings.

[Read the full tutorial here!](https://www.twilio.com/docs/tutorials/walkthrough/account-verification/ruby/rails)

## Local development

This project is built using [Ruby on Rails](http://rubyonrails.org/) Framework.

1. First clone this repository and `cd` into it.

   ```bash
   $ git clone git://github.com/TwilioDevEd/account-verification-rails.git
   $ cd account-verification-rails
   ```

1. Install the dependencies.

   ```bash
   $ bundle install
   ```

1. Copy the `.env.example` file to `.env`, and edit it including your credentials
   for the Twilio API (found at https://www.twilio.com/console/account/settings) and your Authy API Key (found at https://dashboard.authy.com/). You
   will also need a [Twilio Number](https://www.twilio.com/console/phone-numbers/incoming).

   Run `source .env` to export the environment variables.

1. Create database and run migrations.

   Make sure you have installed [PostgreSQL](http://www.postgresql.org/). If on
   a Mac, I recommend [Postgres.app](http://postgresapp.com).

   ```bash
   $ bundle exec rake db:setup
   ```

1. Make sure the tests succeed.

   ```bash
   $ bundle exec rake test
   ```

1. Start the development server:

   ```
   $ bundle exec rails s
   ```

1. Check it out at [http://localhost:3000](http://localhost:3000).

## Meta

* No warranty expressed or implied.  Software is as is. Diggity.
* [MIT License](http://www.opensource.org/licenses/mit-license.html)
* Lovingly crafted by Twilio Developer Education.
