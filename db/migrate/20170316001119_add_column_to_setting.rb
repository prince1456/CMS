class AddColumnToSetting < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :copyright, :string
  end
end
