#Function to assign references in order
cacheEnv <- new.env()

cacheEnv$myRefs<-list()
cacheEnv$refCount<-1
getRef <- function(ref){
  if(!is.character(ref)) {
    myRef <- as.character(substitute(ref))
  }
  else{
    myRef <- ref
  }
  if(is.null(cacheEnv$myRefs[[myRef]])){
    cacheEnv$myRefs[[myRef]]<-cacheEnv$refCount
    cacheEnv$refCount <- cacheEnv$refCount+1
  }
  cacheEnv$myRefs[[myRef]]
}


#' @title Caption with running count of Figure number
#' @import ggplot2
#' @export
gCaption <- function(title,subtitle=NULL){
  require(ggplot2)
  ref <- paste0(title,subtitle)
  myCaption <- paste0("Figure ",getRef(ref),": ",title)
  if(!is.null(subtitle)) myCaption <- paste0(myCaption,"\n",subtitle)
  labs(caption=myCaption)
}
