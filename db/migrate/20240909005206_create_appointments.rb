class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :first_name
      t.string :last_name
      t.string :mobile_phone
      t.string :email
      t.date :requested_date
      t.time :requested_time
      t.date :scheduled_date
      t.time :scheduled_time
      t.boolean :is_emergency, default: false
      t.text :description

      t.timestamps
    end
  end
end
