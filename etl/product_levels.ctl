
#ETL::Engine.logger = Logger.new(STDOUT)
#ETL::Engine.logger.level = Logger::DEBUG

source :in, {
  :type => :database,
  :target => :source,
  :table => 'product_level'
},
[
  :product_level_id,
  :product_subcategory,
  :product_category,
  :product_type
]

pre_process :truncate, :target => :development, :table => 'product_levels'

destination :out, {
  :type => :database,
  :target => :development,
  :table => 'product_levels'
},
{
  :order => [ :product_level_id, :product_subcategory, :product_category, :product_type ]
}
