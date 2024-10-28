class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :job_posts, foreign_key: 'created_by_id', dependent: :destroy

  has_many :applications, dependent: :destroy

  
  has_one_attached :profile_picture 

  validates :name, presence: true
  validates :phone, presence: true

  ROLES = %w[admin user].freeze



end
