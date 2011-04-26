class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token

      t.timestamps
    end
    create_table :roles_users, :id => false, :force => true do |t|
      t.references  :user
      t.references  :role
      t.timestamps
    end
  end

  def self.down
    drop_table :users
    drop_table :roles_users
  end
end
