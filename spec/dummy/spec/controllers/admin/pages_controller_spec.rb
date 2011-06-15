require 'spec_helper'

describe Admin::PagesController do
  context 'GET index' do
    login_refinery_user
    let!(:page1) { Factory(:page) }
    let!(:page2) { Factory(:page) }

    context 'as a regular admin' do
      before(:each) do
        get :index
      end

      it 'returns all top level pages' do
        should assign_to(:pages).with([page1, page2])
      end
    end

    context 'as a restricted admin user' do
      before(:each) do
        Factory(:accessible_page, :user => @refinery_user, :page => page2)
        get :index
      end

      it 'returns only accessible page' do
        should assign_to(:pages).with([page2])
      end
    end
  end
end
