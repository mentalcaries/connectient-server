class AddPracticeRefToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :practice, foreign_key: true, type: :uuid
  end
end
