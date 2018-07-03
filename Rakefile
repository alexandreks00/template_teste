desc 'Cenarios'

task :iphone do

  p "Rodando toda switch na resolucao de iphone."

  sh 'cucumber iphone=true extra=true & cucumber iphone=true ponto_frio=true & cucumber iphone=true casas_bahia=true'
end
# Selenium Grid Ruby Example Rakefile
#
# Document best practices to drive Selenium tests written in Ruby and
# targetting Selenium Grid.

#
# Loading required dependencies
#

require "rubygems"
gem "rspec"
require 'rake'
require 'spec/rake/spectask'
gem "deep_test_pre"
require "deep_test"

report_formatter_path = "lib/reporting/selenium_test_report_formatter"



task :default => :'tests:run_in_parallel'

#
# Recommended way to run tests in parallel and leverage Selenium Grid.
#

desc("Run all tests in parallel using DeepTest.")
Spec::Rake::SpecTask.new("tests:run_in_parallel") do |t|
  t.spec_files = FileList['./**/*_spec.rb']
  t.deep_test :number_of_agents => 6
  t.spec_opts << '--color'
  t.spec_opts << "--require 'rubygems,#{report_formatter_path}'"
  t.spec_opts << "--format=Selenium::RSpec::SeleniumTestReportFormatter:./tmp/test_report.html"
  t.spec_opts << "--format=progress"
end
task :'tests:run_in_parallel' => :create_report_dir

#
# Running tests in sequence (without taking advantage of Selenium Grid),
# useful to troubleshoot problems with the parallel run.
#


desc "Run all behaviors in sequence"
Spec::Rake::SpecTask.new('tests:run_in_sequence') do |t|
  t.pattern = "**/*_spec.rb"
  t.spec_opts << '--color'
  t.spec_opts << "--require 'rubygems,#{report_formatter_path}'"
  t.spec_opts << "--format=Selenium::RSpec::SeleniumTestReportFormatter:./tmp/test_report.html"
  t.spec_opts << "--format=progress"
  t.fail_on_error = true
end
task :'tests:run_in_sequence' => :create_report_dir

task :create_report_dir do
  rm_f File.expand_path(File.dirname(__FILE__) + "/tmp/rspec_report")
  mkdir_p File.expand_path(File.dirname(__FILE__) + "/tmp/rspec_report")
  ENV['SELENIUM_TEST_REPORT_FILE'] = "./tmp/test_report.html" # Workaround for DeepTest reports
end

desc "Check whether you installed all dependencies and you environmnet is OK."
task :sanity_check do
  require report_formatter_path
  STDOUT.puts <<-EOS
 Congratulations, your environment is set properly.

 Run the tests in parallel with:

   rake tests:run_in_parallel

 Or in sequence with:

   rake tests:run_in_sequence

  EOS
end
