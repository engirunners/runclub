# frozen_string_literal: true

class Photo < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize_to_limit: [150, 100], preprocessed: true
    attachable.variant :web, resize_to_limit: [600, 400], preprocessed: true
  end

  validates :image, attached: true
end
