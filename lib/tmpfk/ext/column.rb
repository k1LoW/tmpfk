class ActiveRecord::ConnectionAdapters::Column
  def foreign_key?
    return false unless name.end_with?('_id')
    ActiveRecord::Base.connection.data_source_exists?(foreign_table)
  end

  def foreign_table
    name.humanize(capitalize: false).tableize.tableize.tr(' ', '_')
  end
end
