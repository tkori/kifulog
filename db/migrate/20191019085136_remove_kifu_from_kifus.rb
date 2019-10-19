class RemoveKifuFromKifus < ActiveRecord::Migration[5.2]
  def change
    remove_column :kifus, :kifu, :string
  end
end
