class AddDescriptionToDeveloper < ActiveRecord::Migration[5.0]
  def change
    add_column :developers, :description, :text
  end
end
