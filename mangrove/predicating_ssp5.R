library(terra)
library(ranger)
RFmodel = readRDS("F:/mangrove_data/Model building/rf.rds")


#2022
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/GDP2022.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2022.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2022.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2022.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2022.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2022.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2022.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2022.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2022.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")
prev_loss = rast("F:/mangrove_data/Model building/Independent variables/prev_loss/loss_prev_19.tif")
names(pred_set)

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss
names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"

PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
plot(PredRas_thr)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2022ssp5.tif")

mangrove_2022ssp5 = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove_2022ssp5,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2022ssp5_focal.tif")

#2025
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/GDP2025.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2025.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2025.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2025.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2025.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2025.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2025.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2025.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2025.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2022ssp5_focal.tif")
year = year+3

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2025ssp5.tif",overwrite = T)

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2025ssp5_focal.tif")

#2028
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2028.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2028.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2028.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2028.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2028.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2028.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2028.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2028.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2028.tif")
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2025ssp5_focal.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+6

plot(year)

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2028ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2028ssp5_focal.tif")


#2031
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2031.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2031.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2031.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2031.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2031.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2031.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2031.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2031.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2031.tif")
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2028ssp5_focal.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+9

plot(year)

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2031ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2031ssp5_focal.tif")



#2034
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2034.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2034.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2034.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2034.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2034.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2034.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2034.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2034.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2034.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")
year = year+12
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2031ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2034ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2034ssp5_focal.tif")


#2037
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2037.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2037.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2037.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2037.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2037.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2037.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2037.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2037.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2037.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")
year = year+15
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2034ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss


pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2037ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2037ssp5_focal.tif")


#2040
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2040.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2040.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2040.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2040.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2040.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2040.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2040.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2040.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2040.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")
year = year+18
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2037ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2040ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2040ssp5_focal.tif")


#2043
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2043.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2043.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2043.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2043.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2043.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2043.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2043.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2043.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2043.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")
year = year+21
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2040ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2043ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2043ssp5_focal.tif")


#2046
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2046.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2046.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2046.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2046.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2046.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2046.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2046.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2046.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2046.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")
year = year+24
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2043ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2046ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2046ssp5_focal.tif")



#2049
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2049.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2049.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2049.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2049.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2049.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2049.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2049.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2049.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2049.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+27
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2046ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2049ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2049ssp5_focal.tif")



#2052
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2052.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2052.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2052.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2052.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2052.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2052.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2052.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2052.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2052.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+30
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2049ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2052ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2052ssp5_focal.tif")


#2055
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2055.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2055.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2055.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2055.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2055.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2055.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2055.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2055.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2055.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+33
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2052ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2055ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2055ssp5_focal.tif")




#2058
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2058.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2058.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2058.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2058.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2058.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2058.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2058.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2058.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2058.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+36
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2055ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2058ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2058ssp5_focal.tif")



#2061
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2061.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2061.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2061.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2061.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2061.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2061.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2061.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2061.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2061.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+39

prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2058ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2061ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2061ssp5_focal.tif")



#2064
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2064.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2064.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2064.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2064.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2064.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2064.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2064.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2064.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2064.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+42
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2061ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2064ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2064ssp5_focal.tif")



#2067
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2067.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2067.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2067.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2067.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2067.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2067.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2067.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2067.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2067.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+45
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2064ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2067ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2067ssp5_focal.tif")


#2070
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2070.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2070.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2070.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2070.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2070.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2070.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2070.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2070.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2070.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+48
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2067ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2070ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2070ssp5_focal.tif")


#2073
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2073.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2073.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2073.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2073.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2073.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2073.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2073.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2073.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2073.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+51
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2070ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2073ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2073ssp5_focal.tif")


#2076
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2076.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2076.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2076.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2076.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2076.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2076.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2076.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2076.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2076.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+54
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2073ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2076ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2076ssp5_focal.tif")


#2079
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2079.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2079.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2079.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2079.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2079.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2079.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2079.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2079.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2079.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+57
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2076ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2079ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2079ssp5_focal.tif")

#2082
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2082.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2082.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2082.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2082.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2082.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2082.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2082.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2082.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2082.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+60
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2079ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2082ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2082ssp5_focal.tif")


#2085
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2085.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2085.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2085.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2085.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2085.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2085.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2085.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2085.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2085.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+63
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2082ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr ,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2085ssp5.tif")

mangrove = focal(PredRas_thr , w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2085ssp5_focal.tif")

#2088
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2088.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2088.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2088.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2088.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2088.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2088.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2088.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2088.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2088.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+66
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2085ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2088ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2088ssp5_focal.tif")

#2091
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2091.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2091.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2091.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2091.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2091.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2091.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2091.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2091.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2091.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+69
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2088ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2091ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2091ssp5_focal.tif")



#2094
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2094.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2094.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2094.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2094.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2094.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2094.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2094.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2094.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2094.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+72
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2091ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2094ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2094ssp5_focal.tif")


#2097
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2097.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2097.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2097.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2097.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2097.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2097.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2097.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2097.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2097.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+75
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2094ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2097ssp5.tif")

mangrove = focal(PredRas_thr, w = matrix(1,11,11), fun = mean, na.rm = T, expand = F)
writeRaster(mangrove,"F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2097ssp5_focal.tif")

#2100
pred_set = rast("F:/mangrove_data/Model_predicating/2030spp1pred.tif")
gdp = rast("F:/mangrove_data/Model_predicating/GDP/ssp5/gdp2100.tif")
pop = rast("F:/mangrove_data/Model_predicating/Pop/ssp5/pop2100.tif")
coconut = rast("F:/mangrove_data/Model_predicating/crop_suitability/coconut/ssp5/coconut2100.tif")
coffee = rast("F:/mangrove_data/Model_predicating/crop_suitability/coffee/ssp5/coffee2100.tif")
olp = rast("F:/mangrove_data/Model_predicating/crop_suitability/olp/ssp5/olp2100.tif")
rice = rast("F:/mangrove_data/Model_predicating/crop_suitability/rice/ssp5/rice2100.tif")
rubber = rast("F:/mangrove_data/Model_predicating/crop_suitability/rubber/ssp5/rubber2100.tif")
sugarcane = rast("F:/mangrove_data/Model_predicating/crop_suitability/sugarcane/ssp5/sugarcane2100.tif")
sealevel= rast("E:/Mangrove/crop/data3/crop/xin/sealevel/ssp5/sealevel2100.tif")
year = rast("F:/mangrove_data/Model_predicating/prev_loss1/year20221.tif")

year = year+78
prev_loss = rast("F:/mangrove_data/Model_predicating/prev_loss/ssp5/mangrove_2097ssp5_focal.tif")

pred_set$gdp = gdp
pred_set$pop = pop
pred_set$coconut = coconut
pred_set$coffee = coffee
pred_set$olp = olp
pred_set$rice = rice
pred_set$rubber = rubber
pred_set$sugarcane= sugarcane
pred_set$year = year
pred_set$sealevel= sealevel
pred_set$loss_prev = prev_loss

names(pred_set)[names(pred_set) == "Regulatory_Quality"] <- "rq"
PredRas = predict(pred_set,RFmodel,na.rm=T)
PredRas_thr = ifel(PredRas < 0.47, 0, PredRas)
writeRaster(PredRas_thr,"F:/mangrove_data/Prediction_results/ssp5_result/mangrove_2100ssp5.tif")


