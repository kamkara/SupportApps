json.extract! ticket, :id, :title, :full_name, :service, :montant, :operation, :ref_operation, :ref_facturier, :description, :contact, :slug, :user, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
