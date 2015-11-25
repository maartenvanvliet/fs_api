module FsApi
  module Service
    class Invoice < BaseService
      def collection_class
        FsApi::Resource::Invoice
      end
    end
  end
end
