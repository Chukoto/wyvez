require 'rails_helper'
describe PapaEvent do
  before do
    @papa_event = FactoryBot.build(:papa_event)
  end
  
  describe 'パパ活スケジュール' do
    context 'パパ活スケジュールの登録がうまくいく時' do
      it '次の4項目が全て正常に存在すれば登録できる→started_at, do_what_id, expected_reward, status_id' do
        expect(@papa_event).to be_valid
      end
    end
    
    context 'パパ活スケジュールの登録がうまくいかない時' do
      it 'started_atが空では登録できない' do
        @papa_event.started_at = nil
        @papa_event.valid?
        expect(@papa_event.errors.full_messages).to include "Started at can't be blank"
      end

      it 'do_what_idが0では登録できない' do
        @papa_event.do_what_id = 0
        @papa_event.valid?
        expect(@papa_event.errors.full_messages).to include "Do what must be other than 0"
      end

      it 'status_idが0では登録できない' do
        @papa_event.status_id = 0
        @papa_event.valid?
        expect(@papa_event.errors.full_messages).to include "Status must be other than 0"
      end

      it 'expected_rewardが空では登録できない' do
        @papa_event.expected_reward = nil
        @papa_event.valid?
        expect(@papa_event.errors.full_messages).to include "Expected reward can't be blank"
      end
    end
  end
end