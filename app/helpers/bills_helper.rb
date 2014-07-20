module BillsHelper

  def full_billing_id(customer, bill)
    "#{customer.billing_number.to_s.rjust(2, '0')}-#{bill.bill_id.to_s.rjust(3, '0')}"
  end

end
