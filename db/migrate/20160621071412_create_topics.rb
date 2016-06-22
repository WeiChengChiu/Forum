class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :comment_count
      t.timestamps null: false
    end

    add_index :topics, :user_id

  end
end
