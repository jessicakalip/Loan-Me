class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.string :interest
      t.float :average_rating
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
