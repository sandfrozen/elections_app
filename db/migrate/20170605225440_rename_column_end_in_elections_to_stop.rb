class RenameColumnEndInElectionsToStop < ActiveRecord::Migration[5.0]
  def change
    rename_column :elections, :end, :stop
  end
end
