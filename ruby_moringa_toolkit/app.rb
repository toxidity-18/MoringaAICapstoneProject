#!/usr/bin/env ruby
# frozen_string_literal: true

# app.rb - Minimal Sinatra app for Moringa capstone.
#
# Usage:
#   bundle install
#   ruby app.rb
#
# Visit: http://localhost:4567

require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'

# Make the app accessible across the network and set default port
set :bind, '0.0.0.0'
set :port, ENV.fetch('PORT', 4567)

# Root route - HTML response
get '/' do
  # Inline HTML for demonstration. In production, use templates.
  "<h1>Hello, Moringa — Ruby & Sinatra Toolkit</h1>\n<p>This page proves Sinatra is running.</p>"
end

# Simple JSON API endpoint
get '/api/hello' do
  content_type :json
  { message: 'Hello from Ruby API', time: Time.now }.to_json
end
