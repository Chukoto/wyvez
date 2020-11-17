class Status < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '未完' },
    { id: 2, name: '保留' },
    { id: 3, name: '完了' }
  ]
end
