class HomesController < ApplicationController
  def index
    @tickets = Ticket.all.order('created_at desc')
  end
  
  def daily
    
  end

  def weekly
    
  end

  def monthly
    
  end

  def quarterly
    
  end
  
end
