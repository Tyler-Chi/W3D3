class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    #unpluralized version of the table name
    #in this case, table name is :users, so the model name
    #would be class User
    create_table :users do |t|
      t.string :email, null: false
      t.timestamps
    end

    add_index :users, :email, unique: true

  end
end
