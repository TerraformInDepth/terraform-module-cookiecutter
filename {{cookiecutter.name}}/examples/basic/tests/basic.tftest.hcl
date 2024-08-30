variables {
  test_input = "test"
}

run "input_and_output_match" {

  assert {
    condition     = output.test_output == "test"
    error_message = "The output does not match the input."
  }
}
