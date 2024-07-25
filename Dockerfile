# Use the official Ruby image
FROM ruby:3.3.2

# Add basic packages and install Yarn
RUN apt-get update -qq && apt-get install -y \
      nodejs \
      postgresql-client \
      curl \
    && curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq && apt-get install -y yarn


# Set the working directory
WORKDIR /usr/src/app

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install Ruby gems
RUN gem install bundler && bundle install

# Copy the whole application folder into the image
COPY . .

# Install Node modules
RUN yarn install --frozen-lockfile

# Precompile assets
RUN bundle exec rake assets:precompile

# Expose Puma port
EXPOSE 3000

# Default command to run the application
CMD ["rails", "server", "-b", "0.0.0.0"]
