class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.datetime :due_date
      t.integer :user_id
      t.integer :project_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
