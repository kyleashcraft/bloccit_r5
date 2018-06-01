class VotesController < ApplicationController
  before_action :require_sign_in

  def up_vote
    update_vote(1)
    redirect_back(fallback_location: :root)
  end

  def down_vote
    update_vote(-1)
    redirect_back(fallback_location: :root)
  end

  private
  def update_vote(val)
    @post = Post.find(params[:post_id])
    @vote = @post.votes.where(user_id: current_user.id).first

    if @vote
      @vote.update_attribute(:value, val)
    else
      @vote = current_user.votes.create(value: val, post: @post)
    end
  end
end
