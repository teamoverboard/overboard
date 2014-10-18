class AddChannelToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :channel_id, :integer, :null => false
  end
end
