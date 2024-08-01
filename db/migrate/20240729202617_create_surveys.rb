class CreateSurveys < ActiveRecord::Migration[7.1]
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :description
      t.string :components, array: true, default: []

      t.timestamps
    end
  end
end
