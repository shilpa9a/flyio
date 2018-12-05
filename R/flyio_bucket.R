#' Set global bucket name for flyio
#' @description Set global bucket name to be used for all the function in flyio
#' @param bucket the bucket name to be set
#' @param data_source the data source used for IO. Default chooses the data source set using flyio_set_datasource()
#'
#' @return stores the bucket name in a global environment under rioBucketGcs or rioBucketS3
#' @export "flyio_set_bucket"
#' @import "stringr"
#'
#' @examples flyio_set_bucket(bucket = "socialcops-test", data_source = "S3")
flyio_set_bucket <- function(bucket, data_source = flyio_get_datasource()){
  assert_that(is.string(bucket) && bucket != "", msg = "Enter a valid bucket name")
  assert_that(str_to_lower(data_source) %in% c("gcs", "s3", "local"), msg = "Enter a valid data source")
  data_source = str_to_title(data_source)
  if(data_source == "Gcs"){
    Sys.setenv("rioBucketGcs" = bucket)
    message("Default bucket name for ",data_source ," set to '",bucket,"'")
  } else if(data_source == "S3"){
    Sys.setenv("rioBucketS3" = bucket)
    message("Default bucket name for ",data_source ," set to '",bucket,"'")
  } else if(data_source == "Local"){
    message("For local data source, bucket name not required")
  }

}

#' Get global bucket name for flyio
#' @description Get global bucket name to be used for all the function in flyio
#' @param data_source the data source used for IO. Default chooses the data source set using flyio_set_datasource()
#' @return the string - bucket name stored
#' @details if the data source is local, then an empty string is returned
#' @export "flyio_get_bucket"
#' @import "stringr"
#'
#' @examples
#' # first setting the bucket for a data source
#' flyio_set_bucket(bucket = "socialcops-test", data_source = "S3")
#' # retrieving the bucket for S3
#' flyio_get_bucket(data_source = "S3")
flyio_get_bucket <- function(data_source = flyio_get_datasource()){
  assert_that(str_to_lower(data_source) %in% c("gcs", "s3", "local"), msg = "Enter a valid data source")
  data_source = str_to_title(data_source)
  if(data_source == "Local") return("")
  bucket = Sys.getenv(paste0("rioBucket",data_source))
  invisible(assert_that(is.string(bucket) && bucket != "", msg = "No bucket set. Use flyio_set_bucket to set the bucket name globally."))
  return(bucket)
}