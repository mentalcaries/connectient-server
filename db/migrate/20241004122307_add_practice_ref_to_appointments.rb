class AddPracticeRefToAppointments < ActiveRecord::Migration[7.2]
  def change
    add_reference :appointments, :practice, type: :string, null: false, foreign_key: true
  end
end
