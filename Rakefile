# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

gs_nexus_dir = Gem::Specification.find_by_name('gs-nexus-registry-ruby').gem_dir
require "#{gs_nexus_dir}/lib/vendor/rubygem_push"

RSpec::Core::RakeTask.new(:spec)

task default: :spec
