Deface::Override.new(:virtual_path => "admin/products/_form",
                     :name => "Adds task link  to product page",
                     :insert_before => "[data-hook='admin_product_form_right'], #admin_product_form_right[data-hook]",
                     :partial => "admin/admin_tasks/product_task_link",
                     :disabled => false)

Deface::Override.new(:virtual_path => "admin/orders/show",
                     :name => "Adds task link to order page",
                     :insert_before => "[data-hook='admin_order_show_addresses'], #admin_order_show_addresses[data-hook]",
                     :partial => "admin/admin_tasks/order_task_link",
                     :disabled => false)
Deface::Override.new(:virtual_path => "layouts/admin",
                     :name => "Adds admin tasks",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text => " <%= tab :admin_tasks %>",
                     :disabled => false)
                     
                     #icons
Deface::Override.new(:virtual_path => "admin/orders/index",
                     :name => "Little icin on order list",
                     :insert_top => "[data-hook='admin_orders_index_row_actions'], #admin_orders_index_row_actions[data-hook]",
                     :partial => "admin/admin_tasks/order_icon_link",
                     :disabled => false)

Deface::Override.new(:virtual_path => "admin/products/index",
                     :name => "little icon on product list",
                     :insert_after => "[data-hook='admin_products_index_row_actions'], #admin_products_index_row_actions[data-hook]",
                     :partial => "admin/admin_tasks/product_icon_link",
                     :disabled => false)

