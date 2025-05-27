class ConfessionsController < ApplicationController
  def index
    @confessions = Confession.order(created_at: :desc).limit(50)
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
        format.turbo_stream { render turbo_stream: turbo_stream.replace("modal", partial: "form", locals: { confession: @confession }) }
        format.html { render :new }
      end
    end
  end

  private

  def confession_params
    params.require(:confession).permit(:body)
  end
end