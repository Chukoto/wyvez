require 'rails_helper'
describe BeautyEvent do
  before do
    @beauty_event = FactoryBot.build(:beauty_event)
  end

  describe '美容スケジュール' do
    context '美容スケジュールの登録がうまくいく時' do
      it '次の3項目が全て正常に存在すれば登録できる→beauty_cate_id, started_at, status_id' do
        expect(@beauty_event).to be_valid
      end
    end

    context '美容スケジュールの登録がうまくいかない時' do
      it 'beauty_cate_idが0では登録できない' do
        @beauty_event.beauty_cate_id = 0
        @beauty_event.valid?
        expect(@beauty_event.errors.full_messages).to include "Beauty cate must be other than 0"
      end

      it 'started_atが空では登録できない' do
        @beauty_event.started_at = nil
        @beauty_event.valid?
        expect(@beauty_event.errors.full_messages).to include "Started at can't be blank"
      end

      it 'status_idが0では登録できない' do
        @beauty_event.status_id = 0
        @beauty_event.valid?
        expect(@beauty_event.errors.full_messages).to include "Status must be other than 0"
      end
    end
  end
end
