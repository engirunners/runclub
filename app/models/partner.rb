# frozen_string_literal: true

class Partner < ApplicationRecord
  has_one_attached :logo do |attachable|
    attachable.variant :thumb, resize_to_fill: [200, 200], preprocessed: true
  end

  validates :name, :link, presence: true
  validates :logo, attached: true
end
