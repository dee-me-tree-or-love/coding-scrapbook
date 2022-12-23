# Doctest experiments for TypeScript

## Considered packages

- [`doctest`](https://github.com/davidchambers/doctest)
- [`power-doctest` (or `comment-to-assert`)](https://github.com/azu/power-doctest)
- [`doctest-ts-improved`](https://www.npmjs.com/package/doctest-ts-improved)
- [`doctest-ts`](https://github.com/danr/doctest-ts)
- [`@linus/testy`](https://github.com/linus/testy)

## Method

Run `npm test` to trigger all considered options.

## Results

> Result emojis:
>
> - 🧛 - fits a different use case
> - 🧝 - seems to work well
> - 🧞 - ultimate solution
> - 🧜 - couldn't get it working

### Typescript-native tests

| Package | Result | Remarks |
| -- | -- | -- |
| [`doctest`](https://github.com/davidchambers/doctest) | 🧛 | no native TypeScript support |
| [`power-doctest` (or `comment-to-assert`)](https://github.com/azu/power-doctest) | 🧛 | no native TypeScript support; acts as `assert` statements |
| [`doctest-ts-improved`](https://www.npmjs.com/package/doctest-ts-improved) | 🧜 | looks like an inofficial fork of `doctest-ts` ; produces extra files ; opinionated about file naming ; implicitly requires additional dependency `mocha` |
| [`doctest-ts`](https://github.com/danr/doctest-ts) | 🧜 | the project appears inactive with last release dated 4 years ago ; allows producing Jest or Mocha-based doctest files ; somehow still did not manage to get it run |
|[`@linus/testy`](https://github.com/linus/testy)| 🧜 | the project is a response to `doctest-ts` but is fitted for Node.js; for now it is not very mature; requires providing separate `jest`-based spec files to trigger doctest checking; limits the checks to non-default "exported" functions |
