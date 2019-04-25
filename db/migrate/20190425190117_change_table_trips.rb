class ChangeTableTrips < ActiveRecord::Migration[5.2]
  def change
      add_column :trips, :frequency, :string, array: true, default: []
  end
end
