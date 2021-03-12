# A plan that has an optional targetspec param
# @param targets Targets to run the first task against.
plan teams_ui_testing_module::optional_target(Optional[TargetSpec] $targets) {
  out::message('Test output message')

  return 'Plan completed'
}
