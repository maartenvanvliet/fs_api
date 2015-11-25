require "spec_helper"

describe FsApi::Client do

  let(:client) { described_class.new("username","api_token") }

  it "sets a username" do
    expect(client.username).to eq 'username'
  end

  it "sets a token" do
    expect(client.password).to eq 'api_token'
  end

  describe "request handling" do
    let(:url) {"https://username:api_token@www.factuursturen.nl/api/v1/path" }

    it "can do a post request" do
      stub = stub_request(:post, url)

      client.post('/path', 'body')

      expect(stub).to have_been_requested
    end

    it "can do a get request" do
      stub = stub_request(:get, url)

      client.get('/path')

      expect(stub).to have_been_requested
    end

    it "can do a put request" do
      stub = stub_request(:put, url)

      client.put('/path', 'body')

      expect(stub).to have_been_requested
    end

    it "can do a delete request" do
      stub = stub_request(:delete, url)

      client.delete('/path')

      expect(stub).to have_been_requested
    end

    describe "response" do
      it "stores last response" do
        stub = stub_request(:post, "https://username:api_token@www.factuursturen.nl/api/v1/path").to_return(body: 'somebody')

        client.post('/path', 'body')

        expect(client._last_response.body).to eq 'somebody'
      end
    end
  end

end
