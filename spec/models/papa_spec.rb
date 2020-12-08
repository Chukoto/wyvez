require 'rails_helper'
describe Papa do
  before do
    @papa = FactoryBot.build(:papa)
  end

  describe 'パパ登録' do
    context 'パパ登録がうまくいく時' do
      it '次の5項目が全て存在すれば登録できる→name, age_id, marriage_id, child_id, app_name' do
        expect(@papa).to be_valid
      end
    end

    context 'パパ登録がうまくいかない時' do
      it 'nameが空では登録できない' do
        @papa.name = nil
        @papa.valid?
        expect(@papa.errors.full_messages).to include "Name can't be blank"
      end

      it 'age_idが0では登録できない' do
        @papa.age_id = 0
        @papa.valid?
        expect(@papa.errors.full_messages).to include "Age must be other than 0"
      end

      it 'marriage_idが0では登録できない' do
        @papa.marriage_id = 0
        @papa.valid?
        expect(@papa.errors.full_messages).to include "Marriage must be other than 0"
      end

      it 'child_idが0では登録できない' do
        @papa.child_id = 0
        @papa.valid?
        expect(@papa.errors.full_messages).to include "Child must be other than 0"
      end

      it 'app_nameが空では登録できない' do
        @papa.app_name = nil
        @papa.valid?
        expect(@papa.errors.full_messages).to include "App name can't be blank"
      end

      it 'app_nameが40文字以上では登録できない' do
        @papa.app_name = "12345678901234567890123456789012345678901"
        @papa.valid?
        expect(@papa.errors.full_messages).to include "App name is too long (maximum is 40 characters)"
      end
    end
  end
end
