module FsApi
  module Service
    class Client < BaseService
      include FsApi::Service::Searchable

      def collection_class
        FsApi::Resource::Client
      end
    end
  end
end
