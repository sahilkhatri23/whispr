class ReactionsController < ApplicationController
  def create
    @confession = Confession.find(params[:confession_id])
    reaction_type = params[:reaction_type]

    existing_reaction = Reaction.find_by(confession: @confession, ip: request.remote_ip)
    return if existing_reaction.present?

    @reaction = @confession.reactions.create(reaction_type: reaction_type, ip: request.remote_ip)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to confessions_path }
    end
  end
end
