class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :type
      t.string :username
      t.string :full_name
      t.text :description

      t.timestamps
    end
  end
end
