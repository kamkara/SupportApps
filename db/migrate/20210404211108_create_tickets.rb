class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets, id: :uuid do |t|
      t.string :title
      t.string :custom_name
      t.string :contact
      t.string :service
      t.string :montant
      t.string :author
      t.date :operation
      t.string :amount
      t.string :id_transaction
      t.string :id_facturier
      t.text :content
      t.string :slug
      t.string :author
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
