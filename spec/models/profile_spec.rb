require 'rails_helper'
describe Profile do
  before do
    @profile = FactoryBot.build(:profile)
  end

  describe 'プロフィール' do
    context 'プロフィール作成がうまくいく時' do
      it '次の3項目が全て存在すれば作成できる→trans_exp_id, papa_exp_id, text' do
        expect(@profile).to be_valid
      end
    end

    context 'プロフィール作成がうまくいかない時' do
      it 'trans_exp_idが0では質問投稿できない' do
        @profile.trans_exp_id = 0
        @profile.valid?
        expect(@profile.errors.full_messages).to include "Trans exp must be other than 0"
      end

      it 'papa_exp_idが0では質問投稿できない' do
        @profile.papa_exp_id = 0
        @profile.valid?
        expect(@profile.errors.full_messages).to include "Papa exp must be other than 0"
      end

      it 'textが空では質問投稿できない' do
        @profile.text = nil
        @profile.valid?
        expect(@profile.errors.full_messages).to include "Text can't be blank"
      end
    end
  end
end