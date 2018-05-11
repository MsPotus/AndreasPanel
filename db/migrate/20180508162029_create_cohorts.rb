class CreateCohorts < ActiveRecord::Migration[5.2]
  def change
    create_table :cohorts do |t|
      t.string :name
      t.date :start_date
      t.date :end_date

      #foreign key for one-to-many associ courses has many cohorts
      t.integer :course_id 

      t.timestamps
    end
  end
end
