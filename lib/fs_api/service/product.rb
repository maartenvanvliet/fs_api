module FsApi
  module Service
    class Product < BaseService
      def collection_class
        FsApi::Resource::Product
      end

      def path
        '/products'
      end

      def root_node
        'product'
      end
    end
  end
end
