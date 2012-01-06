class Patient < ActiveRecord::Base
  has_many :exams

  def self.hours_ago(hours=nil)
    if hours.nil?
      where(:started_at => (Time.now.midnight)..Time.now )
    else
      where(:started_at => ( Time.now - hours.to_i.hours)..Time.now )
    end
  end

  def self.of_today
    self.hours_ago
  end
end
