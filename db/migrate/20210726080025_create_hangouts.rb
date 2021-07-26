class CreateHangouts < ActiveRecord::Migration[6.0]
  def change
    create_table :hangouts do |t|
      t.string :status
      t.date :date
      t.time :time
      t.references :user, null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
