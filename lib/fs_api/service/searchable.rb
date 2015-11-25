module FsApi
  module Service
    module Searchable
      def search(options)
        if options.is_a? String
          field = 'all'
          value = options
        elsif options.is_a? Hash
          field, value = options.first
        end

        search_path = ["search#{path}", field, value].join('/')

        if response = api_client.get(search_path)
          if response.code.to_i == success_status_code
            JSON.parse(response.body).map do |attributes|
              collection_class.new(attributes.merge(from_api: true))
            end
          end
        end
      end
    end
  end
end
