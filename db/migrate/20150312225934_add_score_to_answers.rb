class AddScoreToAnswers < ActiveRecord::Migration
  def change
  	add_column :answers, :score, :integer, null: false, default: 0
  end
end
