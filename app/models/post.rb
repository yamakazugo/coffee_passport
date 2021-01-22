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

  validates :image, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :text, presence: true


  validates :flavor_id, numericality: { other_than: 1 } 
  validates :region_id, numericality: { other_than: 1 } 
  validates :body_id, numericality: { other_than: 1 } 
  validates :acidity_id, numericality: { other_than: 1 } 
  validates :processing_id, numericality: { other_than: 1 } 

  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

end
