class PolymorphicRename < ActiveRecord::Migration

  def up
    update_column_data('spree_admin_tasks', 'source_type')
  end

  def update_column_data(table, column_name)
    execute "UPDATE #{table} SET #{column_name} = #{concat("'Spree::'", column_name)}" +
      " where #{column_name} NOT LIKE 'Spree::%' AND #{column_name} IS NOT NULL"
  end

  def down
    replace_column_data('spree_admin_tasks', 'source_type')
  end
  def replace_column_data(table_names, column_name)
    execute "UPDATE #{table} SET #{column_name} = REPLACE(#{column_name}, 'Spree::', '') " +
      " where #{column_name} LIKE 'Spree::%'"
  end

  def concat(str1, str2)
    dbtype = Rails.configuration.database_configuration[Rails.env]['adapter'].to_sym

    case dbtype
    when :mysql, :mysql2
      "CONCAT(#{str1}, #{str2})"
    when :sqlserver
      "(#{str1} + #{str2})"
    else
      "(#{str1} || #{str2})"
    end
  end
end
