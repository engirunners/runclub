# frozen_string_literal: true

if Rails.env.development?
  User.create!(
    email: 'test@test.com',
    password: '123456',
    password_confirmation: '123456',
  )
  athlete = Athlete.create!(
    first_name: 'Ura',
    last_name: 'Volodin',
    gender: :male,
  )
  event = Event.create!(
    date: Date.yesterday,
    name: 'Relay on track',
    total_time: '01:20:33',
    location: 'Kuzminki, Moscow',
    position: 2,
  )
  Result.create!(
    event: event,
    athlete: athlete,
    stage: 1,
    distance: 3.2,
    total_time: '00:10:33',
  )
end
