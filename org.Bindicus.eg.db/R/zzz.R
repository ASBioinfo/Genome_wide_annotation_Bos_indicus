datacache <- new.env(hash=TRUE, parent=emptyenv())

org.Bindicus.eg <- function() showQCData("org.Bindicus.eg", datacache)
org.Bindicus.eg_dbconn <- function() dbconn(datacache)
org.Bindicus.eg_dbfile <- function() dbfile(datacache)
org.Bindicus.eg_dbschema <- function(file="", show.indices=FALSE) dbschema(datacache, file=file, show.indices=show.indices)
org.Bindicus.eg_dbInfo <- function() dbInfo(datacache)

org.Bindicus.egORGANISM <- "Bos indicus"

.onLoad <- function(libname, pkgname)
{
    ## Connect to the SQLite DB
    dbfile <- system.file("extdata", "org.Bindicus.eg.sqlite", package=pkgname, lib.loc=libname)
    assign("dbfile", dbfile, envir=datacache)
    dbconn <- dbFileConnect(dbfile)
    assign("dbconn", dbconn, envir=datacache)

    ## Create the OrgDb object
    sPkgname <- sub(".db$","",pkgname)
    db <- loadDb(system.file("extdata", paste(sPkgname,
      ".sqlite",sep=""), package=pkgname, lib.loc=libname),
                   packageName=pkgname)    
    dbNewname <- AnnotationDbi:::dbObjectName(pkgname,"OrgDb")
    ns <- asNamespace(pkgname)
    assign(dbNewname, db, envir=ns)
    namespaceExport(ns, dbNewname)
        
    packageStartupMessage(AnnotationDbi:::annoStartupMessages("org.Bindicus.eg.db"))
}

.onUnload <- function(libpath)
{
    dbFileDisconnect(org.Bindicus.eg_dbconn())
}

