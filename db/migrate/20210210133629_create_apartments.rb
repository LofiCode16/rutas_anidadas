class CreateApartments < ActiveRecord::Migration[5.2]
  def change
    create_table :apartments do |t|
      t.integer :number
      t.string :tower
      t.string :owner

      t.timestamps
    end
  end
end
