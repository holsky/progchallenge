require 'store'

class ReservationService

  def initialize
    @store = Store.new

  end

  def reserve(num_seats)
    new_seats = seats

    num_seats.times do |i|
      new_seats << (new_seats.last.to_i + 1)
    end

    @store.write(seats)
  end

  def list_reserved
    seats
  end

  def reset
    @store.reset
  end

  private
  def seats
    @store.read
  end
end
