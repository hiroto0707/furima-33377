class Category < ActiveHash::Base
  self.data = [
    { id: 0, category: " ------------------------ " },
    { id: 1, category:   "レディース"               },
    { id: 2, category:   "メンズ"                   },
    { id: 3, category:   "キッズ・ベビー"           },
    { id: 4, category:   "インテリア・住まい・小物" },
    { id: 6, category:   "本・音楽・ゲーム"         },
    { id: 7, category:   "おもちゃ・グッツ"         },
    { id: 8, category:   "家電・スマホ・カメラ"     },
    { id: 9, category:   "スポーツ・レジャー"       },
    { id: 10, category:  "その他"                   }
  ]  

  include ActiveHash::Associations
  has_many :items
  
end