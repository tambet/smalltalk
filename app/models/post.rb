class Post < ActiveRecord::Base
  belongs_to :user
  validates :body, :heading, :user, presence: true
end
