class AddSeenToHangouts < ActiveRecord::Migration[6.0]
  def change
    add_column :hangouts, :seen, :boolean, default: false
  end
end
