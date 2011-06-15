Gem::Specification.new do |s|
  s.name              = %q{refinerycms-accessible_pages}
  s.version           = %q{0.1.0}
  s.description       = %q{Engine to restrict admin page access for Refinery CMS.}
  s.date              = %q{2011-06-06}
  s.summary           = %q{Page access engine for Refinery CMS.}
  s.email             = %q{jacob@envylabs.com}
  s.homepage          = %q{http://envylabs.com}
  s.authors           = %w(Jacob\ Swanner)
  s.require_paths     = %w(lib)
  s.files             = Dir['lib/**/*', 'app/**/*', 'config/**/*', 'db/**/*']

  s.add_dependency    'refinerycms-authentication', '~> 1.0.0'
  s.add_dependency    'refinerycms-pages',          '~> 1.0.0'
end
