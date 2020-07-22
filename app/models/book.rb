class Book < ApplicationRecord

  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
# ---いいね機能---
  def favorited_by?(user)
   favorites.where(user_id: user.id).exists?
  end

# ---検索機能---
  def self.search(search,word)
    if search == "forward_match"
       Book.where(["title LIKE?", "#{word}%"])
    elsif search == "backward_match"
       Book.where(["title LIKE?", "%#{word}"])
    elsif search == "perfect_match"
       Book.where(["title LIKE?", "#{word}"])
    elsif search == "partial_match"
       Book.where(["title LIKE?", "%#{word}%"])
    else
       Book.all
    end
  end
end
