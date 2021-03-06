getwd()

setwd("/Users/KatieRedmond/Desktop/Zooscan Git KR/PID Files")

#not super useful with range of depths and overlapping bins

#code to combine matrices, provide depth range information, and make a plot to 
#reflect the relationship between area and depth based on “merging data.R”
#read in all 11 333um samples using readZooscan333 function 
moc8_net1_333<-readZooscan333("hb1907_moc8_net1_333_1_tot_1_dat1 (1).pid","hb1907_moc8_net1_333_2_tot_1_dat1.pid")
moc8_net2_333<-readZooscan333("hb1907_moc8_net2_333_1_tot_1_dat1.pid","hb1907_moc8_net2_333_2_tot_1_dat1.pid")
moc8_net5_333<-readZooscan333("hb1907_moc8_net5_333_1_tot_1_dat1.pid","hb1907_moc8_net5_333_2_tot_1_dat1.pid")
moc12_net0_333<-readZooscan333("hb1907_moc12_net0_333_1_tot_1_dat1.pid","hb1907_moc12_net0_333_2_tot_1_dat1.pid")
moc12_net2_333<-readZooscan333("hb1907_moc12_net2_333_1_tot_1_dat1.pid","hb1907_moc12_net2_333_2_tot_1_dat1.pid")
moc12_net5_333<-readZooscan333("hb1907_moc12_net5_333_1_tot_1_dat1.pid","hb1907_moc12_net5_333_2_tot_1_dat1.pid")
moc12_net6_333<-readZooscan333("hb1907_moc12_net6_333_1_tot_1_dat1.pid","hb1907_moc12_net6_333_2_tot_1_dat1.pid")
moc11_net0_333<-readZooscan333("hb1907_moc11_net0_333_1_tot_1_dat1.pid","hb1907_moc11_net0_333_2_tot_1_dat1.pid")
moc11_net3_333<-readZooscan333("hb1907_moc11_net3_333_1_tot_1_dat1.pid","hb1907_moc11_net3_333_2_tot_1_dat1.pid")
moc11_net5_333<-readZooscan333("hb1907_moc11_net5_333_1_tot_1_dat1.pid","hb1907_moc11_net5_333_2_tot_1_dat1.pid")
moc10_net3_333<-readZooscan333("hb1907_moc10_net3_333_1_tot_1_dat1.pid","hb1907_moc10_net3_333_2_tot_1_dat1.pid")

#combine all 333um samples into one dataframe called moc_333 
moc_333 <- rbind(moc8_net1_333,moc8_net2_333,moc8_net5_333,moc12_net0_333,moc12_net2_333,
                 moc12_net5_333,moc12_net6_333,moc11_net0_333,moc11_net3_333,moc11_net5_333,
                 moc10_net3_333)
#make new columns in moc_333 for max and min depths as character data 
moc_333$Max_Depth_Char <- as.character(moc_333$Max_Depth)
moc_333$Min_Depth_Char <- as.character(moc_333$Min_Depth)
#combine the new character depth columns into one depth range column, separated by a "-" 
moc_333$Depth_Range = paste(moc_333$Min_Depth_Char, moc_333$Max_Depth_Char, sep="-")
#reorder the depth column (Depth_Range) in relation to another numeric
#column (Max_Depth)
moc_333$Depth_Range = with(moc_333, reorder(Depth_Range,Max_Depth))

#cut() to create another column based on range of Area values
moc_333$size = cut(moc_333$Area.um2, c(1.2e+04,1.2e+05, 1.2e+06,1.2e+07,
                                       1.2e+08, 1.2e+09,1.2e+10, 1.2e+11))

moc_333$size_char <- as.character(moc_333$size)
################################################################

#code to combine matrices, provide depth range information, and make a plot to 
#reflect the relationship between area and depth based on “merging data.R”
#read in all 11 1000 um samples using readZooscan function 

moc8_net1_1000<-readZooscan("hb1907_moc8_net1_1000_1_tot_1_dat1.pid")
moc8_net2_1000<-readZooscan("hb1907_moc8_net2_1000_1_tot_1_dat1.pid")
moc12_net0_1000<-readZooscan("hb1907_moc12_net0_1000_1_tot_1_dat1.pid")
moc12_net2_1000<-readZooscan("hb1907_moc12_net2_1000_1_tot_1_dat1.pid")
moc12_net5_1000<-readZooscan("hb1907_moc12_net5_1000_1_tot_1_dat1.pid")
moc12_net6_1000<-readZooscan("hb1907_moc12_net6_1000_1_tot_1_dat1.pid")
moc11_net0_1000<-readZooscan("hb1907_moc11_net0_1000_1_tot_1_dat1.pid")
moc11_net3_1000<-readZooscan("hb1907_moc11_net3_1000_1_tot_1_dat1.pid")
moc11_net5_1000<-readZooscan("hb1907_moc11_net5_1000_1_tot_1_dat1.pid")
moc10_net3_1000<-readZooscan("hb1907_moc10_net3_1000_1_tot_1_dat1.pid")


#combine all 1000um samples into one dataframe called moc_1000
moc_1000 <- rbind(moc8_net1_1000,moc8_net2_1000,moc12_net0_1000,moc12_net2_1000,
                 moc12_net5_1000,moc12_net6_1000,moc11_net0_1000,moc11_net3_1000,moc11_net5_1000,
                 moc10_net3_1000)
#make new columns in moc_1000 for max and min depths as character data 
moc_1000$Max_Depth_Char <- as.character(moc_1000$Max_Depth)
moc_1000$Min_Depth_Char <- as.character(moc_1000$Min_Depth)
#combine the new character depth columns into one depth range column, separated by a "-" 
moc_1000$Depth_Range = paste(moc_1000$Min_Depth_Char, moc_1000$Max_Depth_Char, sep="-")
#reorder the depth column (Depth_Range) in relation to another numeric
#column (Max_Depth)
moc_1000$Depth_Range = with(moc_1000, reorder(Depth_Range,Max_Depth))


#cut() to create another column based on range of Area values
moc_1000$size = cut(moc_1000$Area.um2, c(1.2e+04,1.2e+05, 1.2e+06,1.2e+07,
                                       1.2e+08, 1.2e+09,1.2e+10, 1.2e+11))

moc_1000$size_char <- as.character(moc_1000$size)
###############################

#code to combine matrices, provide depth range information, and make a plot to 
#reflect the relationship between area and depth based on “merging data.R”
#read in all 11 1000 um samples using readZooscan function 

moc8_net1_5000<-readZooscan("hb1907_moc8_net1_5000_1_tot_1_dat1.pid")
moc8_net2_5000<-readZooscan("hb1907_moc8_net2_5000_1_tot_1_dat1.pid")
moc12_net0_5000<-readZooscan("hb1907_moc12_net0_5000_1_tot_1_dat1.pid")
moc12_net2_5000<-readZooscan("hb1907_moc12_net2_5000_1_tot_1_dat1.pid")
moc12_net5_5000<-readZooscan("hb1907_moc12_net5_5000_1_tot_1_dat1.pid")
moc12_net6_5000<-readZooscan("hb1907_moc12_net6_5000_1_tot_1_dat1.pid")
moc11_net0_5000<-readZooscan("hb1907_moc11_net0_5000_1_tot_1_dat1.pid")
moc11_net3_5000<-readZooscan("hb1907_moc11_net3_5000_1_tot_1_dat1.pid")
moc11_net5_5000<-readZooscan("hb1907_moc11_net5_5000_1_tot_1_dat1.pid")
moc10_net3_5000<-readZooscan("hb1907_moc10_net3_5000_1_tot_1_dat1.pid")


#combine all 1000um samples into one dataframe called moc_1000
moc_5000 <- rbind(moc8_net1_5000,moc8_net2_5000,moc12_net0_5000,moc12_net2_5000,
                  moc12_net5_5000,moc12_net6_5000,moc11_net0_5000,moc11_net3_5000,moc11_net5_5000,
                  moc10_net3_5000)
#make new columns in moc_1000 for max and min depths as character data 
moc_5000$Max_Depth_Char <- as.character(moc_5000$Max_Depth)
moc_5000$Min_Depth_Char <- as.character(moc_5000$Min_Depth)
#combine the new character depth columns into one depth range column, separated by a "-" 
moc_5000$Depth_Range = paste(moc_5000$Min_Depth_Char, moc_5000$Max_Depth_Char, sep="-")
#reorder the depth column (Depth_Range) in relation to another numeric
#column (Max_Depth)
moc_5000$Depth_Range = with(moc_5000, reorder(Depth_Range,Max_Depth))


#cut() to create another column based on range of Area values
moc_5000$size = cut(moc_5000$Area.um2, c(1.2e+04,1.2e+05, 1.2e+06,1.2e+07,
                                       1.2e+08, 1.2e+09,1.2e+10, 1.2e+11))

moc_5000$size_char <- as.character(moc_5000$size)


######
#combine 1000, 5000, and 333 um samples into one data set
moc_all <- rbind(moc_1000, moc_333, moc_5000)

#plot Depth Range and Area
p <- ggplot(moc_all, aes(x=Depth_Range, y=Area.um2per100m3,
      fill=Depth_Range)) + 
  geom_bar(stat = "identity") + coord_flip() +
  scale_x_discrete(limits = rev(levels(moc_all$Depth_Range)))+
  ggtitle("Total Biomass at Various Depth Ranges")+ 
  labs(y="Biomass (Area.um2per100m3)", x= "Depth Ranges")

#plot
p


#make new column in moc_all for Area as categorical data
moc_all$Area.um2per100m3_char <- as.character(moc_all$Area.um2per100m3)
moc_all$Area.um2per100m3 <- as.numeric(moc_all$Area.um2per100m3)

#cut() to create another column based on range of Area values
moc_all$size = cut(moc_all$Area.um2, c(1.2e+04,1.2e+05, 1.2e+06,1.2e+07,
                                       1.2e+08, 1.2e+09,1.2e+10, 1.2e+11))

moc_all$size_char <- as.character(moc_all$size)
#summarize moc_all data to double check everything worked
summary(moc_all)

