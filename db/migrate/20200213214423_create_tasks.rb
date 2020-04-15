class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :list_id
      t.string :summary
      t.text :description
      t.string :priority
      t.integer :created_by
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.integer :project
      t.boolean :status, default: false
    end
  end
end
