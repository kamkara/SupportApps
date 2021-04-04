class Ticket < ApplicationRecord
    
  ########### RELATIONS  ######
  belongs_to :user
    
  ########### TITLE ASSIGMEMENT  ######
  def title_builder
      if self.service === "ACHAT AIRTIME"
          self.title = "ACHAT AIRTIME"
      elsif self.service === "TICKET HKB"
          self.title = "ACHAT HKB"
      elsif self.service === "TICKET CANAL"
          self.title = "ACHAT CANAL"
      elsif self.service === "CIE PREPAYER"
          self.title = "CIE PREPAYER"
      elsif self.service === "SODECI"
          self.title = " SODECI"
      elsif self.service === "RETRAIT GAB"
          self.title = " RETRAIT GAB"
      end
  end
  
  before_save :title_builder

  ########### UNIQUENESS  ######
    validates :ref_operation,
              :ref_facturier,
               uniqueness: true, length: {minimum:8, maximum:14}

  ######### PRESENTES && FORMAT  ######
    validates :ref_operation, :ref_facturier,
              :full_name, :user_id, :title,
              :operation, :contact,
              :montant, :service,
              :description, :slug, :author,
              presence: true
 
    validates :full_name, 
                length: { maximum: 30 },
              format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }

    validates :contact, length: {minimum:10, maximum:14 }

              
  ################  CONSTANTE   ###########################
  TYPE_SERVICE = ["ACHAT AIRTIME", "TICKET HKB", "TICKET CANAL", "CIE", "SODECI", "RETRAIT GAB"]
  
  
  ################  SLUG   ###########################
  extend FriendlyId
    friendly_id :title, use: :slugged
      
  def should_generate_new_friendly_id?
    title_changed?
  end
end 