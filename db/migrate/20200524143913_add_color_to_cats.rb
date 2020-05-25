class AddColorToCats < ActiveRecord::Migration[6.0]
  def change
    add_column :cats, :color, :string
  end
end
