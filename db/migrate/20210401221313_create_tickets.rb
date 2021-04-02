class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets, id: :uuid do |t|
      t.string :title
      t.string :full_name
      t.string :c
      t.string :montant
      t.date :operation
      t.integer :ref_operation
      t.integer :ref_facturier
      t.text :description
      t.integer :contact
      t.string :slug
      t.reference :user

      t.timestamps
    end
  end
end
