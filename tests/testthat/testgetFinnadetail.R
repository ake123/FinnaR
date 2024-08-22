test_that("extract_finna_details returns expected fields", {
  # Test with a known valid record ID
  record_id <- "fikka.3405646"

  result <- extract_finna_details(record_id)

  # Check that the result is a list
  expect_type(result, "list")

  # Check that the result contains the expected fields
  expect_true("title" %in% names(result))
  expect_true("building_name" %in% names(result))
  expect_true("series_name" %in% names(result))

  # Check that the title is not NULL or NA
  expect_false(is.null(result$title))
  expect_false(is.na(result$title))

  # Since "building_name" and "series_name" might be NA if not available, just check their presence
  expect_true(!is.null(result$building_name) || is.na(result$building_name))
  expect_true(!is.null(result$series_name) || is.na(result$series_name))
})

test_that("extract_finna_details handles invalid IDs gracefully", {
  # Test with an invalid record ID
  invalid_record_id <- "invalid_id"

  # Suppress warnings during this test
  result <- suppressWarnings(extract_finna_details(invalid_record_id))

  # Check that the function returns NULL for an invalid ID
  expect_null(result)
})
