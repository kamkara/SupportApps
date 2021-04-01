class AddCustomFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :full_name, :string
    add_column :users, :nick_name, :string
    add_column :users, :personal_id, :string
    add_column :users, :avatar, :string
    add_column :users, :role, :string,  default: :support
    add_column :users, :slug, :string
  end
end
