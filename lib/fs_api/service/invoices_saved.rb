module FsApi
  module Service
    class InvoicesSaved < BaseService
      def collection_class
        FsApi::Resource::Invoice
      end

      def resource_type_plural
        "invoices_saved"
      end

      def resource_type
        'invoice'
      end
    end
  end
end
