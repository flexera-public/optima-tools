# -*- encoding: utf-8 -*-
# stub: mdl 0.13.0 ruby lib

Gem::Specification.new do |s|
  s.name = "mdl".freeze
  s.version = "0.13.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "rubygems_mfa_required" => "true" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mark Harrison".freeze]
  s.date = "2023-10-02"
  s.description = "Style checker/lint tool for markdown files".freeze
  s.email = ["mark@mivok.net".freeze]
  s.executables = ["mdl".freeze]
  s.files = ["bin/mdl".freeze]
  s.homepage = "https://github.com/markdownlint/markdownlint".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7".freeze)
  s.rubygems_version = "3.4.19".freeze
  s.summary = "Markdown lint tool".freeze

  s.installed_by_version = "3.4.19" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<kramdown>.freeze, ["~> 2.3"])
  s.add_runtime_dependency(%q<kramdown-parser-gfm>.freeze, ["~> 1.1"])
  s.add_runtime_dependency(%q<mixlib-cli>.freeze, ["~> 2.1", ">= 2.1.1"])
  s.add_runtime_dependency(%q<mixlib-config>.freeze, [">= 2.2.1", "< 4"])
  s.add_runtime_dependency(%q<mixlib-shellout>.freeze, [">= 0"])
  s.add_development_dependency(%q<bundler>.freeze, [">= 1.12", "< 3"])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.9"])
  s.add_development_dependency(%q<pry>.freeze, ["~> 0.10"])
  s.add_development_dependency(%q<rake>.freeze, [">= 11.2", "< 14"])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 1.28.1"])
end
