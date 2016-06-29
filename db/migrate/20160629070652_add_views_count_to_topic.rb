class AddViewsCountToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :views_count, :ineger, :default => 0
  end
end
