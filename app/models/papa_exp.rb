class PapaExp < ActiveHash::Base
  self.data = [
    { id: 0,  name: '---' },
    { id: 1,  name: '未経験' },
    { id: 2,  name: '0〜3年未満' },
    { id: 3,  name: '3〜5年' },
    { id: 4,  name: '5〜10年' },
    { id: 5,  name: '10年以上' }
  ]
end
