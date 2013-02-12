class RemoveSource < ActiveRecord::Migration
  def self.up
    rename_column :spree_admin_tasks, :source_id, :order_id
    remove_column :spree_admin_tasks, :source_type
  end

  def self.down
  end
end
