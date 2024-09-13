class AddIndexToPracticesEmail < ActiveRecord::Migration[7.0]
  def change
    add_index :practices, :email, unique: true
  end
end
