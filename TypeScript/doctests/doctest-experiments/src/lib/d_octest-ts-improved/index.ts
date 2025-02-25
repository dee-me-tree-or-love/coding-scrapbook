import { _fastFib } from "../fastFib";

/**
 * Compute the n'th Fibonacci number
 * @param n required order
 * @returns computed number
 * @example test
 * doctestTsImprovedFastFib(0); // => 0
 * doctestTsImprovedFastFib(1); // => 1
 * doctestTsImprovedFastFib(5); // => 5
 * doctestTsImprovedFastFib(7); // => 13
 */
export function doctestTsImprovedFastFib(n: number): number {
  return _fastFib(n);
}
