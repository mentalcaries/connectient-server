module RailsExt
  module SQLite3Adapter
    def configure_connection
      super
      @raw_connection.enable_load_extension(true)
      @config[:extensions].each do |extension_name|
        require extension_name
        extension_classname = extension_name.camelize
        extension_class = extension_classname.constantize
        extension_class.load(@raw_connection)
      rescue LoadError
        Rails.logger.error("Failed to find the SQLite extension gem: #{extension_name}. Skipping...")
      rescue NameError
        Rails.logger.error("Failed to find the SQLite extension class: #{extension_classname}. Skipping...")
      end
      @raw_connection.enable_load_extension(false)
    end
  end
end

ActiveSupport.on_load(:active_record_sqlite3adapter) do
  # self refers to `SQLite3Adapter` here,
  # so we can call .prepend
  prepend RailsExt::SQLite3Adapter
end