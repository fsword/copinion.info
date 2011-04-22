# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
user = User.create(:openid => 'li.jianye@gmail.com', :img_path => '/images/lijianye.png', :zone => '中国 甘肃')
topic = user.opinions.create(:msg => "#test# my test 01")
user.opinions.create(:msg => "my test 02", :topic => topic)

User.create(:openid => '淘李福', :img_path => '/images/lifu.png', :zone => '浙江 杭州')
