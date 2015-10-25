class DeleteUnncessaryColumns < ActiveRecord::Migration
  def change
    remove_column :brews, :continousPour
    remove_column :brews, :beanType
  end
end
