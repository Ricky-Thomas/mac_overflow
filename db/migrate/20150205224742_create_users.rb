class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name # this can be NULL
      t.string :email # please have migrations that guard your database
      t.string :password_digest
      t.string :pic_url

      t.timestamps null: false
    end
  end
end
