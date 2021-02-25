class ChangeAverageVoteToFloat < ActiveRecord::Migration[6.0]
  def change
    remove_column :votes, :vote_average, :integer
    add_column :votes, :vote_average, :float
  end
end
