class AddDefaultValueToProjectStage < ActiveRecord::Migration[6.0]
  def change
    remove_column :projects, :stage, :integer
    add_column :projects, :stage, :integer, :default => 1
  end
end
