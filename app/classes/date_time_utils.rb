class DateTimeUtils

  def self.parse_date(string, format = "%d.%m.%Y")
		DateTime.strptime(string, format) rescue nil
	end

  def self.get_date_in_timezone(datetime, timezone = ActiveSupport::TimeZone["UTC"])
		datetime.nil? ? nil : datetime.in_time_zone(timezone)
	end


	def self.formatted_date(datetime, timezone = ActiveSupport::TimeZone["UTC"])
		datetime = get_date_in_timezone(datetime, timezone)
		datetime.nil? ? "" : datetime.strftime('%d.%m.%Y')
	end

	def self.formatted_time(datetime, timezone = ActiveSupport::TimeZone["UTC"])
		datetime = get_date_in_timezone(datetime, timezone)
		datetime.nil? ? "" : datetime.strftime('%H:%M')
	end

  def self.formatted_date_time(datetime, timezone = ActiveSupport::TimeZone["UTC"])
		datetime = get_date_in_timezone(datetime, timezone)
		datetime.nil? ? "" : datetime.strftime('%d.%m.%Y %H:%M')
	end

	def self.start_of_day(datetime, timezone = ActiveSupport::TimeZone["UTC"])
		datetime.change(hour: 0, min: 0, sec: 0) - timezone.utc_offset.seconds
	end

	def self.end_of_day(datetime, timezone = ActiveSupport::TimeZone["UTC"])
		datetime = datetime.change(hour: 23, min: 59, sec: 59) - timezone.utc_offset.seconds
	end


	def self.start_of_time
		DateTime.new(1970, 1, 1)
	end

	def self.end_of_time
		DateTime.new(4000, 1, 1)
	end


	def self.datetime_to_timestamp(datetime)
		datetime.to_time.to_i
	end

	def self.datetime_from_timestamp(timestamp)
		Time.at(timestamp).to_datetime
	end
end
