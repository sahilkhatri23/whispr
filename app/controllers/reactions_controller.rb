class ReactionsController < ApplicationController
  def create
    @confession = Confession.find(params[:confession_id])
    existing = Reaction.where(confession: @confession, ip: request.remote_ip)

    if existing.exists?
      redirect_to confessions_path, alert: "You already reacted to this confession."
    else
      @reaction = @confession.reactions.create(
        reaction_type: params[:reaction_type],
        ip: request.remote_ip
      )

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to confessions_path }
      end
    end
  end
end
