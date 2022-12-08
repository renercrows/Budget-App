@ruby -x "%~f0" %*
@exit /b %ERRORLEVEL%

#!/usr/bin/env ruby
# frozen_string_literal: tru

#
# This file was generated by Bundler.
#
# The application 'bundle' is installed as part of a gem, and
# this file is here to facilitate running it.
#

require "rubygems"

m = Module.new do
  module_function

  def invoked_as_script?
    File.expand_path($0) == File.expand_path(__FILE__)
  end

  def env_var_version
    ENV["BUNDLER_VERSION"]
  end

  def cli_arg_version
    return unless invoked_as_script? # don't want to hijack other binstubs
    return unless "update".start_with?(ARGV.first || " ") # must be running `bundle update`
    bundler_version = nil
    update_index = nil
    ARGV.each_with_index do |a, i|
      if update_index && update_index.succ == i && a =~ Gem::Version::ANCHORED_VERSION_PATTERN
        bundler_version = a
      end
      next unless a =~ /\A--bundler(?:[= ](#{Gem::Version::VERSION_PATTERN}))?\z/
      bundler_version = $1
      update_index = i
    end
    bundler_version
  end

  def gemfile
    gemfile = ENV["BUNDLE_GEMFILE"]
    return gemfile if gemfile && !gemfile.empty?

    File.expand_path("../Gemfile", __dir__)
  end

  def lockfile
    lockfile =
      case File.basename(gemfile)
      when "gems.rb" then gemfile.sub(/\.rb$/, gemfile)
      else "#{gemfile}.lock"
      end
    File.expand_path(lockfile)
  end

  def lockfile_version
    return unless File.file?(lockfile)
    lockfile_contents = File.read(lockfile)
    return unless lockfile_contents =~ /\n\nBUNDLED WITH\n\s{2,}(#{Gem::Version::VERSION_PATTERN})\n/
    Regexp.last_match(1)
  end

  def bundler_requirement
    @bundler_requirement ||=
      env_var_version || cli_arg_version ||
        bundler_requirement_for(lockfile_version)
  end

  def bundler_requirement_for(version)
    return "#{Gem::Requirement.default}.a" unless version

    bundler_gem_version = Gem::Version.new(version)

    requirement = bundler_gem_version.approximate_recommendation

    return requirement unless Gem.rubygems_version < Gem::Version.new("2.7.0")

    requirement += ".a" if bundler_gem_version.prerelease?

    requirement
  end

  def load_bundler!
    ENV["BUNDLE_GEMFILE"] ||= gemfile

    activate_bundler
  end

  def activate_bundler
    gem_error = activation_error_handling do
      gem "bundler", bundler_requirement
    end
    return if gem_error.nil?
    require_error = activation_error_handling do
      require "bundler/version"
    end
    return if require_error.nil? && Gem::Requirement.new(bundler_requirement).satisfied_by?(Gem::Version.new(Bundler::VERSION))
    warn "Activating bundler (#{bundler_requirement}) failed:\n#{gem_error.message}\n\nTo install the version of bundler this project requires, run `gem install bundler -v '#{bundler_requirement}'`"
    exit 42
  end

  def activation_error_handling
    yield
    nil
  rescue StandardError, LoadError => e
    e
  end
end

m.load_bundler!

if m.invoked_as_script?
  load Gem.bin_path("bundler", "bundle")
end
