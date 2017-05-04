class CreatePatientPersonal < ActiveRecord::Migration[5.0]
  def change
    create_table :patient_personals do |t|
      t.integer :patient_user_id, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :phone, null: false
      t.string :gender, null: false
      t.string :face_photo, null: false
      t.string :id_photo, null:false

      t.timestamps
    end
  end
end
