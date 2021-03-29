class Category < ActiveHash::Base
  self.data = [
    { id: 0, category: " -------- " },
    { id: 1, category: "レディース" },
    { id: 2, category:   "メンズ"   },
  ] 

  include ActiveHash::Associations
  has_many :items
end