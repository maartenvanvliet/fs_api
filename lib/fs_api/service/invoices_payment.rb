module FsApi
  module Service
    class InvoicesPayment < BaseService
      def collection_class
        FsApi::Resource::InvoicesPayment
      end

      def resource_type_plural
        "invoices_payment"
      end
    end
  end
end
