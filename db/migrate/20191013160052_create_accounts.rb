class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.references :accountable, polymorphic: true
    end
  end
end
