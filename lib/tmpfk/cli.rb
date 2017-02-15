module Tmpfk
  class CLI < Thor
    class_option :config, aliases: '-c', type: :string, default: 'config.yml', desc: 'CONF_OR_FILE'
    class_option :env, aliases: '-E', type: :string, default: 'development', desc: 'ENVIRONMENT'
    class_option :prefix, type: :string, default: 'tmpfk_', desc: 'Tmp foreign key name prefix'

    desc 'add', 'ALTER TABLE [all tables] ADD [tmp]FOREIGN KEY'
    def add
      conn.data_sources.each do |table|
        next if conn.view_exists?(table)

        ActiveRecord::Base.table_name = table

        ActiveRecord::Base.columns.each do |column|
          fk_name = "#{options[:prefix]}#{table}_#{column.name}_fk"
          primary_key = 'id'
          next unless column.foreign_key?
          next if conn.foreign_key_exists?(table, name: fk_name)
          begin
            conn.add_foreign_key(
              table,
              column.foreign_table,
              column: column.name, primary_key: primary_key, name: fk_name
            )
            puts "ALTER TABLE #{table} ADD CONSTRAINT #{fk_name} FOREIGN KEY (#{column.name}) REFERENCES #{column.foreign_table} (#{primary_key})"
          rescue ActiveRecord::InvalidForeignKey => e
            c = Term::ANSIColor
            puts c.red(e.to_s)
          end
        end
      end
      puts 'Done.'
    end

    desc 'drop', 'ALTER TABLE [all tables] DROP [tmp]FOREIGN KEY'
    def drop
      conn.data_sources.each do |table|
        next if conn.view_exists?(table)

        ActiveRecord::Base.table_name = table

        ActiveRecord::Base.columns.each do |column|
          fk_name = "#{options[:prefix]}#{table}_#{column.name}_fk"
          next unless column.foreign_key?
          next unless conn.foreign_key_exists?(table, name: fk_name)
          begin
            conn.remove_foreign_key(
              table,
              name: fk_name
            )
            puts "ALTER TABLE #{table} DROP FOREIGN KEY #{fk_name}"
          rescue ActiveRecord::InvalidForeignKey => e
            c = Term::ANSIColor
            puts c.red(e.to_s)
          end
        end
      end
      puts 'Done.'
    end

    private

    def conn
      return ActiveRecord::Base.connection if ActiveRecord::Base.connected?
      conn_spec = Ridgepole::Config.load(options[:config], options[:env])
      c = ActiveRecord::Base.establish_connection(conn_spec)
      puts "Connect to #{c.spec.config[:database]}..."
      ActiveRecord::Base.connection
    end
  end
end
