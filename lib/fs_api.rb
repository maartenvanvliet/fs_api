require 'json'

require "fs_api/client"
require "fs_api/service/searchable"
require "fs_api/service/base_service"
require "fs_api/service/client"
require "fs_api/service/invoice"
require "fs_api/service/invoices_payment"
require "fs_api/service/invoices_saved"
require "fs_api/service/product"
require "fs_api/resource/resource"
require "fs_api/resource/client"
require "fs_api/resource/invoice"
require "fs_api/resource/invoices_payment"
require "fs_api/resource/product"

module FsApi
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.new
    FsApi::Client.new(configuration.username, configuration.api_key)
  end

  class Configuration
    attr_accessor :username, :api_key

    def initialize
      @username = nil
      @api_key = nil
    end
  end
end
