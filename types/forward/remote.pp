# @since 1.0.0
type OpenSSH::Forward::Remote = Tuple[Variant[Bodgitlib::Port, Tuple[Variant[IP::Address::NoSubnet, Enum['*']], Bodgitlib::Port]], Tuple[Bodgitlib::Host, Bodgitlib::Port]]
