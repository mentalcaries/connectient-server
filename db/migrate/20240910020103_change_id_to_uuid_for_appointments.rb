
class ChangeIdToUuidForAppointments < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
    remove_column :appointments, :id, :integer
    add_column :appointments, :id, :uuid, default: 'gen_random_uuid()', null: false
    execute "ALTER TABLE appointments ADD PRIMARY KEY (id);"
  end
end
