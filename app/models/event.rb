# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :commands, dependent: :destroy

  validates :name, :date, presence: true
end
