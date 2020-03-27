class AddCoulmnsToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :summary, :string
    add_column :tasks, :description, :text
    add_column :tasks, :priority, :string
    add_column :tasks, :project, :integer
    add_column :tasks, :status, :string
  end
end
