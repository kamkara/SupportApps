class Ticket < ApplicationRecord
  
  
  ######## RELATIONS ##################
  belongs_to :user
  
  
  ######## BUILD TITLE AND SLUG ##################
  
  ######## VALIDATIONS #################
######### PRESENTES && FORMAT  ######
  #CAS PARTICULIER 
  #:id_transaction,
  #:id_facturier
  
  validates :title, :custom_name,:contact, 
              :service, :operation, :amount,
              :content, :slug, :author,
                presence: true

    validates :custom_name,
              length: { maximum: 100 },
              format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }
    validates :title, :content,
              length: { maximum: 700 }

    validates :contact, 
                length: { in: 10..14},
              numericality: { only_integer: true }


    validates :id_transaction, :id_facturier ,uniqueness: true

  ######## TYPE SERVICE #################
  TYPE_SERVICE = ["AIRTIME MOOV", "AIRTIME MTN", "AIRTIME ORANGE", "HKB", "CANAL", "CIE PREPAYE", "SODECI", "RETRAIT GAB"]


######## SLUGGED ##################
   extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
