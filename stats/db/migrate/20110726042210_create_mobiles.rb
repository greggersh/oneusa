class CreateMobiles < ActiveRecord::Migration
  def self.up
    create_table :mobiles do |t|
      t.datetime :clicked_at
      t.integer :mobile_count
      t.integer :total_count

      t.timestamps
    end
  end

  def self.down
    drop_table :mobiles
  end
end
