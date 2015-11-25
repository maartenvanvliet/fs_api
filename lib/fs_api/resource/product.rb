class FsApi::Resource::Product
  include FsApi::Resource
  extend FsApi::Resource::ClassMethods

  has_attributes %i(
    id
    code
    name
    price
    priceintax
    taxes
  )

  def path
    persisted? ? "/#{id}" : ""
  end

end
