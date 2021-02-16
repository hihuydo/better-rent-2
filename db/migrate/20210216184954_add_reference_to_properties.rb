class AddReferenceToProperties < ActiveRecord::Migration[6.0]
  def change
    add_reference :properties, :project, null: false, foreign_key: true
  end
end
