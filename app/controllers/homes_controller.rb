class HomesController < ApplicationController
  before_action :respond_to_xlsx_format

  def index
    @tickets = Ticket.all.order(created_at: :desc)
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
