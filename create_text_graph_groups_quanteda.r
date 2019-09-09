## call:
## plot_word_network_per_group(document_feature_matrix, c('list', 'of', 'strings', 'with', 'group', 'names'), 25) #25 top words


plot_word_network_per_group <- function(dfm, groups, n_feat){
  #return_me <- list()
  for (group in groups) {
    #print
    print(group)
    plotname <- paste0("textplot_", group)
    dfm_tmp <- dfm_subset(dfm, clust1 == group)
    fcm_tmp <- fcm(dfm_tmp)
    topfeatures_tmp <- names(topfeatures(fcm_tmp, n_feat))
    fcm_selected_tmp <- fcm_select(fcm_tmp, pattern = topfeatures_tmp)
    #size of the words!
    size <- log(colSums(dfm_select(dfm_tmp, topfeatures_tmp)))
    print(textplot_network(fcm_selected_tmp, min_freq = 500, vertex_size = size / max(size) * 3))
    #return_me <- append(return_me, plotname)
  }
  
rm(dfm_tmp, fcm_tmp, topfeatures_tmp, fcm_selected_tmp, size)
# return(return_me)
}
