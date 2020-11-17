class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '健康・病気・病院' },
    { id: 2, name: 'コスメ・美容・整形' },
    { id: 3, name: 'ファッション' },
    { id: 4, name: '家族・友達' },
    { id: 5, name: '恋愛・結婚' },
    { id: 6, name: 'お仕事' },
    { id: 7, name: 'パパ活' },
    { id: 8, name: 'R-18' }
  ]
end
