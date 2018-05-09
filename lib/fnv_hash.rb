require "helix_runtime"

begin
  require "fnv_hash/native"
rescue LoadError
  warn "Unable to load fnv_hash/native. Please run `rake build`"
end
