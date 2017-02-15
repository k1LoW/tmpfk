class ActiveRecord::ConnectionAdapters::Column
  def foreign_key?
    return false unless name.end_with?('_id')
    ActiveRecord::Base.connection.data_source_exists?(name.humanize(capitalize: false).tableize)
  end

  def foreign_table
    name.humanize(capitalize: false).tableize
  end
end
