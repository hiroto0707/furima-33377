class Category < ActiveHash::Base
  self.data = [
    { id: 0, category: " -------- " },
    { id: 1, category: "レディース" },
    { id: 2, category:   "メンズ"   },
    { id: 3, category:   "キッズ・ベイビー"   },
    { id: 4, category:   "トップス"   },
    { id: 5, category:   "パンツ"   }
    
  ] 

  include ActiveHash::Associations
  has_many :items
end