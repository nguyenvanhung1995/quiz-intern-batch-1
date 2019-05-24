class AddResultToTests < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:tests, :result, 0)
  end
end
