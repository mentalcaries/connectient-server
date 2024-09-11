class CreatePractices < ActiveRecord::Migration[7.0]
  def change
    create_table :practices, id: :uuid do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :email
      t.string :phone
      t.string :practice_code
      t.string :logo
      t.string :facebook
      t.string :instagram
      t.string :website
      t.timestamps
    end
  end
end
