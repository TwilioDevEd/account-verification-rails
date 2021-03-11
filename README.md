<a  href="https://www.twilio.com">
<img  src="https://static0.twilio.com/marketing/bundles/marketing/img/logos/wordmark-red.svg"  alt="Twilio"  width="250"  />
</a>
 
# Account Verification Rails

![](https://github.com/TwilioDevEd/account-verification-rails/actions/workflows/build.yml/badge.svg)

## About

Verify new user accounts by sending them a one-time code via Authy. Reduce
fraudulent signups in your applications and ensure your users are in fact
living, breathing human beings.

[Read the full tutorial here!](https://www.twilio.com/docs/tutorials/walkthrough/account-verification/ruby/rails)

## Local development

This project is built using [Ruby on Rails](http://rubyonrails.org/) and [NodeJS](https://nodejs.org/en/) Frameworks.

1. First clone this repository and `cd` into it.

   ```bash
   $ git clone git://github.com/TwilioDevEd/account-verification-rails.git
   $ cd account-verification-rails
   ```

1. Install Rails the dependencies.
   ```
   $ bundle install
   ```

1. Install Webpack the dependencies.
   ```
   $ npm install
   ```

1. Copy the sample configuration file and edit it to match your configuration.

   ```bash
   $ cp .env.example .env
   ```

   You can find your `TWILIO_ACCOUNT_SID` and `TWILIO_AUTH_TOKEN` in your
   [Twilio Account Settings](https://www.twilio.com/console/account/settings).
   You will also need a `AUTHY_API_KEY` found at https://dashboard.authy.com/.

1. Create database and run migrations.

   _Make sure you have installed [PostgreSQL](http://www.postgresql.org/). If on a Mac, I recommend [Postgres.app](http://postgresapp.com)_

   ```bash
   $ bundle exec rails db:setup
   ```

1. Make sure the tests succeed.

   ```bash
   $ bundle exec rails test
   ```

1. Start the server.

   ```bash
   $ bundle exec rails s
   ```

1. Check it out at [http://localhost:3000](http://localhost:3000)

## Meta

* No warranty expressed or implied. Software is as is. Diggity.
* [MIT License](LICENSE)
* Lovingly crafted by Twilio Developer Education.
