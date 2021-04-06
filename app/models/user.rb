class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, authentication_keys: [:login]

  ########### RELATIONS  ######
  has_many :tickets

  ########### UNIQUENESS  ######
    validates :email,
              :personal_id,
               uniqueness: true

  ######### PRESENTES && FORMAT  ######
    validates :personal_id,
              :full_name,
              :nick_name,:email,
              :role,:slug,
              presence: true
 
    validates :full_name, :nick_name,
                length: { maximum: 30 },
              format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }



  extend FriendlyId
    friendly_id :full_name, use: :slugged

  def should_generate_new_friendly_id?
    full_name_changed?
  end
################  BEFORE ACTIONS  ###########################
#Delete whitespaces before and after fields, DownCase and capitalize
before_save do
  self.full_name         = full_name.strip.squeeze(" ").downcase.capitalize
  self.nick_name          = nick_name.strip.squeeze(" ").downcase.capitalize
end


################  CONSTANTE   ###########################
ROLE = ["Support", "Direction", "Admin"]


################  SIGN IN PHONE NUMBR OR EMAIL  ###########################

  attr_writer :login

  def login
    @login || self.personal_id || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(personal_id) = :value OR lower(email) = :value", { :value => login }]).first
      elsif conditions.has_key?(:personal_id) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
  end
  
end
