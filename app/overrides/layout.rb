Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "Adds admin tasks to layout (tab)",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text => " <%= tab :admin_tasks %>",
                     :disabled => false)
