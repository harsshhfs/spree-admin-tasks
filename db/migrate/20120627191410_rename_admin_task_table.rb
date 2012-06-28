class RenameAdminTaskTable < ActiveRecord::Migration
  def change
    rename_table :admin_tasks,              :spree_admin_tasks
  end

end
