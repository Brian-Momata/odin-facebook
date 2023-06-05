class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.belongs_to :sender, null: false, foreign_key: { to_table: :users }
      t.belongs_to :recipient, null: false, foreign_key: { to_table: :users }
      t.references :follow, null: false, foreign_key: true
      t.string :message
      t.boolean :read

      t.timestamps
    end
  end
end
