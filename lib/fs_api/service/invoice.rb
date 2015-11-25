module FsApi
  module Service
    class Invoice < BaseService
      include FsApi::Service::Searchable

      def collection_class
        FsApi::Resource::Invoice
      end
    end
  end
end
