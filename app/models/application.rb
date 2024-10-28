class Application < ApplicationRecord

  belongs_to :user

  belongs_to :job_post

  validates :status, presence: true

  validates :user_id, presence: true
  validates :job_post_id, presence: true
  validates :status, presence: true

  
end
