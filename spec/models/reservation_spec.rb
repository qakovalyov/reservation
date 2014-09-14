require 'rails_helper'

describe Reservation do
  before do
  create :reservation, start_time: Time.new(2014, 10, 31, 5, 0, 0, "+00:00") ,end_time: Time.new(2014, 10, 31, 5, 20, 0, "+00:00")
  end
  it do
    expect(Reservation.new(table_id: 1, start_time: Time.new(2014, 10, 31, 4, 0, 0, "+00:00"), end_time: Time.new(2014, 10, 31, 5, 0, 0, "+00:00")).valid?).to be true
  end
  it do
    expect(Reservation.new(table_id: 1, start_time: Time.new(2014, 10, 31, 5, 20, 0, "+00:00"), end_time: Time.new(2014, 10, 31, 6, 0, 0, "+00:00")).valid?).to be true
  end
  it do
    expect(Reservation.new(table_id: 1, start_time: Time.new(2014, 10, 31, 4, 0, 0, "+00:00"), end_time: Time.new(2014, 10, 31, 5, 10, 0, "+00:00")).valid?).to be false
  end
  it do
    expect(Reservation.new(table_id: 1, start_time: Time.new(2014, 10, 31, 5, 0, 0, "+00:00"), end_time: Time.new(2014, 10, 31, 5, 20, 0, "+00:00")).valid?).to be false
  end
  it do
    expect(Reservation.new(table_id: 1, start_time: Time.new(2014, 10, 31, 5, 10, 0, "+00:00"), end_time: Time.new(2014, 10, 31, 5, 20, 0, "+00:00")).valid?).to be false
  end
  it do
    expect(Reservation.new(table_id: 1, start_time: Time.new(2014, 10, 31, 4, 0, 0, "+00:00"), end_time: Time.new(2014, 10, 31, 5, 30, 0, "+00:00")).valid?).to be false
  end
  it do
    expect(Reservation.new(table_id: 1, start_time: Time.new(2014, 10, 31, 5, 0, 0, "+00:00"), end_time: Time.new(2014, 10, 31, 5, 30, 0, "+00:00")).valid?).to be false
  end
  it do
    expect(Reservation.new(table_id: 1, start_time: Time.new(2014, 10, 31, 5, 0, 0, "+00:00"), end_time: Time.new(2014, 10, 31, 5, 45, 0, "+00:00")).valid?).to be false
  end
  it do
    expect(Reservation.new(table_id: 1, start_time: Time.new(2014, 10, 31, 4, 0, 0, "+00:00"), end_time: Time.new(2014, 10, 31, 5, 50, 0, "+00:00")).valid?).to be false
  end
  it do
    expect(Reservation.new(table_id: 1, start_time: Time.new(2014, 10, 31, 5, 10, 0, "+00:00"), end_time: Time.new(2014, 10, 31, 5, 30, 0, "+00:00")).valid?).to be false
  end
  it do
    expect(Reservation.new(table_id: 1, start_time: Time.new(2014, 10, 31, 5, 10, 0, "+00:00"), end_time: Time.new(2014, 10, 31, 5, 50, 0, "+00:00")).valid?).to be false
  end
end