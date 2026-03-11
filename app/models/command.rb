# frozen_string_literal: true

class Command < ApplicationRecord
  belongs_to :event, counter_cache: true
  has_many :results, dependent: :destroy

  validates :name, presence: true
  validates :position, numericality: { greater_than_or_equal_to: 1 }, allow_nil: true
  validates :position_abs, numericality: { greater_than_or_equal_to: 1 }, allow_nil: true
  validates :places_category, numericality: { greater_than_or_equal_to: 1 }, allow_nil: true
  validates :places_overall, numericality: { greater_than_or_equal_to: 1 }, allow_nil: true
  validates :fractional_second, numericality: { only_integer: true, in: 0..99 }, allow_nil: true

  enum :kind, { plain: 0, tri: 1 }, default: 0, validate: { allow_nil: false }
  enum :category, { mf: 0, mm: 1, ff: 2 }, validate: { allow_nil: false }
  enum :status, { OK: 0, DNF: 1, DQ: 2 }, default: 0, validate: { allow_nil: false }

  before_validation :check_status

  def get_str_pos
    self.status == "OK" ? self.position : self.status
  end

  def get_str_pos_abs
    self.status == "OK" ? self.position_abs : self.status 
  end

  private

  def check_status
    if self.status != "OK" 
      self.position = nil 
      self.position_abs = nil
    end
  end
end