# frozen_string_literal: true

class Partner < ApplicationRecord
  has_one_attached :logo do |attachable|
    attachable.variant :thumb, resize_to_limit: [400, 200]
    attachable.variant :web, resize_to_limit: [600, 300]
  end

  validates :name, :link, presence: true
  validates :logo, attached: true
end
