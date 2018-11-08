class Blogger < ApplicationRecord

  has_many :posts

  validates :name, presence: true #unique name

  validates :age, numericality: {greater_than: 0, only_integer: true}

  validates :bio, length: {minimum: 31}

  def featured_post
    count = -1
    featured = nil
    self.posts.each do |post|
      if post.likes > count
        count = post.likes
        featured = post
      end
    end
    featured
  end

  def total_likes
    count = 0
    self.posts.each do |post|
      count += post.likes
    end
    count
  end

end
