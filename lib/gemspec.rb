#!/usr/bin/env ruby
require File.expand_path('../accessible_pages', __FILE__)
version = ::Refinery::AccessiblePages.version
raise "Could not get version so gemspec can not be built" if version.nil?

gemspec = <<EOF
Gem::Specification.new do |s|
  s.name              = %q{refinerycms-accessible_pages}
  s.version           = %q{#{version}}
  s.description       = %q{Engine to restrict admin page access for Refinery CMS.}
  s.date              = %q{#{Time.now.strftime('%Y-%m-%d')}}
  s.summary           = %q{Page access engine for Refinery CMS.}
  s.email             = %q{jacob@envylabs.com}
  s.homepage          = %q{http://envylabs.com}
  s.authors           = %w(Jacob\\ Swanner)
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'app/**/*', 'config/**/*', 'db/**/*']

  s.add_dependency    'refinerycms-authentication', '~> 1.0.0'
  s.add_dependency    'refinerycms-pages',          '~> 1.0.0'
end
EOF

File.open(File.expand_path("../../refinerycms-accessible_pages.gemspec", __FILE__), 'w').puts(gemspec)
