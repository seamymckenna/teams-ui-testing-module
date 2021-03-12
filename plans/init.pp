# A plan that prints out the variable results once for each node specified
# specified targets.
#
# @param targets Targets to run against.
# @param string A required string
# @param boolean A required boolean
# @param non_empty_string A string parameter that can't be empty Defaults to 'default_string'.
# @param optional_boolean An optional boolean. Defaults to true.
# @param enum An enum with different options. Defaults to option1.
# @param integer An integer parameter. Defaults to 5.
# @param array An array parameter. Defaults to ['default_string_1', 'default_string_2'].
# @param pattern A pattern that must be a capitalised word e.g. Test. Defaults to 'Test'.
# @param variant Input must be either an integer or a capitalised word e.g. 5 or 'Test'. Defaults to 'Test'.
# @param hash A json object. Defaults to {}.
plan teams_ui_testing_module(
  TargetSpec $targets,
  String $string = undef,
  Boolean $boolean = undef,
  Optional[String[1]] $non_empty_string = 'default_string',
  Optional[Boolean] $optional_boolean = true,
  Optional[Enum[option1, option2, option3, option4]] $enum = 'option1',
  Optional[Integer] $integer = 5,
  Optional[Array[String]] $array = ['default_string_1', 'default_string_2'],
  Optional[Pattern[/^[A-Z][a-z]*$/]] $pattern = 'Test',
  Optional[Variant[Pattern[/^[A-Z][a-z]*$/],Integer]] $variant = 'Test',
  Optional[Hash] $hash = {},
  ) {
  # run our test task
  run_task(
    'teams_ui_testing_module',
    $targets,
    string => $string,
    boolean => $boolean,
    non_empty_string => $non_empty_string,
    optional_boolean => $optional_boolean,
    enum => $enum,
    integer => $integer,
    array => $array,
    pattern => $pattern,
    variant => $variant,
    hash => $hash,
    )

  # run the same task a second time
  run_task(
    'teams_ui_testing_module',
    $targets,
    string => $string,
    boolean => $boolean,
    non_empty_string => $non_empty_string,
    optional_boolean => $optional_boolean,
    enum => $enum,
    integer => $integer,
    array => $array,
    pattern => $pattern,
    variant => $variant,
    hash => $hash,
    )
  out::message('Test output message')
  upload_file('test.txt', 'tmp/test.txt', $targets, 'Uploaded a file', { _catch_errors => false, _run_as => 'root' })

  return 'Plan completed'
}
