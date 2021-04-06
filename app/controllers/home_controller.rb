class HomeController < ApplicationController
  def index
    @tickets = Ticket.all.order('created_at desc')
  end
  
end
