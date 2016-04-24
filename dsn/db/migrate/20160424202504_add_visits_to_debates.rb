class AddVisitsToDebates < ActiveRecord::Migration
  def change
    add_column :debates, :visits, :integer
  end
end
