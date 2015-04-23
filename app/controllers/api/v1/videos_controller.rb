class Api::V1::VideosController < Api::BaseController
  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end
end
