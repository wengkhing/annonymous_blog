class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.belongs_to :post, null: false
      t.belongs_to :tag, null: false

      t.timestamps
    end
  end
end
