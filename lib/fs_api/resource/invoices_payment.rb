class FsApi::Resource::InvoicesPayment
  include FsApi::Resource
  extend FsApi::Resource::ClassMethods

  has_attributes %i(
    id
    invoicenr
    date
    amount
  )

  def remote_id
    id || invoicenr
  end

  def path
    "/#{remote_id}"
  end

end
