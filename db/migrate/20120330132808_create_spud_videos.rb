class CreateSpudVideos < ActiveRecord::Migration
  def change
    create_table :spud_videos do |t|
      t.string :name
      t.string :source
      t.text :description
      t.string :embed_link
      t.integer :video_order

      t.timestamps
    end
    add_index :spud_videos, :video_order
  end
end
