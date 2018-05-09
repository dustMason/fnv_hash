#[macro_use]

extern crate helix;
extern crate fnv;

use fnv::FnvHasher;
use std::hash::Hasher;

ruby! {
    class FnvHash {
        def digest(str: String) -> u64 {
            let mut hasher = FnvHasher::default();
            hasher.write(str.as_bytes());
            hasher.finish()
        }
    }
}
