class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.references :item
      t.text :question
      t.date :question_dt
      t.text :answer
      t.date :answer_dt

      t.timestamps
    end

  end

  def self.down
    drop_table :questions
  end
end
