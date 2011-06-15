Factory.define :accessible_page do |f|
  f.association :page
  f.association :user
end

Factory.define :page do |f|
  f.sequence(:title) { |n| "Page #{n} Title" }
end

Factory.define :user do |u|
  u.sequence(:username) { |n| "person#{n}" }
  u.sequence(:email) { |n| "person#{n}@example.com" }
  u.password  "greenandjuicy"
  u.password_confirmation "greenandjuicy"
end

Factory.define :refinery_user, :parent => :user do |u|
  u.roles { [ Factory(:refinery_role) ] }

  u.after_create do |user|
    Refinery::Plugins.registered.each_with_index do |plugin, index|
      user.plugins.create(:name => plugin.name, :position => index)
    end
  end
end

Factory.define :role do |f|
end

Factory.define :refinery_role, :parent => :role do |f|
  f.title 'Refinery'
end
