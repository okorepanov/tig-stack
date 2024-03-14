# Use a Ruby base image
FROM ruby:3.1.4

# Set working directory
WORKDIR /app

# Install Rails
RUN gem install rails

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Expose port
EXPOSE 3001

# Start Rails server
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3001"]
