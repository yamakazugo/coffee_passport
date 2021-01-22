class Processing < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'WASHED(水洗式)' },
    { id: 3, name: 'SEMI-WASHED(半水洗式)' },
    { id: 5, name: 'その他' }
  ]


  include ActiveHash::Associations
  has_many :posts
end