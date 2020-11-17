class DoWhat < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '食事' },
    { id: 2, name: 'ドライブ' },
    { id: 3, name: 'ショッピング' },
    { id: 4, name: '旅行' },
    { id: 5, name: 'おうち' },
    { id: 6, name: 'その他' }
  ]
end
