class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.boolean :task_needed, default: true
      t.text :task_description
      t.decimal :task_cost
      t.boolean :task_completed, default: false 
      t.integer :tenant_id

      t.timestamps
    end
  end
end
