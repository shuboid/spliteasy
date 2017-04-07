#
# Class Transaction provides map of payment between each member participating in event
#
# @author Shubham Chintalwar <shubhamchintalwar94@gmail.com>
#
class Transaction
  include Mongoid::Document
  include Mongoid::Timestamps

  #attributes
  field :amount, type: Float, default: 0

  #association
  belongs_to :event
  belongs_to :payee, class_name: 'User', inverse_of: :payment_from
  belongs_to :payer, class_name: 'User', inverse_of: :payment_to

  validates_presence_of :amount
end
