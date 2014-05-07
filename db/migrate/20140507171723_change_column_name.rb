class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :posts, :datetime, :date
  end
end
