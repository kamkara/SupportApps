module ApplicationHelper
    #Onglets title
    def title
     base_title = "SupportApp"
        if @title.nil?
         base_title
        else
        " #{@title} - #{base_title}"
        end
    end

end
