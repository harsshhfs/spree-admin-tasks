module Spree::Admin::AdminTasksHelper

  def order_link task
    return " " unless task.order_id
    link_to( "#{task.order.number if task.order} (#{task.order.total})" , admin_order_url(task.order)) 
  end
  
  def done_link admin_task
    if admin_task.done 
      I18n.t('done') 
    else
      link_to I18n.t('to_do') , done_admin_admin_task_url(admin_task)
    end
  end
  
  def self.find_task(object)
    return unless object
    task = Spree::AdminTask.find_by_order_id(object.id )
  end
  
end
