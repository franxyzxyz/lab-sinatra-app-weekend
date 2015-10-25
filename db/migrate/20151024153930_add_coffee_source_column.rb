class AddCoffeeSourceColumn < ActiveRecord::Migration
  def change
    add_column :brews, :beanSource, :string
  end
end
