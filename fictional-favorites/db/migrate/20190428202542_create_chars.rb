class CreateChars < ActiveRecord::Migration
  def change
    create_table :chars do |t|
          t.string :name
          t.string :origin
        end
  end
end
