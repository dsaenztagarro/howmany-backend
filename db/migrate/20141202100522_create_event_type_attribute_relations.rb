class CreateEventTypeAttributeRelations < ActiveRecord::Migration
  def change
    create_table :event_type_attributes do |t|
      t.string :name
      t.string :value_type
      t.timestamps
    end

    create_table :event_type_attribute_relations do |t|
      t.belongs_to :event_type
      t.belongs_to :event_type_attribute
      t.timestamps
    end
  end
end
