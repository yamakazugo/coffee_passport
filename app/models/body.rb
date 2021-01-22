class Body < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'LIGHT(軽い)' },
    { id: 3, name: 'MEDIUM(ほどよい)' },
    { id: 4, name: 'FULL(しっかり)' },
    { id: 5, name: 'その他' }
  ]


  include ActiveHash::Associations
  has_many :posts
end