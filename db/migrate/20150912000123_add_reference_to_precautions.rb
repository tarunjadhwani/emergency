class AddReferenceToPrecautions < ActiveRecord::Migration
  def change
    add_reference :precautions, :disease, index: true
  end
end
