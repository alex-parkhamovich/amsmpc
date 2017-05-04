class AddStatusToPatientUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :patient_users, :registration_status, :string, null: false, default: 'new'
  end
end
