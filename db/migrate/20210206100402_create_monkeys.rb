class CreateMonkeys < ActiveRecord::Migration[6.1]
  def change
    create_table :monkeys do |t|
      t.string :name
    end
  end
end
