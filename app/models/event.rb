class Event
  include Mongoid::Document
  include Mongoid::Timestamps


  #attributes

  field :name, type: String
  field :location, type: String
  field :total_amount, type: Float
  field :date,  type: Date
  field :user_ids, type: Array, default: []

  #associations


  has_and_belongs_to_many :users
  has_many :payments


  def create_payments(params)
    params.each  do |count,payment_hash|
        self.payments.create(user_id:payment_hash[:user],amount:payment_hash[:amount])
    end

  end


end
