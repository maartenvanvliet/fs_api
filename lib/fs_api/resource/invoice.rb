class FsApi::Resource::Invoice
  include FsApi::Resource
  extend FsApi::Resource::ClassMethods

  has_attributes %i(
    id
    invoicenr_full
    invoicenr
    reference
    lines
    profile
    discounttype
    discount
    paymentcondition
    paymentperiod
    collection
    tax
    totalintax
    clientnr
    company
    contact
    address
    zipcode
    city
    country
    phone
    mobile
    email
    taxnumber
    invoicenote
    sent
    uncollectible
    lastreminder
    open
    paiddate
    taxes
    payment_url
    duedate
    history
    action
    savename
    sendmethod
    name
    profile_name
    datesaved
    tax_type
    tax_shifted
  )

  has_datetime_attributes %w(
    duedate
    datesaved
  )

  has_boolean_attributes %w(
    tax_shifted
  )
  def path
    persisted? ? "/#{id}" : ""
  end

  def saved?
    !datesaved.nil? && datesaved != ''
  end

  # invoices cannot be updated
  def updateable?
    false
  end
end
