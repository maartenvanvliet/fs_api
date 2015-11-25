module FsApi
  module Service
    class BaseService
      attr_writer :command_class
      attr_reader :api_client

      def initialize(api_client)
        @api_client = api_client
      end

      def resource_type
        self.class.name.split('::').last.downcase
      end

      def resource_type_plural
        "#{resource_type}s"
      end

      def path
        "/#{resource_type_plural}"
      end

      def instance_path(instance)
        [path, instance.path].join
      end

      def find(id)
        if response = @api_client.get([path,id].join('/'))
          if response.code.to_i == success_status_code
            json_response = JSON.parse(response.body).merge(from_api: true)
            collection_class.new(json_response[resource_type])
          end
        end
      end

      def create(attributes)
        instance = build(attributes)
        save(instance)
        instance
      end

      def build(attributes)
        instance = collection_class.new(attributes)
        instance
      end

      def delete(instance)
        @api_client.delete(instance_path(instance))
        if api_client._last_response.code.to_i != success_status_code
          instance.errors = api_client._last_response.body
          return false
        end
      end

      def save(instance)
        return false if instance.persisted? && !instance.updateable?
        if instance.persisted?
          @api_client.put(instance_path(instance), instance.to_json)
          if api_client._last_response.code.to_i != success_status_code
            instance.errors = api_client._last_response
            return false
          end
        else
          @api_client.post(instance_path(instance), instance.to_json)
          if api_client._last_response.code.to_i != create_success_status_code
            instance.errors = api_client._last_response.body
            return false
          end
        end
        true
      end

      def all
        if response = api_client.get(path)
          if response.code.to_i == success_status_code
            JSON.parse(response.body).map do |attributes|
              collection_class.new(attributes.merge(from_api: true))
            end
          end
        end
      end

      def create_success_status_code
        201
      end

      def success_status_code
        200
      end
    end
  end
end
