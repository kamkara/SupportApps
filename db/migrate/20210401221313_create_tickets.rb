class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets, id: :uuid do |t|
      t.string :title
      t.string :full_name
      t.string :service
      t.string :montant
      t.string :author
      t.date :operation
      t.integer :ref_operation
      t.integer :ref_facturier
      t.text :description
      t.integer :contact
      t.string :slug
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
