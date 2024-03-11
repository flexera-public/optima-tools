# -*- encoding: utf-8 -*-
# stub: danger-rubocop 0.12.0 ruby lib

Gem::Specification.new do |s|
  s.name = "danger-rubocop".freeze
  s.version = "0.12.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ash Furrow".freeze]
  s.date = "2023-10-01"
  s.description = "A Danger plugin for running Ruby files through Rubocop.".freeze
  s.email = "ash@ashfurrow.com".freeze
  s.homepage = "https://github.com/ashfurrow/danger-rubocop".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.19".freeze
  s.summary = "A Danger plugin for running Ruby files through Rubocop.".freeze

  s.installed_by_version = "3.4.19" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<danger>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<rubocop>.freeze, ["~> 1.0"])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
  s.add_development_dependency(%q<yard>.freeze, [">= 0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4"])
  s.add_development_dependency(%q<guard>.freeze, ["~> 2.14"])
  s.add_development_dependency(%q<guard-rspec>.freeze, ["~> 4.7"])
  s.add_development_dependency(%q<listen>.freeze, ["= 3.0.7"])
  s.add_development_dependency(%q<pry>.freeze, [">= 0"])
end
