class CreateHits < ActiveRecord::Migration
  def self.up
    create_table :hits do |t|
      t.datetime :clicked_at
      t.boolean :is_mobile
      t.string :page
      t.string :agency

      t.timestamps
    end
  end

  def self.down
    drop_table :hits
  end
end
