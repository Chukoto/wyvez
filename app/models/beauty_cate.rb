class BeautyCate < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '性別適合手術' },
    { id: 2, name: 'ホルモン注射' },
    { id: 3, name: '美容クリニック' },
    { id: 4, name: 'ヘアサロン' },
    { id: 5, name: 'ネイルサロン' },
    { id: 6, name: 'エステサロン' }
  ]
end
