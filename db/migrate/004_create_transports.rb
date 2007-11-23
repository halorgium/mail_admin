class CreateTransports < ActiveRecord::Migration
  def self.up
    create_table :transports do |t|
      t.integer :domain_id
      t.string :name

      t.timestamps
    end
    add_index :transports, :name, :unique => true
  end

  def self.down
    drop_table :transports
  end
end
