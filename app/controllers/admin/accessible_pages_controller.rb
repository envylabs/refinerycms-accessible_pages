module Admin
  class AccessiblePagesController < Admin::BaseController

    crudify :accessible_page

    def index
      search_all_accessible_pages if searching?
      paginate_all_accessible_pages

      render :partial => 'accessible_pages' if request.xhr?
    end

  end
end
