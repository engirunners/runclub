# frozen_string_literal: true

class Result < ApplicationRecord
  belongs_to :athlete
  belongs_to :command

  validates :distance, numericality: { greater_than_or_equal_to: 0.1 }
  validates :stage, numericality: { greater_than_or_equal_to: 1 }, uniqueness: { scope: :command_id }
end
