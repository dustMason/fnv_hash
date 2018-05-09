FNV Hash
---

A ruby gem built using [helix](https://usehelix.com) and rust to wrap the [fnv crate](https://crates.io/crates/fnv) which provides hash digests using the [fnv hash function](http://www.isthe.com/chongo/tech/comp/fnv/index.html).

[This comparison](http://cglab.ca/~abeinges/blah/hash-rs/) explains when you'd want to use FNV and what it's good/not good at.

Usage
---

```ruby
require 'fnv_hash'

FnvHash.digest("some_input_string_123")
```

Performance
---

```ruby
require 'benchmark'
require 'zlib'
require 'digest'

words = File.readlines("/usr/share/dict/words")

Benchmark.bmbm do |x|
  x.report("fnv_hash") { words.each { |w| FnvHash.digest(w) } }
  x.report("crc32") { words.each { |w| Zlib.crc32(w) } }
  x.report("md5") { words.each { |w| Digest::MD5.hexdigest(w) } }
end
```

Results:

```
Rehearsal --------------------------------------------
fnv_hash   0.146668   0.003837   0.150505 (  0.150686)
crc32      0.020776   0.000024   0.020800 (  0.020826)
md5        0.274458   0.008613   0.283071 (  0.284220)
----------------------------------- total: 0.454376sec

               user     system      total        real
fnv_hash   0.130688   0.000512   0.131200 (  0.131452)
crc32      0.020523   0.000038   0.020561 (  0.020589)
md5        0.229894   0.004302   0.234196 (  0.234859)
```