class AddPracticeRefToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_reference :appointments, :practice, null: false, foreign_key: true, type: :uuid
  end
end
