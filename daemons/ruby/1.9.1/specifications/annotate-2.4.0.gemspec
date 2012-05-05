# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "annotate"
  s.version = "2.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Cuong Tran", "Alex Chaffee", "Marcos Piccinini"]
  s.date = "2009-12-13"
  s.description = "Annotates Rails Models, routes, fixtures, and others based on the database schema."
  s.email = ["alex@stinky.com", "ctran@pragmaquest.com", "x@nofxx.com"]
  s.executables = ["annotate"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["bin/annotate", "README.rdoc"]
  s.homepage = "http://github.com/ctran/annotate"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "annotate"
  s.rubygems_version = "1.8.10"
  s.summary = "Annotates Rails Models, routes, fixtures, and others based on the database schema."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
