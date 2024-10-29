class AddUsersRefToPractice < ActiveRecord::Migration[7.2]
  def change
    add_reference :practices, :user, type: :string, foreign_key: true
  end
end
