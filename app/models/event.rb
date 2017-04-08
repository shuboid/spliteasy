class Event
  include Mongoid::Document
  include Mongoid::Timestamps


  #attributes

  field :name, type: String
  field :location, type: String
  field :total_amount, type: Float
  field :date,  type: Date

  #associations


  has_and_belongs_to_many :users
  has_many :payments



end
