Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :admin_tasks do
      member do
        get :done
      end
    end
  end
  match '/admin/reports/open_orders' => 'admin/reports#open_orders' , 
                      :as => "open_orders_admin_reports",  :via  => [:get, :post]

end

