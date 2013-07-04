class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :mobile
      t.string :landline
      t.string :twitter
      t.string :photo

      t.timestamps
    end
  end
end
