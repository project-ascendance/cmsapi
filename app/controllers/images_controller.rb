class ImagesController < ApplicationController
  before_action :set_image, only: %i[ show update destroy ]
  # GET /news_articles/1
  def show
    if @image != nil
      send_data @image[:data], :type=>@image[:image_type], :filename => @image[:name]+".jpg", :disposition => 'attachment'
    else
      render nothing: true, status: 404
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def news_article_params
    params.require(:news_article).permit(:title, :body, :startDate, :endDate)
  end
end
