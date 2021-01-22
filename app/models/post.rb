class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :flavor
  belongs_to :region
  belongs_to :body
  belongs_to :acidity
  belongs_to :processing
 
  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :text
  end

  with_options numericality: { other_than: 1, message: "Select" } do
    validates :flavor_id
    validates :region_id
    validates :body_id
    validates :acidity_id
    validates :processing_id
  end


  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

end
