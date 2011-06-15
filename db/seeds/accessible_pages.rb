User.find(:all).each do |user|
  if user.plugins.find_by_name('accessible_pages').nil?
    user.plugins.create(:name => 'accessible_pages',
                        :position => (user.plugins.maximum(:position) || -1) +1)
  end
end

page = Page.create(
  :title => 'Accessible Pages',
  :link_url => '/accessible_pages',
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => '^/accessible_pages(\/|\/.+?|)$'
)
Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end
