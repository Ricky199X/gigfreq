class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.boolean :band, default: false
      t.references :accountable, polymorphic: true
      t.string :uid
      t.string :provider
    end
  end
end
