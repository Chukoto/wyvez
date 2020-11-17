class Age < ActiveHash::Base
  self.data = [
    { id: 0,   name: '---' },
    { id: 1,   name: '20歳〜24歳' },
    { id: 2,   name: '25歳〜29歳' },
    { id: 3,   name: '30歳〜34歳' },
    { id: 4,   name: '35歳〜39歳' },
    { id: 5,   name: '40歳〜44歳' },
    { id: 6,   name: '45歳〜49歳' },
    { id: 7,   name: '50歳〜54歳' },
    { id: 8,   name: '55歳〜59歳' },
    { id: 9,   name: '55歳〜59歳' },
    { id: 10,  name: '60歳以上' }
  ]
end
