
#ETL::Engine.logger = Logger.new(STDOUT)
#ETL::Engine.logger.level = Logger::DEBUG

source :in, {
  :type => :database,
  :target => :source,
  :table => 'customers'
}, 
[ 
  :id, :name
]

before_write :check_exist, {
  :target => :development, 
  :table => 'customer_dimension', 
  :columns => [:id]
}


destination :out, {
  :type => :database,
  :target => :development,
  :table => 'customer_dimension'
},
{
  :order => [:id, :name ]
}
