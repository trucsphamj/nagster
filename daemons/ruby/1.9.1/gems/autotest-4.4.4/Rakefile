require 'rubygems'
$LOAD_PATH << 'lib'

#rake test
require 'rake/testtask'
Rake::TestTask.new(:test) {|test| test.libs << "test"}
task :default => :test

desc "show help"
task :help do
  puts `./bin/autotest --help`
end

desc "run autotest on itself"
task :autotest do
  ruby "-Ilib -w ./bin/autotest"
end

#TODO exclude /usr/ folder
#TODO improve coverage ? only 20% atm...
desc "show rcov report"
task :rcov_info do
  ruby "-Ilib -S rcov --text-report --save coverage.info test/test_*.rb"
end

desc "update example_dot_autotest.rb with all possible constants"
task :update do
  system "p4 edit example_dot_autotest.rb"
  File.open "example_dot_autotest.rb", "w" do |f|
    f.puts "# -*- ruby -*-"
    f.puts
    Dir.chdir "lib" do
      Dir["autotest/*.rb"].sort.each do |s|
        next if s =~ /rails|discover/
        f.puts "# require '#{s[0..-4]}'"
      end
    end

    f.puts

    Dir["lib/autotest/*.rb"].sort.each do |file|
      file = File.read(file)
      m = file[/module.*/].split(/ /).last rescue nil
      next unless m

      file.grep(/def[^(]+=/).each do |setter|
        setter = setter.sub(/^ *def self\./, '').sub(/\s*=\s*/, ' = ')
        f.puts "# #{m}.#{setter}"
      end
    end
  end
  system "p4 diff -du example_dot_autotest.rb"
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "autotest"
    gem.summary = "Autotest, without ZenTest"
    gem.homepage = "http://github.com/grosser/autotest"
    gem.authors = ["Ryan Davis"]
  end

  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end