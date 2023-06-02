class AddProfileDataToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :location, :string, optional: true
    add_column :users, :bio, :text, optional: true
  end
end
