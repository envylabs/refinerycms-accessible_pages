Refinery::Application.routes.draw do
  resources :accessible_pages, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :accessible_pages, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
