class HomeController < ApplicationController

  
  def index
    @select_tickets= Ticket.all.order(created_at: :desc)#select all tickets an order on Desc
    @dailyTickets = @select_tickets.where(:created_at => 1.day.ago..Time.now)
    @weeklyTickets = @select_tickets.where(:created_at => 1.week.ago..Time.now)
    @monthlyTickets = @select_tickets.where(:created_at => 1.month.ago..Time.now)
    
  end

  
end
