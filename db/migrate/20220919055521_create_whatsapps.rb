class CreateWhatsapps < ActiveRecord::Migration[5.2]
  def change
    create_table :whatsapps do |t|
      t.string :name
      t.string :email
      t.integer :number

      t.timestamps
    end
  end
end
