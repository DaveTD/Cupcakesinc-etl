
#ETL::Engine.logger = Logger.new(STDOUT)
#ETL::Engine.logger.level = Logger::DEBUG

source :in, {
  :type => :database,
  :target => :source,
  :table => 'products'
}, 
[ 
  :id, :name, :description, :price, :product_level_id, :custom
]

pre_process :truncate, :target => :development, :table => 'product_dimension'

destination :out, {
  :type => :database,
  :target => :development,
  :table => 'product_dimension'
},
{
  :order => [:id, :name, :description, :price, :product_level_id, :custom ]
}
