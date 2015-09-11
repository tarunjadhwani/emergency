class CreatePrecautions < ActiveRecord::Migration
  def change
    create_table :precautions do |t|
      t.text :description
      t.string :video_url
      t.integer :image_id

      t.timestamps null: false
    end
  end
end
