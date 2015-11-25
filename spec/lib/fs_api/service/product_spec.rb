require "spec_helper"

describe FsApi::Service::Product do
  let(:api_client) { FsApi::Client.new('username', 'api_key') }

  let(:service) { FsApi::Service::Product.new(api_client) }
  let(:product) { FsApi::Resource::Product.new(json_response(:product).merge('from_api' => true)) }

  describe "retrieval" do
    it "retrieves all products" do
      stub_request(:get, "https://username:api_key@www.factuursturen.nl/api/v1/products").to_return(body: [json_response(:product)].to_json )

      products = service.all
      expect(products.size).to eq 1
      expect(products.first.code).to eq "product code"
    end

    it "retrieves a product" do
      stub_request(:get, "https://username:api_key@www.factuursturen.nl/api/v1/products/1").to_return(body: { 'product' => json_response(:product)}.to_json )

      product = service.find(1)

      expect(product.code).to eq "product code"
    end
  end

  describe "deletion" do
    it "deletes a product" do
      stub_request(:delete, "https://username:api_key@www.factuursturen.nl/api/v1/products/1")

      service.delete(product)
    end
  end

  describe "creation" do
    it "creates a product" do
      stub_request(:post, "https://username:api_key@www.factuursturen.nl/api/v1/products").
         with(:body => "{\"code\":2}")

      product = service.create({'code' => 2})

      expect(product.code).to eq 2
    end
  end

  describe "updates" do
    it "updates a product" do
      stub_request(:put, "https://username:api_key@www.factuursturen.nl/api/v1/products/1")

      product.code = 'something'

      service.save(product)
    end
  end

  describe "search" do
    it "searches in all fields" do
      stub_request(:get, "https://username:api_key@www.factuursturen.nl/api/v1/search/products/all/john").
        to_return(body: [json_response(:product)].to_json )

      products = service.search('john')

      expect(products.size).to eq 1
      expect(products.first.code).to eq "product code"
    end

    it "searches in a fields" do
      stub_request(:get, "https://username:api_key@www.factuursturen.nl/api/v1/search/products/city/john").
        to_return(body: [json_response(:product)].to_json )

      products = service.search(city: 'john')

      expect(products.size).to eq 1
      expect(products.first.code).to eq "product code"
    end
  end
end
