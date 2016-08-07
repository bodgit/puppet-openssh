# @since 1.0.0
type OpenSSH::RekeyLimit = Tuple[Variant[Pattern[/\A\d+[KMG]\Z/], Enum['default']], Variant[OpenSSH::TimeFormat, Enum['none']], 1, 2]
