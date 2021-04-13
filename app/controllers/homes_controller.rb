class HomesController < ApplicationController
  

  def index
    @homeIndexTickets = Ticket.all.order(created_at: :desc)
  end
  
  def all_ticket
    @all_tickets = Ticket.all.order(created_at: :desc)
      respond_to_xlsx_format
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
  #repsond_to format
    def respond_to_xlsx_format
      respond_to do |format|
        format.xlsx {  
          response.headers[
            response.headers['Content-Disposition'] =
            'attachment; filename="Tickets-#{Time.now.strftime("%b %-d, %Y")}.xlsx"'
          ]
        }
        format.html{ render :index }
      end
    end
end