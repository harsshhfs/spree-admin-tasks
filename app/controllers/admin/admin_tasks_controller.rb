class Admin::AdminTasksController < Admin::BaseController
  resource_controller
  
  before_filter :load 
  update.wants.html { redirect_to collection_url }
  create.wants.html { redirect_to collection_url }


  def done
    task = AdminTask.find(params[:id])
    return unless task
    task.done = true
    task.save
    flash.notice = t('task_updated')
    redirect_to :back
  end

  private
  def load
    @admins = Role.find_by_name("admin").users
    search = AdminTask.order("due_at")
    if params[:all]
      @tasks = search.all
    else
      @tasks = search.find_all_by_user_id(current_user.id)
    end
  end
end

