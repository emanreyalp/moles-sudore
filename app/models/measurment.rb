class Measurment < ApplicationRecord

  validates :weight, :type, :date, presence: true

  has_one :activity

  validate :correct_type

  private

  def correct_type
    return if %w(before before_w_w after after_w_w simple).include? correct_type

    fail UnexpectedMeasurmentType
  end
end

class UnexpectedMeasurmentType < StandardError; end
