class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :title
    end
  end

  def down
  end
end
