
nc_mapping <-function(x,y){ 
  if(is.numeric(x)==FALSE){
    ggplot(data=nc_map,aes(fill=x,label=nom_minus) )+
      geom_sf(lwd=0.00001,alpha=0.5)+
      theme_map()+
      theme(panel.background = element_rect(fill = "aliceblue"),legend.position = c(0.01, 0.25),legend.background = element_blank(),legend.box.background = element_rect(colour = "black"),legend.spacing.y = unit(0.5, "mm"))+
      scale_fill_brewer(palette = "Set2")+
      labs(fill=y)+
      ggspatial::annotation_scale(location = 'br')+  
      annotation_north_arrow(location = "tl", which_north = "true",height = unit(1, "cm"),
                             width = unit(1, "cm"))
  }else{
    ggplot(data=nc_map ,aes(fill=x,label=nom_minus))+
      geom_sf(lwd=0.00001,alpha=0.5)+
      theme_map()+
      theme(panel.background = element_rect(fill = "aliceblue"),
            legend.position = c(0.05, 0.25),
            legend.background = element_blank(),
            legend.box.background = element_rect(colour = "black"),
            legend.spacing.y = unit(0.5, "mm"))+
      scale_fill_viridis_b(option = "magma", labels=scales::percent,n.breaks=4 ,direction = -1)+                                                                            
      labs(fill=y)+
      ggspatial::annotation_scale(location = 'br')+  
      annotation_north_arrow(location = "tl", which_north = "true",height = unit(1, "cm"),width = unit(1, "cm"))}}
