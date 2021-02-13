class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :offer_url
      t.string :title
      t.text :description
      t.string :street
      t.string :number
      t.string :zipcode
      t.string :city
      t.string :floor
      t.float :latitude
      t.float :longitude
      t.float :rent_per_sqm
      t.integer :lettable_area
      t.date :availability
      t.references :user, null: false, foreign_key: true
      t.boolean :active
      t.string :cloudinary_id

      t.timestamps
    end
  end
end
