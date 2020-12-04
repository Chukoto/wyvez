require 'rails_helper'
describe Question do
  before do
    @question = FactoryBot.build(:question)
  end

  describe '質問投稿' do
    context '質問投稿がうまくいく時' do
      it '次の3項目が全て存在すれば登録できる→category_id, title, text' do
        expect(@question).to be_valid
      end
    end

    context '質問投稿がうまくいかない時' do
      it 'category_idが0では質問投稿できない' do
        @question.category_id = 0
        @question.valid?
        expect(@question.errors.full_messages).to include "Category must be other than 0"
      end
      
      it 'titleが空では質問投稿できない' do
        @question.title = nil
        @question.valid?
        expect(@question.errors.full_messages).to include "Title can't be blank"
      end

      it 'textが空では質問投稿できない' do
        @question.text = nil
        @question.valid?
        expect(@question.errors.full_messages).to include "Text can't be blank"
      end
    end
  end
end