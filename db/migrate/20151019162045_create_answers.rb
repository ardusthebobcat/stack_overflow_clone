class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.text :description
      t.integer :post_id

      t.timestamps
    end
  end
end
