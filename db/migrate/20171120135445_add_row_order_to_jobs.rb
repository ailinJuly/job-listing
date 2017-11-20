class AddRowOrderToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs,:row_order,:integer
    Job.find_each do |job|
      job.update( :row_order_position => :last)
    end

    add_index :jobs,:row_order

    end
end
