class CreateHumans < ActiveRecord::Migration[6.1]
  def change
    create_table :humans do |t|
      t.string :name
    end
  end
end
