class CreateCredentials < ActiveRecord::Migration[7.0]
  def change
    create_table :credentials do |t|
      t.references :user, null: false, foreign_key: true
      t.string :account
      t.string :username
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
