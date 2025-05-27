class ConfessionsController < ApplicationController
  def index
    @confessions = Confession.includes(:reactions).order(created_at: :desc).page(params[:page]).per(15)
  end

  def new
    @confession = Confession.new
  end

  def create
    @confession = Confession.new(confession_params)

    if @confession.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to confessions_path, notice: "Confession created!" }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def confession_params
    params.require(:confession).permit(:body)
  end
end