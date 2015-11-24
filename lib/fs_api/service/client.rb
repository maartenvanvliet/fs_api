module FsApi
  module Service
    class Client < BaseService
      def collection_class
        FsApi::Resource::Client
      end

      def path
        '/clients'
      end

      def root_node
        'client'
      end
    end
  end
end
