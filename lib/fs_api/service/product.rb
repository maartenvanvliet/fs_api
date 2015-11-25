module FsApi
  module Service
    class Product < BaseService
      include FsApi::Service::Searchable

      def collection_class
        FsApi::Resource::Product
      end
    end
  end
end
