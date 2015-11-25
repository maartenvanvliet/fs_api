require "spec_helper"

describe FsApi::Service::InvoicesPayment do

  let(:api_client) { FsApi::Client.new('username', 'api_key') }
  let(:service) { FsApi::Service::InvoicesPayment.new(api_client) }
  let(:invoice) { FsApi::Resource::Invoice.new(json_response(:invoice).merge('from_api' => true)) }

  describe "creation" do
    it "creates a invoice" do
      stub_request(:post, "https://username:api_key@www.factuursturen.nl/api/v1/invoices_payment/2").
         to_return(status: 201)


      response = service.create({'id' => 2, date: Time.now, amount: 'full'})
      expect(response.amount).to eq 'full'
      expect(response.errors).to be_nil
    end
  end
end
