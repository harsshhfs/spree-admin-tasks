module Spree
  class Admin::AdminTasksController < Spree::Admin::BaseController

  before_filter :load

  def new
    @task = AdminTask.new
  end
  def create
    @task = AdminTask.new(params[:admin_task])
    @task.save!
    redirect_to :action => :index
  end
  def edit
    @task = AdminTask.find(params[:id])
  end
  def show
    @task = AdminTask.find(params[:id])
    if params[:method] == "destroy"
      @task.destroy
      flash.notice = t('task_deleted')
      redirect_to :back
    else
      render "edit"
    end
  end
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
end
