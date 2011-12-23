class Patient < ActiveRecord::Base
  has_many :exams

  def self.of_today
    where("cast(started_at as date)=?",Date.today)
  end
end
