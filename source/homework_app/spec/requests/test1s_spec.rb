require_relative '../spec_helper'

describe "Test1:" do
  describe "Failed list:" do
    it "should have failed list title" do
     	visit 'charges'
      	expect(page).to have_content('Failed charges')
    end
  end

describe "Disputed list:" do
    it "should have disputed list title" do
     	visit 'charges'
      	expect(page).to have_content('Disputed charges')
    end
  end

describe "Successful list:" do
    it "should have successful list title" do
     	visit 'charges'
      	expect(page).to have_content('Successful charges')
    end
  end
end
