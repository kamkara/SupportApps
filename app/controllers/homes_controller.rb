class HomesController < ApplicationController
  before_action :respond_format_xlsx
  def index
    @tickets = Ticket.all.order(created_at: :desc)
    respond_format_xlsx
  end
  
  def daily
    
  end

  def weekly
    
  end

  def monthly
    
  end

  def quarterly
    
  end
  private
  
end
