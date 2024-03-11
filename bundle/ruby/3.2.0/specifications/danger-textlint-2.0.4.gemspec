# -*- encoding: utf-8 -*-
# stub: danger-textlint 2.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "danger-textlint".freeze
  s.version = "2.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Kesin".freeze]
  s.date = "2022-04-30"
  s.description = "Danger plugin for textlint.".freeze
  s.email = ["kesin1202000@gmail.com".freeze]
  s.homepage = "https://github.com/Kesin11/danger-textlint".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.19".freeze
  s.summary = "Danger plugin for textlint.".freeze

  s.installed_by_version = "3.4.19" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<danger-plugin-api>.freeze, ["~> 1.0"])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4"])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
  s.add_development_dependency(%q<yard>.freeze, [">= 0"])
  s.add_development_dependency(%q<guard>.freeze, ["~> 2.14"])
  s.add_development_dependency(%q<guard-rspec>.freeze, ["~> 4.7"])
  s.add_development_dependency(%q<listen>.freeze, ["= 3.7.1"])
  s.add_development_dependency(%q<bump>.freeze, ["~> 0.10.0"])
  s.add_development_dependency(%q<pry>.freeze, [">= 0"])
end
