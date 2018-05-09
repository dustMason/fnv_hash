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