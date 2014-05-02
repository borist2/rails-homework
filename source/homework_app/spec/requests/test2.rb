require 'spec_helper'

describe "Charges page" do

    
	it "have number of items in lists" do
		succ = [5, 3, 1, 1]
		fail = [0, 0, 3, 2]
		disp = [3, 2, 0, 0]
		for i in 0..3 do
			user = FactoryGirl.create(:customer)
			for j in 0..fail[i]-1 do
				charge = FactoryGirl.create(:charge, customer_id: user.id, charge_type: 'failed')
			end

			for j in 0..succ[i]-1 do
				charge = FactoryGirl.create(:charge, customer_id: user.id, charge_type: 'successful')
			end

			for j in 0..disp[i]-1 do
				charge = FactoryGirl.create(:charge, customer_id: user.id, charge_type: 'disputed')
			end
		end

		visit 'charges'
		
		expect(page).to have_selector('#successfulTable > tbody > tr', count: 10)
		expect(page).to have_selector('#disputedTable > tbody > tr', count: 5)
		expect(page).to have_selector('#failedTable > tbody > tr', count: 5)
	 
  end


end
