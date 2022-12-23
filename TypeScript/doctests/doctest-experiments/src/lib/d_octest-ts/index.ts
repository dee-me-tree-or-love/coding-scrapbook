import { _fastFib } from "../fastFib";

/** Compute the n'th Fibonacci number

 doctestTsFastFib(0); // => 0
 doctestTsFastFib(1); // => 1
 doctestTsFastFib(5); // => 5
 doctestTsFastFib(7); // => 13
 */
export function doctestTsFastFib(n: number): number {
  return _fastFib(n);
}
