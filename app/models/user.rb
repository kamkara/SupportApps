class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, authentication_keys: [:login]


  ########### UNIQUENESS  ######
    validates :email,
              :personal_id,
               uniqueness: true

  ######### PRESENTES && FORMAT  ######
    validates :personal_id,
              :last_name,
              :first_name,
              :email,
              :role, 
              :slug,
              presence: true
 
    validates :last_name, :first_name,
                length: { maximum: 30 },
              format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }




################  CUSTOM ACTIONS  ###########################

def full_name
  self.full_name = "#{self.first_name} #{self.last_name}"
end

############ SLUG ###########
def slug
  self.slug = self.full_name
end

  extend FriendlyId
    friendly_id :slug, use: :slugged

  def should_generate_new_friendly_id?
    slug_changed?
  end
################  BEFORE ACTIONS  ###########################
#Delete whitespaces before and after fields, DownCase and capitalize
before_save do
  self.first_name         = first_name.strip.squeeze(" ").downcase.capitalize
  self.last_name          = last_name.strip.squeeze(" ").downcase.capitalize
end


################  CONSTANTE   ###########################
ROLE        = ["student", "teacher", "Admin"]


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
