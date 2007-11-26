class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.integer :domain_id
      t.string :name
      t.string :crypted_password, :salt
      t.integer :optional_uid, :optional_gid

      t.timestamps
    end
    add_index :accounts, [:name, :domain_id], :unique => true
  end

  def self.down
    drop_table :accounts
  end
end
