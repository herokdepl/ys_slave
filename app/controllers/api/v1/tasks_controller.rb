class Api::V1::TasksController < Api::BaseController
  def index
    @tasks = Task.all
  end

  def create
    Task.create_search!(params[:argument])
  end

  def destroy
    Task.find(params[:id]).destroy!
  end
end
