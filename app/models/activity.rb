class Activity < ApplicationRecord
  before_save :calculate_sweat

  private

  def calculate_sweat
    return if after_weight.blank?
    # byebug
    after_weights = %i(after_weight_with_water after_weight)
    return unless (changed_attributes.map{ |a| a.first.to_sym } & after_weights).any?

    if after_weight_with_water.blank?
      self.calculated_sweat = before_weight - after_weight

      return
    end

    bring_water = before_weight_with_water - before_weight
    bring_back_water = after_weight_with_water - after_weight
    sweat_from_water = before_weight_with_water - after_weight_with_water
    sweat_from_weight = before_weight - after_weight

    self.calculated_sweat = sweat_from_weight + bring_water - bring_back_water

    c = Calc.new(before_weight, before_weight_with_water, after_weight, after_weight_with_water)
    calculated_sweat = c.sweat
  end
end
