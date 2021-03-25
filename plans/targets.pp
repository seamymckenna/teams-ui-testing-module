# A plan that prints out the variable results once for each node specified
# specified targets.
#
# @param targets Targets to run the first task against.
# @param other_targets Targets to run the second task against.
# @param string A required string
# @param boolean A required boolean
# @param wait_for_seconds How many seconds to sleep for during the wait task. Defaults to 10.
plan teams_ui_testing_module::targets(
  TargetSpec $targets,
  TargetSpec $other_targets,
  String $string,
  Boolean $boolean,
  Optional[Integer] $wait_for_seconds = 10,
  ) {
  # run our test task
  run_task(
    'teams_ui_testing_module',
    $targets,
    string => 'string',
    boolean => true,
    )

  # run the wait task against the second set of targets
  run_task(
    'teams_ui_testing_module::wait',
    $other_targets,
    wait_for_seconds => $wait_for_seconds,
    )

  # run the wait task against the second set of targets again
  run_task(
    'teams_ui_testing_module::wait',
    $other_targets,
    wait_for_seconds => $wait_for_seconds,
    )
  out::message('Test output message')

  return 'Plan completed'
}
