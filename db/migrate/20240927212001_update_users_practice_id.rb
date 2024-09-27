class UpdateUsersPracticeId < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :practice_id, false
  end
end
