class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.datetime :date
      t.text :body

      t.timestamps
    end
  end
end
