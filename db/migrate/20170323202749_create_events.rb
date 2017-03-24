class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :desc
      t.string :event_type
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps null: false
    end
  end
end
