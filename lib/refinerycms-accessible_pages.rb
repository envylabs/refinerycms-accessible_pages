require 'refinerycms'

module Refinery
  module AccessiblePages

    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "accessible_pages"
          plugin.activity = {:class => AccessiblePage}
        end
      end

      refinery.after_inclusion do
        ::User.class_eval do
          has_one :accessible_page
          has_one :page, :through => :accessible_page

          attr_accessible :page_id

          def page_id
            self.accessible_page.try(:id)
          end

          def page_id=(id)
            page = Page.find id
            update_attribute(:page, page)
          end
        end

        ::Admin::PagesController.class_eval do
          def find_all_pages(conditions = {})
            if current_user.accessible_page.present?
              conditions.reverse_merge!(:id => current_user.accessible_page.page_id)
            else
              conditions.reverse_merge!(:parent_id => nil)
            end
            @pages = Page.where(conditions).includes([:slugs, :translations, :children]).order("lft ASC")
          end
        end
      end
    end
  end
end
