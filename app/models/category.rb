class Category < ActiveHash::Base
  self.data = [
    { id: 1, category: "レディース" },
    { id: 2, category:   "メンズ"   },
  ] 
end