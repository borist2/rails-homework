namespace :db do
desc "Erase and fill database"
	task :populate => :environment do
		require 'populator'
		require 'faker'

		[Customer, Charge].each(&:delete_all)
		
		succ = [5, 3, 1, 1]
		fail = [0, 0, 3, 2]
		disp = [3, 2, 0, 0]
		i = 0
		Customer.populate 4 do |customer|
			customer.firstName = Faker::Name.first_name
			customer.lastName = Faker::Name.last_name

			Charge.populate succ[i] do |charge|
				charge.created = 2.years.ago..Time.now
				charge.paid = [true, false].sample
				charge.amount = Faker::Number.number(rand(10))
				charge.currency = 'eur'
				charge.refunded = [true, false].sample
				charge.customer_id = customer.id
				charge.charge_type = "successful"
			end

			Charge.populate fail[i] do |charge|
				charge.created = 2.years.ago..Time.now
				charge.paid = [true, false].sample
				charge.amount = Faker::Number.number(rand(10))
				charge.currency = 'eur'
				charge.refunded = [true, false].sample
				charge.customer_id = customer.id
				charge.charge_type = "failed"
			end


			Charge.populate disp[i] do |charge|
				charge.created = 2.years.ago..Time.now
				charge.paid = [true, false].sample
				charge.amount = Faker::Number.number(rand(10))
				charge.currency = 'eur'
				charge.refunded = [true, false].sample
				charge.customer_id = customer.id
				charge.charge_type = "disputed"
			end

			i = i + 1
		end
	end
end
