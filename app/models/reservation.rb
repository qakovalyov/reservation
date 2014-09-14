class Reservation < ActiveRecord::Base
  validates_presence_of :end_time, :table_id
  validate :reservation_valid

  private

  def reservation_valid
    sql_where = <<-SQL
      (start_time > :start_time AND start_time < :end_time) OR
      (end_time > :start_time AND end_time < :end_time) OR
      (start_time < :start_time AND end_time >= :end_time) OR
      (start_time = :start_time AND end_time = :end_time)
    SQL
    reservations = self.class.where(table_id: self.table_id).where(sql_where, start_time: self.start_time, end_time: self.end_time)

    if reservations.present?
      errors.add(:table_id, "Can't make a reservation for Table ##{self.table_id}. Table already reserved.")
    end
  end
end
