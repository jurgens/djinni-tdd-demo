class CreateDevelopers < ActiveRecord::Migration[5.0]
  def change
    create_table :developers do |t|
      t.references :city
      t.string :title
      t.string :skills
      t.integer :salary
      t.integer :experience
      t.integer :english

      t.timestamps
    end
  end
end
