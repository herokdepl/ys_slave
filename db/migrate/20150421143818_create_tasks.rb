class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :action, null: false
      t.string :argument, null: false
      t.timestamps null: false
    end
  end
end
