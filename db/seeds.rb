# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


src = ServiceReportCategory.new
params = {
  :title => 'Service Delivery/Facilities',
  :code => 6
}
src.update_attributes params

src = ServiceReportCategory.new
params = {
  :title => 'SService Planning',
  :code => 7
}
src.update_attributes params

src = ServiceReportCategory.new
params = {
  :title => 'Commendation',
  :code => 4
}
src.update_attributes params

src = ServiceReportCategory.new
params = {
  :title => 'Inattentiveness/Negligence',
  :code => 2
}
src.update_attributes params

src = ServiceReportCategory.new
params = {
  :title => 'Unsafe Operations',
  :code => 1
}
src.update_attributes params

src = ServiceReportCategory.new
params = {
  :title => 'Miscellaneous',
  :code => 8
}
src.update_attributes params

src = ServiceReportCategory.new
params = {
  :title => 'Criminal Activity',
  :code => 5
}
src.update_attributes params