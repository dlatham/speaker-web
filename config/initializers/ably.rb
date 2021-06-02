# This starts up the service for listening to events from
# Ably Realtime

Thread.new do

	EventMachine.run do

		client = Ably::Realtime.new(key: Rails.application.credentials.ably[:key])
		puts "Ably started..."

		channel = client.channels.get('devices')
		channel.subscribe do |message|
			puts "Received message..."
			puts message.name
			puts message.data

			device = Device.find_by(mac: message.name)
			device.last_seen_at = Time.now
			device.save!
		end

	end

end