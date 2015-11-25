require "spec_helper"

describe FsApi::Service::Client do

  let(:api_client) { FsApi::Client.new('username', 'api_key') }
  let(:service) { FsApi::Service::Client.new(api_client) }
  let(:client) { FsApi::Resource::Client.new(json_response(:client).merge('from_api' => true)) }

  describe "retrieval" do
    it "retrieves all clients" do
      stub_request(:get, "https://username:api_key@www.factuursturen.nl/api/v1/clients").to_return(body: [json_response(:client)].to_json )

      clients = service.all

      expect(clients.size).to eq 1
      expect(clients.first.clientnr).to eq '1'
    end

    it "retrieves a client" do
      stub_request(:get, "https://username:api_key@www.factuursturen.nl/api/v1/clients/1").to_return(body: { 'client' => json_response(:client)}.to_json )

      client = service.find(1)

      expect(client.clientnr).to eq '1'
    end
  end

  describe "deletion" do
    it "deletes a client" do
      stub_request(:delete, "https://username:api_key@www.factuursturen.nl/api/v1/clients/1")

      service.delete(client)
    end
  end

  describe "creation" do
    it "creates a client" do
      stub_request(:post, "https://username:api_key@www.factuursturen.nl/api/v1/clients").
         with(:body => "{\"clientnr\":2}")

      client = service.create({'clientnr' => 2})

      expect(client.clientnr).to eq 2
    end
  end

  describe "updates" do
    it "updates a client" do
      stub_request(:put, "https://username:api_key@www.factuursturen.nl/api/v1/clients/1")

      client.company = 'something'

      service.save(client)
    end
  end
end
