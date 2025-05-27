class Confession < ApplicationRecord
  validates :body, presence: { message: "must not be empty, please write something!" }, length: { maximum: 500, message: "can have up to 500 characters only" }

  has_many :reactions, dependent: :destroy

  def reaction_count(type)
    reactions.where(reaction_type: type).count
  end

  def total_score
    reactions.count + ((Time.current - created_at) / 1.hour).to_i * -1
  end
end
