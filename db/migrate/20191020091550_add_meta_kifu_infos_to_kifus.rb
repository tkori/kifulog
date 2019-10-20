class AddMetaKifuInfosToKifus < ActiveRecord::Migration[5.2]
  def change
    add_column :kifus, :sente, :string
    add_column :kifus, :gote, :string
    add_column :kifus, :place, :string
    add_column :kifus, :date, :string
    add_column :kifus, :description, :text
  end
end
