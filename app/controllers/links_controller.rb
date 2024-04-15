class LinksController < ApplicationController
  before_action :set_link, only: [:show, :show_details, :edit, :update, :destroy]

  def index
    @links = Link.recent_first
    @link ||= Link.new
  end

  def show
    @link.views.create!(
      ip_address: request.remote_ip,
      user_agent: request.user_agent
    )
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

  def edit
  end

  def update
    if @link.update(link_params)
      redirect_to link_path(@link.short_code), notice: "Link was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
    redirect_to root_path, notice: "Link was successfully destroyed."
  end

  def show_details
    @views = @link.views
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end

  def set_link
    @link = Link.where(short_code: params[:short_code]).first
    if @link.nil?
      render file: "#{Rails.root}/public/404.html", status: :not_found
    end
  end
end
