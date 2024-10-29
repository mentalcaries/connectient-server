class CreatePractices < ActiveRecord::Migration[7.0]
  def change
    create_table :practices, force: true, id: false do |t|
      t.primary_key :id, :string, default: -> { "ULID()" }
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
