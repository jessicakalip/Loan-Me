class AddBioToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :bio, :text
  end
end
