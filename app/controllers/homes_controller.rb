class HomesController < ApplicationController
 

  def index
    @homeIndexTickets = Ticket.all.order(created_at: :desc)
  end
  
  def all_ticket
    @all_tickets = Ticket.all.order(created_at: :desc)
    respond_to do |format|
      format.xlsx{}
      format.html{ render :index }
    end
  end
  
  def daily
    @daily_tickets = Ticket.where(:created_at => 1.day.ago..Time.now).order(created_at: :desc)
    respond_to do |format|
      format.xlsx{}
      format.html{ render :index }
    end
  end

  def weekly
    @weekly_tickets = Ticket.where(:created_at => 1.week.ago..Time.now).order(created_at: :desc)
    respond_to do |format|
      format.xlsx{}
      format.html{ render :index }
    end
    
  end

  def monthly
    @monthly_tickets = Ticket.where(:created_at => 1.month.ago..Time.now).order(created_at: :desc)
    respond_to do |format|
      format.xlsx{}
      format.html{ render :index }
    end
    
  end

  def quarterly
    @quarterly_tickets = Ticket.where(:created_at => 3.month.ago..Time.now).order(created_at: :desc)
    respond_to do |format|
      format.xlsx{}
      format.html{ render :index }
    end
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
