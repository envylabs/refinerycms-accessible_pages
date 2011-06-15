require 'spec_helper'

describe AccessiblePage do
  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:page) }
  end
end
