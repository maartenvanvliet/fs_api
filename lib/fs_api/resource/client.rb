class FsApi::Resource::Client
  include FsApi::Resource
  extend FsApi::Resource::ClassMethods

  has_attributes %i(
    clientnr
    contact
    showcontact
    company
    address
    zipcode
    city
    country
    phone
    mobile
    email
    bankcode
    biccode
    taxnumber
    tax_shifted
    lastinvoice
    sendmethod
    paymentmethod
    top
    stddiscount
    mailintro
    reference
    notes
    notes_on_invoice
    active
    default_doclang
    default_email
    currency
    mandate_id
    mandate_date
    collecttype
    tax_type
    default_category
  )
  has_nillable_attributes %i(
    biccode
    default_doclang
  )

  has_boolean_attributes %w(
    showcontact
    notes_on_invoice
    active
    tax_shifted
  )

  has_datetime_attributes %w(
    timestamp
  )
  def path
    persisted? ? "/clients/#{clientnr}" : "/clients"
  end
end
