#' Connect to Database
#' @description Connects to an X-Ray database (Postgres)
#' @param datacenter c('dev','QA','Virginia','Frankfurt','USbackup')
#'
#' @return TRUE if datacenter is on the list FALSE if not.
#' @export
connectToDatabase <- function(datacenter){
  if(datacenter=="dev"){
    setPSQLdefaultConnection(user = 'xadmin', password = "v895IqETJvcu4LY",port = "5432", dbname = "xadmin",
                             host = "use1-xdbd-001.cbibbbyejjpu.us-east-1.rds.amazonaws.com")
    return(TRUE)
  }

  if(datacenter=="QA"){
    setPSQLdefaultConnection(user='adietrichson',host="use1-xdbq-001.cbibbbyejjpu.us-east-1.rds.amazonaws.com",password = "PaJvXnqj4yZYrqF7",dbname = "xadmin")
    return(TRUE)
  }

  if(datacenter=="Frankfurt"){
    setPSQLdefaultConnection(user = 'xadmin', password = "v895IqETJvcu4LY",port = "5432", dbname = "xadmin",
                             host = "euc1-xdbx-001.czjbua2mrfjz.eu-central-1.rds.amazonaws.com")
    return(TRUE)
  }



  if(datacenter=="USBackup"){
    setPSQLdefaultConnection(user = 'adietrichson', password = "PaJvXnqj4yZYrqF7",port = "5432", dbname = "xadmin",
                             host = "use1-xdbx-restore.cbibbbyejjpu.us-east-1.rds.amazonaws.com")
    return(TRUE)
  }

  if(datacenter=="Virginia"){
    setPSQLdefaultConnection(user = 'adietrichson', password = "PaJvXnqj4yZYrqF7",port = "5432", dbname = "xadmin",
                             host = "use1-xdbm-001.cbibbbyejjpu.us-east-1.rds.amazonaws.com")
    return(TRUE)
  }

  warning("Data Center not available")
  return(FALSE)
}