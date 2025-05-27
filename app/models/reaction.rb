class Reaction < ApplicationRecord
  belongs_to :confession

  validates :reaction_type, presence: true
  validates :ip, presence: true
  validates :confession_id, presence: true

  validates :ip, uniqueness: { scope: :confession_id, message: "Can only react once to this confession" }
end
