% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/import_rds.R
\name{import_rds}
\alias{import_rds}
\title{Read RDS file}
\usage{
import_rds(file, FUN = readRDS, data_source = flyio_get_datasource(),
  bucket = flyio_get_bucket(data_source), dir = flyio_get_dir(),
  delete_file = TRUE, show_progress = FALSE, ...)
}
\arguments{
\item{file}{path of the file to be read}

\item{FUN}{the function using which the file is to be read}

\item{data_source}{the name of the data source, if not set globally. s3, gcs or local}

\item{bucket}{the name of the bucket, if not set globally}

\item{dir}{the directory to store intermediate files}

\item{delete_file}{logical. to delete the file downloaded}

\item{show_progress}{logical. Shows progress of the download operation}

\item{...}{other parameters for the FUN function defined above}
}
\value{
the output of the FUN function
}
\description{
Read R data - RDS file from anywhere
}
\examples{
\dontrun{
# Import RDS from Google Cloud
flyio_set_datasource("gcs")
flyio_set_bucket("your-bucket-name")
import_rds("rds-on-cloud.rds", readRDS, dir = tempdir())
}
}
