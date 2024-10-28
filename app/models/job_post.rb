class JobPost < ApplicationRecord
  
  belongs_to :created_by, class_name: 'User'

  has_many :applications, dependent: :destroy

  validates :title, presence: true

  validates :description, presence: true

end
