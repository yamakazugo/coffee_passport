class Flavor < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'CRISP(さわやかな)' },
    { id: 3, name: 'CITORUS(シトラス)' },
    { id: 4, name: 'MELLOW(やわらかな)' },
    { id: 5, name: 'SOFT(穏やかな)' },
    { id: 6, name: 'BRIGHT(鮮やかな)' },
    { id: 7, name: 'TANGY(はじける)' },
    { id: 8, name: 'JUICY(ジューシーな)' },
    { id: 9, name: 'COMPLEX(複雑な)' },
    { id: 10, name: 'SMOOTH(なめらかな)' },
    { id: 11, name: 'BALANCED(バランスのよい)' },
    { id: 12, name: 'COCOA(ココアのような)' },
    { id: 13, name: 'SUBTLE SPICE(かすかなスパイス感)' },
    { id: 14, name: 'DARK COCOA(ダークココア)' },
    { id: 15, name: 'RICH(豊かな)' },
    { id: 16, name: 'LIVELY(いきいきとした)' },
    { id: 17, name: 'NUTTY(ナッツのような)' },
    { id: 18, name: 'HEARTY(心温まる)' },
    { id: 19, name: 'WELL-ROUNDED(まろやかな)' },
    { id: 20, name: 'EARTHY(大地を思わせる)' },
    { id: 21, name: 'HERBAL(ハーブを思わせる)' },
    { id: 22, name: 'ROASTY SWEET(ロースト感のある甘み)' },
    { id: 23, name: 'CARAMELLY(キャラメルのような)' },
    { id: 24, name: 'ROASTY(ロースト感のある)' },
    { id: 25, name: 'SWEET(甘い)' },
    { id: 26, name: 'INTENCE(力強い)' },
    { id: 27, name: 'SMOKY(スモーキー)' },
    { id: 28, name: 'その他' }
  ]


  include ActiveHash::Associations
  has_many :posts
  end