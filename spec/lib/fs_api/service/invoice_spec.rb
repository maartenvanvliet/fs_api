require "spec_helper"

describe FsApi::Service::Client do

  let(:api_client) { FsApi::Client.new('username', 'api_key') }
  let(:service) { FsApi::Service::Invoice.new(api_client) }
  let(:invoice) { FsApi::Resource::Invoice.new(json_response(:invoice).merge('from_api' => true)) }

  describe "retrieval" do
    it "retrieves all invoices" do
      stub_request(:get, "https://username:api_key@www.factuursturen.nl/api/v1/invoices").to_return(body: [json_response(:invoice)].to_json )

      invoices = service.all

      expect(invoices.size).to eq 1
      expect(invoices.first.invoicenr).to eq 'F20150001'
    end

    it "retrieves a invoice" do
      stub_request(:get, "https://username:api_key@www.factuursturen.nl/api/v1/invoices/20150001").to_return(body: { 'invoice' => json_response(:invoice)}.to_json )

      invoice = service.find('20150001')

      expect(invoice.invoicenr).to eq 'F20150001'
    end
  end

  describe "deletion" do
    it "deletes a invoice" do
      stub_request(:delete, "https://username:api_key@www.factuursturen.nl/api/v1/invoices/20150001")

      service.delete(invoice)
    end
  end

  describe "creation" do
    it "creates a invoice" do
      stub_request(:post, "https://username:api_key@www.factuursturen.nl/api/v1/invoices").
         with(:body => "{\"invoicenr\":2}")

      invoice = service.create({'invoicenr' => 2})

      expect(invoice.invoicenr).to eq 2
    end
  end
end
