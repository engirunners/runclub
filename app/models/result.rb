# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :athlete
  belongs_to :command, counter_cache: true

  validates :distance, numericality: { greater_than_or_equal_to: 0.1 }
  validates :stage, numericality: { greater_than_or_equal_to: 1 }, uniqueness: { scope: :command_id }
  validates :fractional_second, numericality: { only_integer: true, in: 0..99 }, allow_nil: true
end
