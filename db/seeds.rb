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
    phone: '+79991234567',
    telegram_name: 'test_test',
    location: 'Kuzminki, Moscow',
    description: 'Test test test',
  )
  event = Event.create!(
    date: Date.yesterday,
    name: 'Relay on track',
    description: 'Test description',
  )
  Result.create!(
    event: event,
    athlete: athlete,
    distance: 3.2,
    position: 11,
    total_time: '00:10:33',
  )
end
