Deface::Override.new(:virtual_path => "spree/admin/products/_form",
                     :name => "Adds task link  to product page",
                     :insert_before => "[data-hook='admin_product_form_right'], #admin_product_form_right[data-hook]",
                     :partial => "spree/admin/admin_tasks/product_task_link",
                     :disabled => false)

Deface::Override.new(:virtual_path => "spree/admin/products/index",
                     :name => "little icon on product list",
                     :insert_after => "[data-hook='admin_products_index_row_actions'], #admin_products_index_row_actions[data-hook]",
                     :partial => "spree/admin/admin_tasks/product_icon_link",
                     :disabled => false)

