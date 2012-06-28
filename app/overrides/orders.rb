Deface::Override.new(:virtual_path => "spree/admin/orders/show",
                     :name => "Adds task link to order page",
                     :insert_before => "[data-hook='admin_order_show_addresses'], #admin_order_show_addresses[data-hook]",
                     :partial => "spree/admin/admin_tasks/order_task_link",
                     :disabled => false)                     
                     #icons
Deface::Override.new(:virtual_path => "spree/admin/orders/index",
                     :name => "Little icin on order list",
                     :insert_top => "[data-hook='admin_orders_index_row_actions'], #admin_orders_index_row_actions[data-hook]",
                     :partial => "spree/admin/admin_tasks/order_icon_link",
                     :disabled => false)
