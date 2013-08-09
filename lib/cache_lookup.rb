require "cache_lookup/version"
require 'active_support/core_ext'
require 'active_support/cache'

require 'cache_lookup/railtie.rb' if defined?(Rails)

module CacheLookup
  extend ActiveSupport::Concern

  module ClassMethods
    def cache_lookup(attribute)

      # post.clear_id_cache
      define_method("clear_#{attribute}_cache") do
        Rails.cache.delete self.class.send("cache_key_for_#{attribute}", send("#{attribute}"))
      end

      # ActiveRecord callbacks on Save and Destroy to clear the cache
      after_commit "clear_#{attribute}_cache".to_sym
      after_destroy "clear_#{attribute}_cache".to_sym

      # Post.lookup_by_id
      define_singleton_method("lookup_by_#{attribute}") do |param|
        Rails.cache.fetch(send("cache_key_for_#{attribute}", param)) do
          where(attribute => param).first
        end
      end

      # Post.lookup_by_id!
      define_singleton_method("lookup_by_#{attribute}!") do |param|
        self.send("lookup_by_#{attribute}",param) || raise(ActiveRecord::RecordNotFound, "Couldn't find #{name} with #{attribute} #{param}")
      end

      # Post.cache_key_for_id
      define_singleton_method("cache_key_for_#{attribute}") do |param|
        "#{name}:#{attribute}:" + param.to_s
      end
    end
  end

end
