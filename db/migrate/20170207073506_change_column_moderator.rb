class ChangeColumnModerator < ActiveRecord::Migration[5.0]
  def change
    rename_column :moderators, :fullnamme, :fullname
  end
end
