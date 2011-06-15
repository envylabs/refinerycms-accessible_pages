require 'spec_helper'

describe 'Viewing form for page' do
  login_refinery_user
  let!(:page1) { Factory(:page) }
  let!(:page2) { Factory(:page) }

  context 'as a regular admin' do
    before(:each) do
      visit new_admin_page_path
    end

    it 'is on the form page' do
      current_path.should == new_admin_page_path
    end

    it 'sees all pages in the parent_id dropdown' do
      within('#page_parent_id') do
        page.should have_content(page1.title)
        page.should have_content(page2.title)
      end
    end
  end

  context 'as a restricted admin' do
    before(:each) do
      Factory(:accessible_page, :user => @refinery_user, :page => page2)
      visit new_admin_page_path
    end

    it 'is on the form page' do
      current_path.should == new_admin_page_path
    end

    it 'sees accessible pages in the parent_id dropdown' do
      within('#page_parent_id') do
        page.should_not have_content(page1.title)
        page.should have_content(page2.title)
      end
    end
  end
end
