class RemoveDesignerNameFromProjects < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :designer_name, :string
  end
end
