class Marriage < ActiveHash::Base
  self.data = [
    { id: 0,  name: '---' },
    { id: 1,  name: '未婚' },
    { id: 2,  name: '既婚' }
  ]
end
