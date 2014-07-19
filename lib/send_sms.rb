require 'rubygems'
require 'twilio-ruby'

	def account_setup
		account_sid = 'AC2358c9ed4b14765f430187b231b86cbc'
		auth_token = '46b59c8e8dcdf512e41d8c260e9adae0'
		@client = Twilio::REST::Client.new account_sid, auth_token
	end

	def send_sms(phone_number, body)
		account_setup
		@client.account.messages.create(
		:from => '+441548312044',
	  :to => phone_number,
	 	:body => body)
	end