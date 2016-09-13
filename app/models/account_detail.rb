# == Schema Information
#
# Table name: account_details
#
#  id         :integer          not null, primary key
#  IBAN       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AccountDetail < ActiveRecord::Base
end
