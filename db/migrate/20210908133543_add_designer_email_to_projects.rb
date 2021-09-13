class AddDesignerEmailToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :designer_email, :string
  end
end
