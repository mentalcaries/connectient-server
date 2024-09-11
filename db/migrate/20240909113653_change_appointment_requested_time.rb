class ChangeAppointmentRequestedTime < ActiveRecord::Migration[7.0]
  def change
    change_column :appointments, :requested_time, :string
  end
end
