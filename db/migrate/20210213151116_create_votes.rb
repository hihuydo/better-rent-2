class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :stage
      t.references :user, null: false, foreign_key: true
      t.integer :vote_location
      t.integer :vote_price
      t.integer :vote_size
      t.integer :vote_average

      t.timestamps
    end
  end
end
