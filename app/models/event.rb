# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :commands, dependent: :destroy
end
