class AddAddressToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :address, :string
  end
end
