class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.string :name
      t.integer :rating
      t.integer :price_per_night
      t.string :address
      t.string :city
      t.string :zip
      t.timestamps
    end
  end
end
