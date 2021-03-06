class Charge < ActiveRecord::Base
	belongs_to :customer

	validates :charge_type, :inclusion => {:in => ['successful', 'failed', 'disputed']}
end
