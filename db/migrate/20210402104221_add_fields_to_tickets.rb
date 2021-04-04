class AddFieldsToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :author, :string
  end
end
