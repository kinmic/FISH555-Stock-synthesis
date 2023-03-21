library(r4ss)

myreplist <- SS_output(dir = "C:/FISH_555/simple/")

# make a collection of plots using SS_plots
SS_plots(replist = myreplist)

a<-myreplist$catch
names(a)

library(ggplot2)

killed_fish<-ggplot(a, aes(x= Yr, y = kill_num))+
  geom_point()+
  geom_path()+
  theme_minimal()+
  geom_errorbar(aes(ymin=kill_num-kill_num*se, ymax=kill_num+kill_num*se), width=.2,
                position=position_dodge(0.05))+
  ggtitle("Catch", subtitle =   "1970 - 2001")+
  xlab("Year")+
  ylab("Fish killed")


f_attime<-ggplot(a, aes(x= a$Yr, y = a$F))+
  geom_point()+
  geom_path()+
  theme_minimal()+
  ggtitle("F", subtitle = " 1970 - 2001")+
  xlab("Year")+
  ylab("Fishing effort")



ggpubr::ggarrange(killed_fish, f_attime)
