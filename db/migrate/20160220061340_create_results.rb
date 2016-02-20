class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :student
      t.decimal :correct
      t.string :report
      t.references :test, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
