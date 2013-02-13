Spree::Admin::ReportsController.class_eval do

  before_filter :kludge_open 
  
  def kludge_open
    return if Spree::Admin::ReportsController::AVAILABLE_REPORTS.has_key?(:open_orders)
    Spree::Admin::ReportsController::AVAILABLE_REPORTS.merge!({ :open_orders => {:name => "Maksamatta", :description => "Maksamattomat tilaukset"}  })
  end

  def open_orders
    params[:q] = {} unless params[:q]
    params[:q][:meta_sort] = "number.asc"
    params[:q][:payment_state_eq] = "balance_due" unless params[:csv]
    if params[:csv]
      params[:q] = {} unless params[:q]

      if params[:q][:created_at_gt].blank?
        params[:q][:created_at_gt] = Time.zone.now.beginning_of_month
      else
        params[:q][:created_at_gt] = Time.zone.parse(params[:q][:created_at_gt]).beginning_of_day rescue Time.zone.now.beginning_of_month
      end

      if params[:q] && !params[:q][:created_at_lt].blank?
        params[:q][:created_at_lt] =
                                        Time.zone.parse(params[:q][:created_at_lt]).end_of_day rescue ""
      end

      if params[:q].delete(:completed_at_not_null) == "1"
        params[:q][:completed_at_not_null] = true
      else
        params[:q][:completed_at_not_null] = false
      end

      params[:q][:meta_sort] ||= "created_at desc"

      @search = Spree::Order.ransack(params[:q])
      @orders = @search.result(:uniq => true )
      @item_total = @orders.sum(:item_total)
      @adjustment_total = @orders.sum(:adjustment_total)
      @sales_total = @orders.sum(:total)
       ## obove copy paste should be rethought
      send_data( render_to_string( :csv , :layout => false) , :type => "application/csv" , :filename => "tilaukset.csv") 
      return
    end
    sales_total
  end
end

Spree::Order.class_eval do
  def kom val
    val = (val*100).to_i / 100.0
    val = val.to_s
    val.sub! "." , ","
    val
  end
  def alv14
    a14 = adjustments.detect { |a| a.label.index "14"}
    return 0.0 unless a14
    kom((a14.amount * 1.14 ) / 0.14) 
  end
  def alv24
    a24 = adjustments.detect { |a| a.label.index "24"}  
    return 0.0 unless a24
    kom( (a24.amount * 1.24 ) / 0.24 )
  end
end

