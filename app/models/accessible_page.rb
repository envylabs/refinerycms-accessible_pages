class AccessiblePage < ActiveRecord::Base

  belongs_to :page
  belongs_to :user

  # def title was created automatically because you didn't specify a string field
  # when you ran the refinery_engine generator. Love, Refinery CMS.
  def title
    "Override def title in vendor/engines/accessible_pages/app/models/accessible_page.rb"
  end
  
end
