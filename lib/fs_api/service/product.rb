module FsApi
  module Service
    class Product < BaseService
      def collection_class
        FsApi::Resource::Product
      end
    end
  end
end
