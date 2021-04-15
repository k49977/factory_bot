class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  create_table :users do |t|
    t.string :email, :null => false
    t.string :password, :null => false
    t.string :first_name, :null => false
    t.string :family_name, :null => false
  end
end
