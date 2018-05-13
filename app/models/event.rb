class Event < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :user_id
  has_many :event_participants
  has_many :users, through: :event_participants
  scope :public_events, -> { where(public: true) }

  before_create :set_color

  def set_color
    self.color = 'red' if self.public
  end

  def start
    start_date.strftime("%D %H:%m")
  end

  def end
    end_date.strftime("%D %H:%m")
  end
end
