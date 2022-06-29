require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe '#calculate_sweat' do
    context 'when do not bring water' do
      let(:activity) { create(:activity) }

      it 'return with 0' do
        expect(activity.calculated_sweat).to eq(0)
      end
    end

    context 'when dont have data with water after the activity' do
      let(:difference) { 2 }
      let(:activity) do
        base_weight = 80

        create(:activity,
          before_weight: base_weight,
          after_weight: base_weight - difference)
      end

      it 'calculate only from the weight' do
        expect(activity.calculated_sweat).to eq(difference)
      end
    end

    context 'when bring water and did not bring back' do
      context 'and did not loose weight' do
        let(:activity) { create(:activity, :dont_bring_back_water) }

        it 'return the carried water' do
          expect(activity.calculated_sweat).to eq(2)
        end
      end

      context 'and loose weight' do
        let(:lost_weight) { 2 }
        let(:bring_water) { 3 }
        let(:activity) do
          base_weight = 80

          create(:activity,
            before_weight: base_weight,
            after_weight: base_weight - lost_weight,
            before_weight_with_water: base_weight + bring_water,
            after_weight_with_water: base_weight)
        end

        it 'return with the lost weight plus the water' do
          expect(activity.calculated_sweat).to eq(lost_weight + bring_water)
        end
      end
    end

  end
end
