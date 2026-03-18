# frozen_string_literal: true

class Command < ApplicationRecord
  belongs_to :event, counter_cache: true
  has_many :results, dependent: :destroy

  validates :name, presence: true
  validates :position, :position_abs, absence: true, unless: :ok?
  validates :position, :position_abs, :places_category, :places_overall, 
            numericality: { greater_than_or_equal_to: 1 }, allow_nil: true
  validates :fractional_second, numericality: { only_integer: true, in: 0..99 }, allow_nil: true

  enum :category, { mf: 0, mm: 1, ff: 2 }, validate: { allow_nil: false }
  enum :status, { ok: 0, dnf: 1, dq: 2 }, default: 0, validate: { allow_nil: false }

  def position_to_s
    return format_position(position, status, true)
  end

  # Never used
  #def position_abs_to_s
  #  return format_position(position_abs, status, false)
  #end

  private

  def format_position(position, status, colorize=true)
    if status != "ok"
      return I18n.t "activerecord.attributes.command.statuses.#{status}"
    elsif position<4 && colorize
      colors = ['#ffad00', '#C0C0C0', '#CD7F32']
      return ('<span class="circle_highlight" style="background-color:'+colors[position-1]+'">'+position.to_s+'</span>').html_safe
    end
    return  position  
  end

end