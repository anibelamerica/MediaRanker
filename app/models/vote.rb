class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :work

  validates :work_id, uniqueness: {scope: :user_id, :message => "User has already voted for this work"}

end
