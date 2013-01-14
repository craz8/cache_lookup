module CacheLookup
  class Railtie < ::Rails::Railtie

    initializer 'cache_lookup.initialize' do
      ActiveSupport.on_load(:active_record) do
        ActiveRecord::Base.send :include, CacheLookup
      end
    end

  end
end
