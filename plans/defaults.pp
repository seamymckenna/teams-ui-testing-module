# A plan that prints out the variable results once for each node specified
# specified targets.
#
# @param targets Targets to run the task against.
# @param no_default_required A required string parameter with no specified default value
# @param default_required A required string parameter
# @param no_default_optional An optional string parameter with no specified default value
# @param default_optional An optional string parameter with a specified default value
plan teams_ui_testing_module::defaults(
  TargetSpec $targets,
  String $no_default_required,
  String $default_required = 'default_required',
  Optional[String] $no_default_optional,
  Optional[String] $default_optional = 'default_optional',
  ) {
  # run our test task
  run_task(
    'teams_ui_testing_module::defaults',
    $targets,
    no_default_required => $no_default_required,
    default_required => $default_required,
    no_default_optional => $no_default_optional,
    default_optional => $default_optional,
    )

  out::message('Test output message')

  return 'Plan completed'
}
