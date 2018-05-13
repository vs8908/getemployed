class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :jobs
  has_many :my_events, class_name: 'Event', foreign_key: :user_id
  has_many :event_participants
  has_many :events, through: :event_participants
  
end
