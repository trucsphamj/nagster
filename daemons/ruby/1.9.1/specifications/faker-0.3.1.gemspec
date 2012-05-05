# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "faker"
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Benjamin Curtis"]
  s.date = "2008-04-03"
  s.description = "A port of Perl's Data::Faker - Generates fake names, phone numbers, etc."
  s.email = "benjamin.curtis@gmail.com"
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "README.txt"]
  s.homepage = "http://faker.rubyforge.org"
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "faker"
  s.rubygems_version = "1.8.10"
  s.summary = "A port of Perl's Data::Faker - Generates fake names, phone numbers, etc."

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
