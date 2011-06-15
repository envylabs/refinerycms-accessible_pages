require 'spec_helper'

describe 'Viewing form for user' do
  login_refinery_user
  let!(:page1) { Factory(:page) }
  let!(:page2) { Factory(:page) }
  let!(:user) { Factory(:user) }

  context 'as a regular admin' do
    before(:each) do
      visit edit_admin_user_path(user)
    end

    it 'sees all pages in the page dropdown' do
      within('#user_page_id') do
        page.should have_content(page1.title)
        page.should have_content(page2.title)
      end
    end

    context 'choosing value for accessible_page' do
      before(:each) do
        select page2.title, :from => 'user_page_id'
        click_on 'Save'
      end

      it 'sets the page on the user' do
        user.reload.accessible_page.page.should == page2
      end
    end
  end
end
