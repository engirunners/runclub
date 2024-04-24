# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :athlete
  belongs_to :event

  validates :distance, numericality: { greater_than_or_equal_to: 0.1 }
  validates :stage, numericality: { greater_than_or_equal_to: 1 }, uniqueness: { scope: :event_id }
end
