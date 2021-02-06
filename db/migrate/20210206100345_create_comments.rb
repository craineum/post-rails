class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :value
      t.references :source, polymorphic: true, index: true, null: false
    end
  end
end
