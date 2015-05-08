require "tzwhere/version"
require "tzwhere/query"

module TZWhere
  def self.lookup(latitude, longitude)
    TZWhere::Query.instance.lookup(latitude, longitude)
  end
end
