class FsApi::Client
  attr_reader :username, :password, :_last_response
  attr_accessor :errors

  def initialize(username, password)
    @username = username
    @password = password
  end

  def base_url
    "https://www.factuursturen.nl:443/api/v1"
  end

  def http
    @http ||= begin
      uri = uri_for_path(base_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      http
    end
  end

  def headers
    {
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
  end

  def uri_for_path(path)
    URI.parse(File.join(base_url, path))
  end

  def get(path, headers={})
    uri = uri_for_path(path)
    http = Net::HTTP::Get.new(uri.request_uri, self.headers.merge(headers))
    perform(http)
  end

  def put(path, body=nil, headers={})
    uri = uri_for_path(path)
    http = Net::HTTP::Put.new(uri.request_uri, self.headers.merge(headers))
    http.body = body
    perform(http)
  end

  def post(path, body=nil, headers={})
    uri = uri_for_path(path)
    http = Net::HTTP::Post.new(uri.request_uri, self.headers.merge(headers))
    http.body = body
    perform(http)
  end

  def delete(path, headers={})
    uri = uri_for_path(path)
    http = Net::HTTP::Delete.new(uri.request_uri, self.headers.merge(headers))
    perform(http)
  end

  def invoices
    FsApi::Service::Invoice.new(self)
  end

  def clients
    FsApi::Service::Client.new(self)
  end

  def products
    FsApi::Service::Product.new(self)
  end

  def invoices_payments
    FsApi::Service::InvoicesPayment.new(self)
  end

  def saved_invoices
    FsApi::Service::InvoicesSaved.new(self)
  end

  private
    def perform(request)
      request.basic_auth username, password
      @_last_response = http.request(request)
    end
end
