# frozen_string_literal: true

class AchievementsController < ApplicationController
  def index
    @achievements = Achievement.all
  end
end
