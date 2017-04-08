class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :add_to_friend_list

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String


  #attributes
  field :name, type: String, default: 'new_user'
  field :amount_final, type: Float, default: 0.0
  field :friend_ids, type: Array, default: []

  #association
  has_many :events
  has_many :payments

  has_many :payment_from, class_name: 'Transaction', inverse_of: :payer
  has_many :payment_to, class_name: 'Transaction', inverse_of: :payee


  #validations
  validates_presence_of :name

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  def get_balance_sheet
    data = {}
    self.payment_from.each do |transaction|
      data[transaction.payee_id.to_s] ||= 0.0
      data[transaction.payee_id.to_s] += transaction.amount
    end
    self.payment_to.each do |transaction|
      data[transaction.payer_id.to_s] ||= 0.0
      data[transaction.payer_id.to_s] -= transaction.amount
    end
    data
  end

  def add_to_friend_list
    self.friend_ids << self.id
    self.save
  end

end
