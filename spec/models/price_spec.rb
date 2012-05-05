require 'spec_helper'

describe Price do
  it 'should always have price' do
    price = Fabricate.build(:price, :value => nil)

    price.valid?.should be_false

    price.value = 13.13
    price.valid?.should be_true
  end
end
