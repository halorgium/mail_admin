class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :name
      t.integer :domain_id
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end
    add_index :accounts, [:name, :domain_id], :unique => true
  end

  def self.down
    drop_table :accounts
  end
end
