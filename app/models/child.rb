class Child < ActiveHash::Base
  self.data = [
    { id: 0,  name: '---' },
    { id: 1,  name: '0人'    },
    { id: 2,  name: '1人'    },
    { id: 3,  name: '2人'    },
    { id: 4,  name: '3人'    },
    { id: 5,  name: '4人'    },
    { id: 6,  name: '5人以上' }
  ]
end
