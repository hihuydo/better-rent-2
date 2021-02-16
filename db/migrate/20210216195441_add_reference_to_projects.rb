class AddReferenceToProjects < ActiveRecord::Migration[6.0]
  def change
    add_reference :projects, :user, null: false, foreign_key: true
  end
end
