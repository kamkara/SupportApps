class HomeController < ApplicationController

  
  def index
    @select_tickets= Ticket.all.order(created_at: :desc)#select all tickets an order on Desc
    @dailyTickets = @select_tickets.where(:created_at => 1.day.ago..Time.now)
    @weeklyTickets = @select_tickets.where(:created_at => 1.week.ago..Time.now)
    @monthlyTickets = @select_tickets.where(:created_at => 1.month.ago..Time.now)
    
  end

  #export all record
  def export_all
  end

  # Daily export
  def export_daily
    
  end
  
  #weekly export
  def export_weekly
    @weeklyTickets = Ticket.where('created = ?', 1.week).order(created_at: :desc)
    
  end
  #Monthly export
  def export_monthly
    @monthlyTickets = Ticket.where('created = ?', 1.month).order(created_at: :desc)
     
   end
  
end
