class Region < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'MULTI-REGION(マルチリージョン)' },
    { id: 3, name: 'LATIN AMERICA(ラテンアメリカ)' },
    { id: 4, name: 'AFRICA(アフリカ)' },
    { id: 5, name: 'ASIA/PACIFIC(アジア/太平洋)' },
    { id: 6, name: 'その他' }
  ]


  include ActiveHash::Associations
  has_many :posts
end