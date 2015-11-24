module FsApi
  module Service
    class Invoice < BaseService
      def collection_class
        FsApi::Resource::Invoice
      end

      def path
        '/invoices'
      end

      def root_node
        'invoice'
      end
    end
  end
end
