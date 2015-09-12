class AddFeaturedToDiseases < ActiveRecord::Migration
  def change
    add_column :diseases, :featured, :boolean, null: false, default: false
  end
end
