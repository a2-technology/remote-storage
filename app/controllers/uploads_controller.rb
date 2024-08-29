class UploadsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
   @uploads = user_signed_in? ? Upload.all : Upload.published
  end

  def show
    @upload = Upload.published.find(params[:id])

    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    if @upload.save
      redirect_to @upload
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def upload_params
      params.require(:upload).permit(:user_id, :content, :published_at)
    end
end