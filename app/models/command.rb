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
  enum :status, { ok: 0, dnf: 1, dq: 2 }, default: 0, validate: { allow_nil: false }

  before_validation :check_status
  default_scope {order(:status , :position , :position_abs)}
  #default_scope {order(position: :desc, position_abs: :desc)}

  def position_to_s
    return format_position(position, status)
  end

  def position_abs_to_s
    return format_position(position_abs, status)
  end

  private

  def check_status
    if self.status != "OK" 
      self.position = nil 
      self.position_abs = nil
    end
  end

  def format_position(position,status)
    if status != "ok"
      return I18n.t "activerecord.attributes.command.statuses.#{status}"
    end
    return position
  end

end