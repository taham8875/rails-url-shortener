class LinksController < ApplicationController
  before_action :set_link, only: :show

  def index
    @links = Link.recent_first
  end

  def show
    redirect_to @link.original_url, allow_other_host: true
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to root_path
    else
      index
      render :index, status: :unprocessable_entity
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end

  def set_link
    @link = Link.where(short_code: params[:short_code]).first
  end
end
