module FsApi
  module Service
    class Client < BaseService
      def collection_class
        FsApi::Resource::Client
      end
    end
  end
end
