class CreateBrewTable < ActiveRecord::Migration
  def change
    create_table :brews do |t|
      t.string :beanName
      t.string :beanType
      t.decimal :beanweight
      t.string :method
      t.integer :bloomTime
      t.boolean :continousPour
      t.integer :rating
      t.decimal :weight
      t.timestamps
    end
  end
end
