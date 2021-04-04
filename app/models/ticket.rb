class Ticket < ApplicationRecord
  
  
  ######## RELATIONS ##################
  belongs_to :user
  
  
  ######## BUILD TITLE AND SLUG ##################
  def title
    if self.service == "AIRTIME"
      self.title   = "Reclamation sur Airtime" 
      self.slug    = self.title
    end
  end
  
  def slug
  end
  ######## VALIDATIONS #################

  ######## TYPE SERVICE #################
  TYPE_SERVICE = ["AIRTIME", "HKB", "CANAL", "CIE PREPAYE", "SODECI", "RETRAIT GAB"]


######## SLUGGED ##################
   extend FriendlyId
    friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
end
