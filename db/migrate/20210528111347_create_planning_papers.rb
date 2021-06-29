class CreatePlanningPapers < ActiveRecord::Migration[6.0]
  def change
    create_table :planning_papers do |t|
      t.references :blog, foreign_key: true
      t.string  :plannning_name
      t.string  :plannning_point
      t.date    :plannning_day
      t.string  :plannning_day_2
      t.string  :plannning_day_3
      t.string  :plannning_place
      t.string  :plannning_people_count
      t.string  :plannning_preparation_object
      t.datetime :plannning_time
      t.string :planning_note
      t.string :planning_severe
      t.string :planning_palace_picture
      t.string :planning_person
      t.timestamps
    end
  end
end
