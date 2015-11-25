require 'webmock/rspec'
require 'fs_api'

require_relative "support/json_response_helper"

RSpec.configure do |config|
  config.include JsonResponseHelper
end
