# @since 1.0.0
type OpenSSH::Forward::Dynamic = Variant[Bodgitlib::Port, Tuple[Variant[IP::Address::NoSubnet, Enum['*', 'localhost']], Bodgitlib::Port]]
