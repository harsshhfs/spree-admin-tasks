# AdminTasks are Tasks for admin users. ToDo Notes, either for oneself or others
# They can have an order attached
# They just have a short text, the actual task, a due_at due date and a boolean for done?

module Spree
  class AdminTask < ActiveRecord::Base
    attr_accessible :user_id, :task , :due_at , :number ,:done

    belongs_to :user   # the one to whom this is assigned
    belongs_to :order    # the order that needs "doing" 


    validates :task, :presence => true
    validates :due_at, :presence => true
    
    def number
      return nil unless order
      order.number
    end
    def number= num
      order = Order.find_by_number(num)
      self.order_id = order.id
    end
  end
end