require 'spec_helper'

describe User do
  context 'associations' do
    it { should have_one(:accessible_page) }
  end
end
