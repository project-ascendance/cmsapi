class FixColumnNameOfImages < ActiveRecord::Migration[7.0]
  def change
    rename_column :images, :type, :image_type
  end
end
