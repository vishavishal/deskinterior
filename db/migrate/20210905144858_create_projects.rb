class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :client
      t.string :project_type

      t.timestamps
    end
  end
end
