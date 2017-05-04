class CreateDoctorPersonals < ActiveRecord::Migration[5.0]
  def change
    create_table :doctor_personals do |t|
      t.integer :doctor_user_id, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :phone, null: false
      t.string :clinic, default: 'no_clinic'
      t.string :speciality, null: false
      t.string :license_id_photo, null: false
      t.string :face_photo, null: false

      t.timestamps
    end
  end
end
