class UploadsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_upload, except: [:index, :new, :create,]

  def index
   @uploads = user_signed_in? ? Upload.all : Upload.published
  end

  def show
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

  def edit
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end

  def update
    if @upload.update(upload_params)
      redirect_to @upload
    else
      render :edit, status: unprocessable_entity
    end
  end

  def destroy
    @upload.destroy
    redirect_to root_path
  end

  private
    def upload_params
      params.require(:upload).permit(:user_id, :content, :published_at)
    end

    def set_upload
      @upload = Upload.find(params[:id])
    end
end