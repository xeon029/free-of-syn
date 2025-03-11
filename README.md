# free of syn

[![free of syn](https://img.shields.io/badge/free%20of-syn-hotpink)](https://github.com/fasterthanlime/free-of-syn)

Rid your rust crate of [syn](https://crates.io/crates/syn)!

"free of syn" is a movement — Rust crates shouldn't take forever to build.

And often, the culprit is proc macro crates that pull in heavy dependencies
like [syn](https://crates.io/crates/syn).

## What's the alternative?

Declarative macros (much faster, and cacheable!) may be more capable than
you realize!

  * Read [The Little Book of Rust Macros](https://veykril.github.io/tlborm/)

If you _have_ to use proc macros, then you may be interested in
[unsynn](https://crates.io/crates/unsynn), which allows writing proc-macro
parsers without heavy dependencies.

## Enforce it in CI

To make sure your crate is free of syn, add the following bit of bash
to your CI pipeline:

```bash
if ! cargo tree -i syn 2>/dev/null | grep -q .; then
echo -e "\033[38;2;255;255;255;48;2;0;0;0m free of \033[38;2;255;255;255;48;2;255;105;180m syn \033[38;2;255;255;255;48;2;0;0;0m\033[0m"
else
  echo -e "\033[1;31m❌ 'syn' found in dependency tree. Here's what's using 'syn':\033[0m"
  cargo tree -i syn -e features
  exit 1
fi
```

Here's just the badge, as ANSI escapes:

```raw
\033[38;2;255;255;255;48;2;0;0;0m free of \033[38;2;255;255;255;48;2;255;105;180m syn \033[38;2;255;255;255;48;2;0;0;0m\033[0m
```

It renders as:

![example ANSI/terminal badge rendering](https://github.com/user-attachments/assets/e520c39b-988c-45dc-a555-553b713f2f57)

## Spread the word

If you have a crate that's free of syn, you can display your support for
the "free of syn" campaign with a badge:

```markdown
[![free of syn](https://img.shields.io/badge/free%20of-syn-hotpink)](https://github.com/fasterthanlime/free-of-syn)
```

![example badge rendering in the shapely readme](https://github.com/user-attachments/assets/7148db83-10aa-4339-8537-fed3fe56d13d)

## Hall of fame

These projects are free of syn (submit a PR to add yours):

  * [shapely](https://github.com/bearcove/shapely) is a reflection and serialization/deserialization framework for Rust
