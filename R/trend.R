# community trend
#
# This is an example function named 'trend'
# which prints community trend.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

trend <- function(community_name_x) {
  library(dplyr)
  library(readr)
  print("Hello, friend ,I am max!")

  #community_name_x="新龙城"
  # consul <- new.env()
  # consul$host = Sys.getenv("consul.host")
  # consul$port = Sys.getenv("consul.port")
  # consul$swagger = Sys.getenv("consul.swagger")
  #
  # #connect the library 'laputas'
  # fcast <- est_mysql_conn("Forecast")
  #
  # data1=head(DBI::dbListTables(fcast), 10)

  fileRoute<-system.file("extdata","community_attributes.csv",package = "CommunityTrend")
  fileRoute2<-system.file("extdata","community_hit_attributes.csv",package = "CommunityTrend")
  fileRoute3<-system.file("extdata","improvement1_attributes.csv",package = "CommunityTrend")

  community_attributes<-read_csv(fileRoute)
  community_hit_attributes<-read_csv(fileRoute2)
  community_up_and_transaction_attributes<-read_csv(fileRoute3)

  the_attributes<-community_attributes%>%
    filter(community_name == community_name_x)

  the_attributes2<-community_hit_attributes%>%
    filter(community_name == community_name_x)

  the_attributes3<-community_up_and_transaction_attributes%>%
    filter(community_name == community_name_x)

  print('-------------------------------------')
  print('|过去一个月内自如:')
  print(paste0("|商圈总房数：",the_attributes3$all_num_business_district))
  print(paste0("|商圈均价：",the_attributes3$business_district_average_price))
  print(paste0("|小区总房数：",the_attributes3$all_num_community))
  print(paste0("|小区均价：",the_attributes3$community_average_price))
  #print(paste0("|成为火房比例:",the_attributes2$HuoFang_rate))
  print(paste0("|小区调价房数量:",the_attributes2$price_adjustment_num))
  print(paste0("|小区调价房平均降价:",the_attributes2$price_adjustment_average))
  print('|')
  print(paste0("|小区月内合租单间上架：",the_attributes2$community_other_num))
  print(paste0("|小区月内新上架单间成交量:",the_attributes3$community_sales_num))
  print(paste0("|小区月内新上架单间平均展示期:",the_attributes2$average_exhibition_period))
  print(paste0("|小区月内新上架成交单间平均展示期:",the_attributes3$exbination_and_adjustment_ave_exhibition_period))
  print(paste0("|小区月内新上架单间平均调价数:",the_attributes3$price_adjustment_num))
  print(paste0("|小区月内新上架单间平均调价价格:",the_attributes3$price_adjustment_average))

  print('|')
  print('|')
  print('|--------：成交数据||上架数据')
  print(paste0("|所在商圈:",the_attributes$business_district,"||",the_attributes$business_district))

  print(paste0("|社区合租单间销量：",the_attributes$community_other_num,"||",the_attributes2$community_other_num))
  print(paste0("|社区合租单间均价：",the_attributes$community_average_price,"||",the_attributes2$community_average_price))
  print(paste0("|社区合租单间平均面积：",the_attributes$community_average_area,"||",the_attributes2$community_average_area))
  print(paste0("|社区合租单位面积价格：",the_attributes$community_average_AreaPrice,"||",the_attributes2$community_average_AreaPrice))
  print('|')
  print(paste0("|当地商圈合租单间销量：",the_attributes$business_district_other_num,"||",the_attributes2$business_district_other_num))
  print(paste0("|当地商圈合租单间均价：",the_attributes$business_district_average_price,"||",the_attributes2$business_district_average_price))
  print(paste0("|当地商圈合租单间平均面积：",the_attributes$business_district_average_area,"||",the_attributes2$business_district_average_area))
  print(paste0("|当地商圈合租单间单位面积价格：",the_attributes$business_district_average_AreaPrice,"||",the_attributes2$business_district_average_AreaPrice))
  print('-------------------------------------')
  #return(the_attributes)
  # DBI::dbDisconnect(fcast)
}
